//
//  Item.swift
//  Group2_Store
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
            print("Refund amount: $\(amount)")
        }
        else {
            print("Thank you for purchasing Heroes: \(self.title)")
            print("Purchase amount: $\(amount)")
        }
    }
}

