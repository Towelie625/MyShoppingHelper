//
//  RecipeTab.swift
//  grocery
//
//  Created by Marcel Saidykhan on 25.03.21.
//  Copyright © 2021 Marcel. All rights reserved.
//

import Foundation

import SwiftUI

// Tab Model With Tab Items....

struct Tab: Identifiable {
    
    var id = UUID().uuidString
    var tab : String
    var foods: [Food]
}
var tabsItems = [

    Tab(tab: "Order Again", foods: foods.shuffled()),
    Tab(tab: "Picked For You", foods: foods.shuffled()),
    Tab(tab: "Starters", foods: foods.shuffled()),
    Tab(tab: "Gimpub Sushi", foods: foods.shuffled()),
]
