//
//  InfoUsersViewController.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 16/08/2022.
//

import UIKit

class InfoUsersViewController: UIViewController {
    
    var detailView: DetailInfoView! {
        guard isViewLoaded else { return nil}
        return view as? DetailInfoView
    }
        
    private lazy var editButton = UIBarButtonItem(title: "Edit",
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(editButtonAction))
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
            setupEditButton()
            toogleUserIterations(active: isEditing)
        }
        
        func setupView() {
            view = DetailInfoView()
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

