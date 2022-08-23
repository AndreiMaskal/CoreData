//
//  usersPresenter.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 21/08/2022.
//

import Foundation

class UsersPresenter {
    
    var users: [Person] = []

    
    func fetchData() {
        ServiceCoreData.shared.fetchData()
    }
    
    func save(_ nameUser: String) {
        ServiceCoreData.shared.save(nameUser)
    }
    
    func deleteUser(_ user: Person, indexPath: IndexPath) {
        ServiceCoreData.shared.deleteUser(user, indexPath: indexPath)
    }
}

