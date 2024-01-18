//
//  main.swift
//  Group2_Store
//
//  Created by macbook on 18/1/2024.
//

import Foundation

print("---------Creating a customer---------")
let john = Customer()
print("current balance: \(john.balance)")

print("---------Creating a variety of movies and games---------")
let movie_1 = Movie(id: 1, title: "Harry Potter", price: 12.34, runningTime: 120)
let movie_2 = Movie(id: 2, title: "Oppenheimer", price: 50, runningTime: 200)
let game_1 = Game(id: 3, title: "GTA 5", price: 80, publisher: "Rockstar", isMultiplayer: true)
let game_2 = Game(id: 4, title: "Final Fantasy XVI", price: 200, publisher: "Square Enix", isMultiplayer: false)

print("movie_1 info: \(movie_1.info)")
print("movie_2 info: \(movie_2.info)")
print("game_1 info: \(game_1.info)")
print("game_1 info: \(game_2.info)")

Store(items: [])
print("\n---------Creating a store and adding the movies and games---------")
let store = Store(items: [movie_1, movie_2, game_1, game_2])!

print("\n---------Searching for an item that exists---------")
store.findByTitle(keyword: "Harry Potter")
store.findByTitle(keyword: "GTA 5")

print("\n---------Searching for an item that does not exist---------")
store.findByTitle(keyword: "Tenet")
store.findByTitle(keyword: "GTA 6")

print("\n---------Trying to purchase an item that the customer cannot afford---------")
store.buyItem(customer: john, itemId: 1)
print("current balance: \(john.balance)")

print("\n---------Reloading the customer’s gift card so they have sufficient funds---------")
john.reloadAccount(amount: 200)
print("current balance: \(john.balance)")
print("\n---------Trying to purchase the same item again (now, they should be able to afford it)---------")
store.buyItem(customer: john, itemId: 1)
print("current balance: \(john.balance)")

print("\n---------Purchasing an item that the user does not own---------")
store.buyItem(customer: john, itemId: 3)
print("current balance: \(john.balance)")

print("\n---------Purchasing an item customer already owns---------")
store.buyItem(customer: john, itemId: 3)
print("current balance: \(john.balance)")

print("\n---------Using one of the items for more than 30 minutes---------")
john.useItem(id: 1, numMinutes: 31)

print("\n---------Trying to refund an item that does NOT the refund policy requirements---------")
store.issueRefund(customer: john, itemId: 1)
print("current balance: \(john.balance)")

print("\n---------Refunding an item that DOES meet the refund policy requirements---------")
store.issueRefund(customer: john, itemId: 3)
print("current balance: \(john.balance)")


