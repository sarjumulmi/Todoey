//
//  Category.swift
//  Todoey
//
//  Created by Sarju Mulmi on 8/23/18.
//  Copyright © 2018 Sarju Mulmi. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var backgroundColor: String = ""
    let items = List<Item>()
    
}
