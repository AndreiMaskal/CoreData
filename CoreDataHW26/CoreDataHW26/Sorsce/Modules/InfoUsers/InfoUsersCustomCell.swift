//
//  InfoUsersCustomCell.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 16/08/2022.
//

import UIKit

class InfoUsersCustomCell: UITableViewCell {
    
    let cellInfoUsersId = "cellInfoUsersId"
    
    private lazy var imageSystems: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: cellInfoUsersId)
        setupHyerarhy()
        setupLoyaut()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupTable() {
    }
    
    func setupInfoCell(data: SetupCellInfo) {

        let imageSystem = data.image
        imageSystems.image = UIImage(systemName: imageSystem)
        
        detailTextLabel?.text = data.detailText
    
        }
    
   private func setupHyerarhy() {
        
        addSubview(imageSystems)
    }
    
    private func setupLoyaut() {
        
        NSLayoutConstraint.activate([
            imageSystems.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageSystems.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageSystems.widthAnchor.constraint(equalToConstant: 25),
            imageSystems.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    }

