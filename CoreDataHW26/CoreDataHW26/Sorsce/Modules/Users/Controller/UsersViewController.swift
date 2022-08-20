//
//  UsersViewController.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 13/08/2022.
//

import UIKit
import CoreData

class UsersViewController: UIViewController {
    
    var name: [Person] = []
    
    let customCellUsers = UsersCustomCell()
        
    private var userView: UsersView? {
        guard isViewLoaded else { return nil}
        return view as? UsersView
    }
    
    private var detailView: DetailInfoView? {
        guard isViewLoaded else { return nil}
        return view as? DetailInfoView
    }
    
    var users = [String]()
    
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
    // для добавления оной строки, вместо reloаdData
    private func reload() {
        users.append(userView?.selfTextField.text ?? "")
        userView?.tableView.insertRows(at: [IndexPath(row: users.count - 1, section: 0)], with: .automatic)
        
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
        cell.textLabel?.text = users[indexPath.row]
        cell.setupTable()
        return cell
    }
    
    // deleting data
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delete(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(InfoUsersViewController(), animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}







