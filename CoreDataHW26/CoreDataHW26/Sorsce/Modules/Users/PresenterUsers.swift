//
//  PresenterUsers.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 17/08/2022.
//

//import Foundation
//
//protocol PresenterUsersProtocol {
//    var reload: (() -> Void)? { get set }
//    func saveData(from text: String)
//    func getData()
//}
//
//class UsersPresenter: UsersPresenterProtocol {
//    var reload: (() -> Void)?
//    var usersCount: Int
//
//    func user(at index: Int) -> UserInfo {
//        users[index]
//    }
//
//    func saveData(from text: String) {
//        CoreDataService.shared.uploadIntoCoreData(from: text)
//    }
//
//    func getData() {
//        users = CoreDataService.shared.getUsersFromCoreData()
//        self.reload?()
//    }
//
//    func delete(at indexPath: Int) {
////        users.remove(at: indexPath)
//        CoreDataService.shared.deleteObject(array: users, indexPath: indexPath)
//        users.remove(at: indexPath)
//    }
//}
