//
//  usersPresenter.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 21/08/2022.
//

import Foundation

//protocol MainViewProtocol: AnyObject {
//    func reloadData()
//}

//protocol MainPresenterProtocol: AnyObject {
//    init(view: UsersViewController)
//    var persons: [Person] {get set}
//    func updateProfiles()
//    func addProfile(name: String)
//    func deleteProfile(index: Int, completion: @escaping () -> ())
//    func tapOnTheRow(person: PersonModel)
//}

//class UsersPresenter {
//    var users: [Person] = []
    
//    required init(view: MainViewProtocol, dataLayer: DataLayerProtocol, router: RouterModuleProtocol) {
//        self.view = view
//    }
//    
//    func updateProfiles() {
//        guard let persons = dataLayer?.fetchPersonModel() else { return }
//        self.persons = persons
//    }
//
//    func addProfile(name: String) {
//        dataLayer?.addProfile(name: name) {
//            self.updateProfiles()
//            self.view?.reloadData()
//        }
//    }
//
//    func deleteProfile(index: Int, completion: @escaping () -> ()) {
//        guard let person = dataLayer?.fetchPersonModel()?[index] else { return }
//        dataLayer?.deleteProfile(profile: person) {
//            self.updateProfiles()
//            completion()
//        }
//    }
//
//    func tapOnTheRow(person: PersonModel) {
//        router?.showDetailViewController(person: person)
//    }
//}

