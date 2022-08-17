//
//  UsersViewController.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 13/08/2022.
//

import UIKit

class UsersViewController: UIViewController {
    
    let customCellUsers = UsersCustomCell()
    
    var users = [String]()
    
    private lazy var selfTextField: UITextField = {
            let textField = UITextField()
            textField.layer.masksToBounds = true
            textField.layer.cornerRadius = 5
            textField.borderStyle = .roundedRect
            textField.placeholder = "print your here name"
            return textField
    }()
    
    private lazy var buttonPress: UIButton = {
        var button = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        config.title = "Press"
        button.configuration = config
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 0, green: 0.477409184, blue: 1, alpha: 1)
        return button
    }()
    
    private lazy var userStackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds, style: .insetGrouped)
        table.register(UsersCustomCell.self, forCellReuseIdentifier: customCellUsers.cellUsersId)
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private func setupAction() {
        buttonPress.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }

    @objc private func createButtonTapped() {
        if !selfTextField.hasText {
            print("empty")
        } else {
            print(selfTextField.text ?? "")
            reload()
            print(users)
            selfTextField.text = ""
            selfTextField.isSelected = false
        }
    }
    
    private func reload() {
        users.append(selfTextField.text ?? "")
        tableView.reloadData()
        
    }
    
    func delete(at indexPath: Int) {
        users.remove(at: indexPath)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupView()
        setupAction()
        setupLoyaut()
        addStackView()
    }
    
    func setupNavigation() {
        navigationItem.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupView() {
        view.addSubview(selfTextField)
        view.addSubview(buttonPress)
        view.addSubview(userStackView)
        view.addSubview(tableView)
    }
    
    private func addStackView() {
        userStackView.addArrangedSubview(selfTextField)
        userStackView.addArrangedSubview(buttonPress)
    }
    
    func setupLoyaut() {
        
        NSLayoutConstraint.activate([
            userStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            userStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            userStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: userStackView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
    }
}

extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellUsers.cellUsersId, for: indexPath) as? UsersCustomCell else { return UITableViewCell()
        }
        cell.textLabel?.text = users[indexPath.row]
        cell.setupTable()
        return cell
    }
    // deliting data
    
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







