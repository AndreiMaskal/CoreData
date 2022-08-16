//
//  UsersViewController.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 13/08/2022.
//

import UIKit

class UsersViewController: UIViewController {
    
    let custoCellUsers = UsersCustomCell()
    
    private lazy var textLabelField: UITextField = {
        var label = UITextField()
        label.placeholder = "print your here name"
        label.backgroundColor = .systemGray3
        label.borderStyle = .roundedRect
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonPress: UIButton = {
        var button = UIButton()
        button.backgroundColor = .gray
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.setTitle("Press", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.477409184, blue: 1, alpha: 1)
        
        button.translatesAutoresizingMaskIntoConstraints = false
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
        table.register(UsersCustomCell.self, forCellReuseIdentifier: custoCellUsers.cellUsersId)
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupView()
        setupLoyaut()
        addStackView()
    }
    
    func setupNavigation() {
        navigationItem.title = "Users"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupView() {
        view.addSubview(textLabelField)
        view.addSubview(buttonPress)
        view.addSubview(userStackView)
        view.addSubview(tableView)
    }
    
    private func addStackView() {
        userStackView.addArrangedSubview(textLabelField)
        userStackView.addArrangedSubview(buttonPress)
    }
    
    func setupLoyaut() {
        
        NSLayoutConstraint.activate([
            userStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: custoCellUsers.cellUsersId, for: indexPath) as? UsersCustomCell else { return UITableViewCell()
        }
        return cell
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}



