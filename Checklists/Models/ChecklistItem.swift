//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Vanessa Flores on 8/25/20.
//  Copyright © 2020 Rising Dev Habits. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text: String
    var checked: Bool
    
    init(text: String = "", checked: Bool = false) {
        self.text = text
        self.checked = checked
        
        super.init()
    }
    
    func toggleChecked() {
        checked.toggle()
    }
}
