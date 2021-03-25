//
//  ShoppingListView.swift
//  grocery
//
//  Created by Dennis Lentz on 23.03.21.
//  Copyright © 2021 Marcel. All rights reserved.
//

import SwiftUI

struct ShoppingListView: View {
    @State private var showingSheet = false
    var body: some View {
        
        ZStack {
                    
                    LinearGradient(gradient: .init(colors:
                        [Color("Color-1"),Color ("Color-2"),Color ("Color-3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
        GeometryReader{_ in
            
            Button("Einkaufsliste erstellen"){self.showingSheet.toggle()
                
                
            }
            
            .font(.title2)
            .buttonStyle(NeumorphicButtonStyle(bgColor: .white))
            .frame(width: 400, height: 400, alignment: .bottom)
            .sheet(isPresented: $showingSheet) {
                
                ShoppingList()
            }
    }
}
    }
struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
 }
}


//Button Style-----------------------------------------------------------------------------

struct NeumorphicButtonStyle: ButtonStyle {
    var bgColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        
            
            .padding(20)
            .background(
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                         .fill(bgColor)
                       
                }
        )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(.spring())
            
        
            
    }
    
}


