//
//  SetupCell.swift
//  CoreDataHW26
//
//  Created by Andrei Maskal on 16/08/2022.
//

import Foundation

struct SetupCellInfo: SetupCell {
    
    var image: String
    var detailText: String?
}

class Setup {
    
    static func setupCellInfo() -> [SetupCellInfo] {
        
        let sectionOne = [SetupCellInfo(image: "person"),
                          SetupCellInfo(image: "calendar"),
                          SetupCellInfo(image: "figure.stand.line.dotted.figure.stand", detailText: "Other")]
        
        return sectionOne
    }
}
