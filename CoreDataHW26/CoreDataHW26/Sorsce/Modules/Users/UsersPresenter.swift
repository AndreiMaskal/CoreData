//
//  usersPresenter.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 21/08/2022.
//

import Foundation

//protocol UsersPresenterProtocol {
//    var reload: (() -> Void)? { get set }
////    func saveData(from text: String)
////    func getData()
//}

class UsersPresenter {
//    var reload: (() -> Void)?
    var users = [Person]()
    var usersCount: Int {
        users.count
    }
}

