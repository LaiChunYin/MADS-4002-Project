//
//  Movie.swift
//  Group1_Store
//
//  Created by macbook on 18/1/2024.
//

import Foundation


class Movie: Item {
    var runningTime: Int
    override var info: String {
        get {
            var info = super.info
            info += "Running Time: \(self.runningTime) min\n"
            return info
        }
    }
    init(id: Int, title: String, price: Double, runningTime: Int) {
        self.runningTime = runningTime
        super.init(id: id, title: title, price: price)
    }
}
