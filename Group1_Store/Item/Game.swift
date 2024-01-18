//
//  File.swift
//  Group1_Store
//
//  Created by macbook on 18/1/2024.
//

import Foundation


class Game: Item {
    var publisher: String
    var isMultiplayer: Bool
    override var info: String {
        get {
            var info = super.info
            info += "Publisher: \(self.publisher)\n"
            info += "Is Multiplayer: \(self.isMultiplayer)\n"
            return info
        }
    }
    init(id: Int, title: String, price: Double, publisher: String, isMultiplayer: Bool) {
        self.publisher = publisher
        self.isMultiplayer = isMultiplayer
        super.init(id: id, title: title, price: price)
    }
}
