//
//  Food.swift
//  grocery
//
//  Created by Marcel Saidykhan on 25.03.21.
//  Copyright © 2021 Marcel. All rights reserved.
//

import Foundation

import SwiftUI


//Erstellung der Food Objekte für die Rezept-View

struct Food: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var image: String
}


var foods = [

    Food(title: "Schokoladenkuchen", description: "Zutaten: 6 mittelgroße Eier, 300 g Schokolade, 150 g Butter", price: "ca. 5€",image: "choclates"),
    Food(title: "Kekse", description: "Zutaten: 300 g Mehl, 200g Zucker, 200g Butter, 2 Eier, 1 Pk Vanillezucker, Salz, Zimt, Backpulver, 150g Schokotropfen, 4 EL Milch, 100g Schokolade", price: "ca. 15€",image: "cookies"),
    Food(title: "Sandwich", description: "American Sandwich Toast, Roast Beef, Avocado, Cheddar, Mayo", price: "7€",image: "sandwich"),
    Food(title: "French Fries", description: "Zutaten: 800 g Kartoffeln, 1EL Pflanzenöl, Salz", price: "3€",image: "fries"),
    Food(title: "Pizza", description: "Zutaten: Fertig Pizzateig, Tomatensauce, Käse, Salami", price: "6€",image: "pizza"),
]

