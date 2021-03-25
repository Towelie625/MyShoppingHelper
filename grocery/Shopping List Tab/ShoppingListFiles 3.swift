//
//  ShoppingListFiles.swift
//  grocery
//
//  Created by Dennis Lentz on 23.03.21.
//  Copyright © 2021 Marcel. All rights reserved.
//

import Foundation

import Foundation
import SwiftUI
import Combine

struct Liste : Identifiable {
    var id = String()
    var listeItem = String()
    
    //Add more complicated stuff later if you want.
    
}

class ListStore : ObservableObject {
    @Published var listen = [Liste]()
}
