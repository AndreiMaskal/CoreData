//
//  InfoUsersViewController.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 16/08/2022.
//

import UIKit

class InfoUsersViewController: UIViewController {
    
    let customCellInfoUsers = InfoUsersCustomCell()
    let dataSetupCell = Setup.setupCellInfo()
    
    private lazy var photoUser: UIImageView = {
        var imageView = UIImageView()
        var image = UIImage(named: "Icon")
        imageView.image = image
        imageView.clipsToBounds = true
        let imageHeightWidth: CGFloat = 150
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageHeightWidth / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds, style: .plain)
        table.register(InfoUsersCustomCell.self, forCellReuseIdentifier: customCellInfoUsers.cellInfoUsersId)
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupView()
        setupLoyaut()
    }
    
   private func setupNavigation() {
       navigationItem.rightBarButtonItem = editButtonItem

    }
    
    private func setupView() {
        view.addSubview(photoUser)
        view.addSubview(tableView)
      
    }
        
    func setupLoyaut() {
        
        NSLayoutConstraint.activate([
            photoUser.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            photoUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoUser.heightAnchor.constraint(equalToConstant: 150),
            photoUser.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: photoUser.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension InfoUsersViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellInfoUsers.cellInfoUsersId, for: indexPath) as? InfoUsersCustomCell else { return UITableViewCell()
        }
        
        
        cell.setupTable()
        return cell
    }
    
}

extension InfoUsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 75
    }
}

