//
//  IsPurchasable.swift
//  Group2_Store
//
//  Created by macbook on 18/1/2024.
//

import Foundation


protocol IsPurchasable {
    var info: String {get}
    func printReceipt(isRefund: Bool, amount: Double)
}
