//
//  Produktkatalog.swift
//  grocery
//
//  Created by Dennis Lentz on 24.03.21.
//  Copyright © 2021 Marcel. All rights reserved.
//

import SwiftUI

struct ProduktkatalogView: View {
   
    var body: some View {
  /// Header wird angelegt mit Logo und Text
        VStack(spacing: 14.0){
            
            HStack(spacing: 12.0){
                Image("logo").renderingMode(.original).resizable().frame(width: 30, height: 30)
        Text("Produktkatalog").font(.body)
        
            }
            .padding( .trailing,8.0)
            .padding(.top, 35.0)
            ScrollView(.vertical, showsIndicators: false) {
     
                
//Produkte werden Produktkatalog hinzugefügt
                
                ForEach(productitems){ a in
                   
                    HStack{
                        ProductCellView(data: a )
                        .padding(.trailing, 1.0)

                
                    }
                    }
                    
        
            }
            
        }
        .padding(.trailing, 0.0)
        .frame(width: 390.0)
        
        
    }
    
}
struct Produktkatalog_Previews: PreviewProvider {
    static var previews: some View {
        ProduktkatalogView()
    }
}





//---------------------------------Produkte-----------------------------------------

struct product : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
}


var productitems = [
product(id: 0, name: "Forelle", price: "3,99€ / kg",image: "f1"),
product(id: 1, name: "Zitrone", price: "2,50€ / kg",image: "f2"),
product(id: 2, name: "Bauern Brot", price: "2,99€ / stk",image: "f3"),
product(id: 3, name: "Thunfisch", price: "10,99€ / kg",image: "f4"),
product(id: 4, name: "Orange", price: "1,50€ / kg",image: "f5"),
product(id: 5, name: "Donut", price: "0,99€ / stk",image: "f6")
]



// Einzelne Ansicht von den Produkten und deren Zelle
struct ProductCellView : View {
    
    var data : product
    
    @State var show = false
    
    var body : some View{
        
        if data.id == 0 {
        
        ZStack{
            
            NavigationLink(destination: Detail0(show: self.$show), isActive: self.$show) {
                
                Text("")
            }
            
            HStack(spacing: 25){
                
                Image(data.image).resizable().frame(width: 70, height: 70)
                
                VStack(spacing:10){
                    Text(data.name).fontWeight(.semibold)
                    Text(data.price).foregroundColor(.green).fontWeight(.semibold)
                }
                Text("Verfügbar").foregroundColor(.green); Image("rewe").resizable().frame(width:50, height:50)
            }.onTapGesture {
                
                self.show.toggle()
            }
            
        }
        } else if data.id == 1 {
            ZStack{
                
                NavigationLink(destination: Detail1(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                HStack(spacing: 25){
                    
                    Image(data.image).resizable().frame(width: 70, height: 70)
                    
                    VStack(spacing:10){
                        Text(data.name).fontWeight(.semibold)
                        Text(data.price).foregroundColor(.green).fontWeight(.semibold)
                    }
                    Text("Verfügbar").foregroundColor(.green); Image("rewe").resizable().frame(width:50, height:50)
                }.onTapGesture {
                    
                    self.show.toggle()
                }
                
            }
        }
        else if data.id == 2 {
            ZStack{
                
                NavigationLink(destination: Detail2(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                HStack(spacing: 20){
                    
                    Image(data.image).resizable().frame(width: 70, height: 70)
                    
                    VStack(spacing:10){
                        Text(data.name).fontWeight(.semibold)
                        Text(data.price).foregroundColor(.green).fontWeight(.semibold)
                    }
                    Text("Verfügbar").foregroundColor(.green); Image("rewe").resizable().frame(width:50, height:50)
                }.onTapGesture {
                    
                    self.show.toggle()
                }
                
            }
        }
    
        else if data.id == 3 {
            ZStack{
                
                NavigationLink(destination: Detail2(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                HStack(spacing: 22){
                    
                    Image(data.image).resizable().frame(width: 70, height: 70)
                    
                    VStack(spacing:10){
                        Text(data.name).fontWeight(.semibold)
                        Text(data.price).foregroundColor(.green).fontWeight(.semibold)
                    }
                    Text("Verfügbar").foregroundColor(.green); Image("rewe").resizable().frame(width:50, height:50)
                }.onTapGesture {
                    
                    self.show.toggle()
                }
                
            }
        }
        
        else if data.id == 4 {
            ZStack{
                
                NavigationLink(destination: Detail2(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                HStack(spacing: 25){
                    
                    Image(data.image).resizable().frame(width: 70, height: 70)
                    
                    VStack(spacing:10){
                        Text(data.name).fontWeight(.semibold)
                        Text(data.price).foregroundColor(.green).fontWeight(.semibold)
                    }
                    Text("Verfügbar").foregroundColor(.green); Image("rewe").resizable().frame(width:50, height:50)
                }.onTapGesture {
                    
                    self.show.toggle()
                }
                
            }
        }
        
        else if data.id == 5 {
            ZStack{
                
                NavigationLink(destination: Detail2(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                HStack(spacing: 22){
                    
                    Image(data.image).resizable().frame(width: 70, height: 70)
                    
                    VStack(spacing:10){
                        Text(data.name).fontWeight(.semibold)
                        Text(data.price).foregroundColor(.green).fontWeight(.semibold)
                    }
                    Text("Verfügbar").foregroundColor(.green); Image("rewe").resizable().frame(width:50, height:50)
                }.onTapGesture {
                    
                    self.show.toggle()
                }
                
            }
        }
    }
    
}
