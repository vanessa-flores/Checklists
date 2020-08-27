//
//  Checklist.swift
//  Checklists
//
//  Created by Vanessa Flores on 8/27/20.
//  Copyright © 2020 Rising Dev Habits. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    
    var name: String = ""
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
