//
//  InfoUsersViewController.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 16/08/2022.
//

import UIKit
import CoreData

class InfoUsersViewController: UIViewController {
    
    var detailView: DetailInfoView! {
        guard isViewLoaded else { return nil}
        return view as? DetailInfoView
    }
    
    var presenter: DetailsPresenter!
    
    private lazy var editButton = UIBarButtonItem(title: "Edit",
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(editButtonAction))
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
            setupEditButton()
            toogleUserIterations(active: isEditing)
            detailView.configure(from: presenter.user)
        }
        
        func setupView() {
            view = DetailInfoView()
            detailView.nameTextField.delegate = self
        }
    
        private func setupEditButton() {
            navigationItem.rightBarButtonItem = editButton
        }
        
        private func toogleUserIterations(active: Bool) {
            [detailView.parentStackView].forEach {
                $0?.isUserInteractionEnabled = active
            }
        }
        
        @objc func editButtonAction() {
            if self.isEditing {
                self.setEditing(false, animated: true)
                editButton.title = "Edit"
            } else {
                self.setEditing(true, animated: true)
                editButton.title = "Save"
            }
            toogleUserIterations(active: self.isEditing)
        }
}

extension InfoUsersViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
