//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Vanessa Flores on 8/25/20.
//  Copyright © 2020 Rising Dev Habits. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text: String = ""
    var checked: Bool = false
    
    func toggleChecked() {
        checked.toggle()
    }
}
