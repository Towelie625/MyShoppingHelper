//
//  RecipeHomeViewModel.swift
//  grocery
//
//  Created by Marcel Saidykhan on 25.03.21.
//  Copyright © 2021 Marcel. All rights reserved.
//

import Foundation

import SwiftUI

class HomeViewModel: ObservableObject{
    @Published var offset: CGFloat = 0
    
    // Selected Tab....
    @Published var selectedtab = tabsItems.first!.tab
}
