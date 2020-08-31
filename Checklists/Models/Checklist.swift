//
//  Checklist.swift
//  Checklists
//
//  Created by Vanessa Flores on 8/27/20.
//  Copyright © 2020 Rising Dev Habits. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    
    var name: String
    var items: [ChecklistItem] = []
    var iconName: String
    
    init(name: String = "", iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        
        return count
    }
    
    func sortByDueDate() {
        items.sort(by: { item1, item2 in
            return item1.dueDate.compare(item2.dueDate) == .orderedAscending
        })
    }
    
    func sortChecklistItemsByFutureDate() {
        sortByDueDate()
        
        let itemsWithFutureDueDate = items.filter { $0.dueDate > Date() }
        let itemsWithPastDueDate = items.filter { $0.dueDate < Date() }

        items = itemsWithFutureDueDate
        items.append(contentsOf: itemsWithPastDueDate)
        
    }
}
