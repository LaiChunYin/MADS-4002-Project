//
//  Item.swift
//  Group1_Store
//
//  Created by macbook on 18/1/2024.
//

import Foundation

class Item: IsPurchasable {
    var id: Int
    var title: String
    var price: Double
    
    init(id: Int, title: String, price: Double) {
        self.id = id
        self.title = title
        self.price = price
    }
    
    var info: String {
        get {
            return "\(self.title), $\(self.price)\n"
        }
    }
    
    func printReceipt(isRefund: Bool, amount: Double) {
        print("""
            -------------------------
            YOUR RECEIPT
            -------------------------
            """)
        if isRefund {
            print("We are refunding the purchase of Heroes: \(self.title)")
            print("Refund amount: $\(self.price * amount)")
        }
        else {
            print("Thank you for purchasing Heroes: \(self.title)")
            print("Purchase amount: $\(self.price * amount)")
        }
    }
}


class OwnedItem: Item {
    var minutesUsed: Int = 0
    convenience init(item: Item){
        self.init(id: item.id, title: item.title, price: item.price)
    }
}
