//
//  Customer.swift
//  Group2_Store
//
//  Created by macbook on 18/1/2024.
//

import Foundation



class Customer {
    var itemsList: [OwnedItem] = []
    var balance: Double = 10
    
    func reloadAccount(amount: Double) {
        self.balance += amount
    }
    
    func useItem(id: Int, numMinutes: Int) {
        for item in itemsList {
            if(item.id == id){
                item.minutesUsed += numMinutes
                break
            }
        }
    }
}
