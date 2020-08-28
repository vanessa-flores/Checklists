//
//  IconPickerViewController.swift
//  Checklists
//
//  Created by Vanessa Flores on 8/28/20.
//  Copyright © 2020 Rising Dev Habits. All rights reserved.
//

import UIKit

protocol IconPickerViewControllerDelegate: class {
    func iconPicker(_ picker: IconPickerViewController, didPick iconName: String)
}

class IconPickerViewController: UITableViewController {
    
    // MARK: - Properties
    
    weak var delegate: IconPickerViewControllerDelegate?
    let icons = [
        "No Icon", "Appointments", "Birthdays", "Chores",
        "Drinks", "Folder", "Groceries", "Inbox", "Photos", "Trips"
    ]

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            let iconName = icons[indexPath.row]
            delegate.iconPicker(self, didPick: iconName)
        }
    }
}
