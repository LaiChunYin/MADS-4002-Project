//
//  Store.swift
//  Group2_Store
//
//  Created by macbook on 18/1/2024.
//

import Foundation


class Store {
    var items: [Item]
    
    init?(items: [Item]){
        if items.count == 0 {
            print("Items must have at least 1 item")
            return nil
        }
        self.items = items
    }
    func findById(id: Int) -> Item?{
        for item in items{
            if(item.id == id){
                return item
            }
        }
        return nil
    }
    
    func findByTitle(keyword: String) {
        var isItemExist = false
        for item in items {
//            print("store item is \(item.info)")
            
            if(item.title == keyword){
                isItemExist = true
                var message = "[\(type(of: item))] \(item.title)    $\(item.price)\n"
                
                if let game = item as? Game {
                    message += "Publisher: \(game.publisher)\n"
                    message += "Has Multiplayer: \(game.isMultiplayer)"
                }
                else if let movie = item as? Movie {
                    message += "Length: \(movie.runningTime) min"
                }
                print("\(message)\n")
                return
            }
        }
        
        if !isItemExist {
            print("Sorry, no matching games found")
        }
    }
    
    func buyItem(customer: Customer, itemId: Int) {
        if let itemToBeBought = self.findById(id: itemId) {
            guard itemToBeBought.price <= customer.balance else {
                print("Not enough balance.")
                return
            }
            guard !customer.itemsList.contains(where: {$0.id == itemId}) else {
                print("Item bought already.")
                return
            }
            
            customer.balance -= itemToBeBought.price
            customer.itemsList.append(OwnedItem(item: itemToBeBought))
            print("Purchase success!")
            itemToBeBought.printReceipt(isRefund: false, amount: itemToBeBought.price)
            
        }
        else{
            print("No such item")
        }

    }
    
    func issueRefund(customer: Customer, itemId: Int) {
        if let index = customer.itemsList.firstIndex(where: {$0.id == itemId}) {
            let itemToBeRefunded = customer.itemsList[index]
            guard itemToBeRefunded.minutesUsed < 30 else {
                print("The item has already been used for more than 30 minutes.")
                return
            }
            
            customer.balance += itemToBeRefunded.price
            customer.itemsList.remove(at: index)
            itemToBeRefunded.printReceipt(isRefund: true, amount: itemToBeRefunded.price)
            
        }
        else{
            print("No such item")
        }
    }
}
