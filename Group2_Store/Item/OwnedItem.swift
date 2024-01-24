//
//  OwnedItem.swift
//  Group2_Store
//
//  Created by macbook on 23/1/2024.
//

import Foundation

class OwnedItem: Item {
    var minutesUsed: Int = 0
    convenience init(item: Item){
        self.init(id: item.id, title: item.title, price: item.price)
    }
}
