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
    var dueDate: Date = Date()
    var shouldRemind: Bool
    var itemID = -1
    
    init(text: String = "", checked: Bool = false, shouldRemind: Bool = false) {
        self.text = text
        self.checked = checked
        self.shouldRemind = shouldRemind
        
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
    
//    override init() {
//        super.init()
//        itemID = DataModel.nextChecklistItemID()
//    }
    
    func toggleChecked() {
        checked.toggle()
    }
}
