//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Vanessa Flores on 8/25/20.
//  Copyright © 2020 Rising Dev Habits. All rights reserved.
//

import Foundation
import UserNotifications

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
    
    func toggleChecked() {
        checked.toggle()
    }
    
    func scheduleNotification() {
        removeNotification()
        
        if shouldRemind && dueDate > Date() {
            let content = UNMutableNotificationContent()
            content.title = "Reminder:"
            content.body = text
            content.sound = UNNotificationSound.default
            
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: dueDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            center.add(request)
        }
    }
    
    func removeNotification() {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(itemID)"])
    }
    
    deinit {
        removeNotification()
    }
}
