//
//  RecipeTab.swift
//  grocery
//
//  Created by Marcel Saidykhan on 25.03.21.
//  Copyright © 2021 Marcel. All rights reserved.
//

import Foundation

import SwiftUI

// Kateogien und Überschriften in der Rezepte-View

struct Tab: Identifiable {
    
    var id = UUID().uuidString
    var tab : String
    var foods: [Food]
}
var tabsItems = [

    Tab(tab: "Inspiration", foods: foods.shuffled()),
    Tab(tab: "Community Fav's", foods: foods.shuffled()),
    Tab(tab: "Saisonal", foods: foods.shuffled()),
    Tab(tab: "Klassiker", foods: foods.shuffled()),
]
