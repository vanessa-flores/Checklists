//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Vanessa Flores on 8/25/20.
//  Copyright © 2020 Rising Dev Habits. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    
    @IBAction private func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func done() {
        print("Contents of the text field: \(textField.text!)")
        
        navigationController?.popViewController(animated: true)
    }
}
