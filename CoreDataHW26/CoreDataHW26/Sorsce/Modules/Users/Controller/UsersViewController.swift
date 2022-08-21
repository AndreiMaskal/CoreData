//
//  UsersViewController.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 13/08/2022.
//

import UIKit
import CoreData

class UsersViewController: UIViewController {
    
    let customCellUsers = UsersCustomCell()
    var users: [Person] = []
    private let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var userView: UsersView? {
        guard isViewLoaded else { return nil}
        return view as? UsersView
    }
    
    private var detailView: DetailInfoView? {
        guard isViewLoaded else { return nil}
        return view as? DetailInfoView
    }
        
    private func setupAction() {
        userView?.buttonPress.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }
    
    @objc private func createButtonTapped() {
        if !(userView?.selfTextField.hasText ?? true) {
            showAlert(title: "Error", message: "Enter name")
        } else {
            reload()
            userView?.selfTextField.text = ""
            userView?.selfTextField.isSelected = false
   
        }
    }
   
    private func reload() {
        save(userView?.selfTextField.text ?? "")
    }
    
    private func save(_ nameUser: String) {
   
        // Entity name
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: managedContext) else { return }
        // Model
        let user = NSManagedObject(entity: entityDescription, insertInto: managedContext) as! Person
        
        user.name = nameUser
        
        do {
            try managedContext.save()
            users.append(user)
            // для добавления оной строки, вместо reloаdData
            userView?.tableView.insertRows(at: [IndexPath(row: users.count - 1, section: 0)], with: .automatic)

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func fetchData() {
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            users = try managedContext.fetch(fetchRequest)
            
        } catch let error {
            print(error.localizedDescription)
        }

    }
    
    func delete(at indexPath: Int) {
        users.remove(at: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigation()
        setupAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    func setupView() {
        view = UsersView()
        userView?.tableView.dataSource = self
        userView?.tableView.delegate = self
    }
    
    func setupNavigation() {
        navigationItem.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // Alert
    public func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Close", style: .cancel)
        alert.addAction(okButton)
        navigationController?.present(alert, animated: true)
    }
}

extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersCustomCell.cellUsersId, for: indexPath) as? UsersCustomCell else { return UITableViewCell()
        }
        cell.textLabel?.text = users[indexPath.row].name
        cell.setupTable()
        return cell
    }
    
    // deleting data
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let user = users[indexPath.row]
        if editingStyle == .delete {
            deleteUser(user, indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // deletind data base
    func deleteUser(_ user: Person, indexPath: IndexPath) {
        managedContext.delete(user)
        
        do {
            try managedContext.save()
            users.remove(at: indexPath.row)
        } catch let error {
            print("Error delete tata base: \(error)")
        }
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(InfoUsersViewController(), animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}







