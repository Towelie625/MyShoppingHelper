//
//  ProduktKategorieView.swift
//  grocery
//
//  Created by Maxime Heuer on 25.03.21.
//  Copyright © 2021 Marcel. All rights reserved.
//

import SwiftUI


//Produkt-Kategorie
//Erstellung der Liste über die Produktkategorien
struct ProduktCategoryView: View {
   
    var body: some View {
        
        VStack(spacing: 14.0){
            
            HStack(spacing: 12.0){
                Image("logo").renderingMode(.original).resizable().frame(width: 30, height: 30)
        Text("Kategorien").font(.body)
        
            }
            .padding( .trailing,8.0)
            .padding(.top, 35.0)
            ScrollView(.vertical, showsIndicators: false) {
       //Produktkategorien werden der Seite hinzugefügt
                ForEach(categoryitems){ a in
                   
                    HStack{
                        CategoryCellView(data: a )
                        .padding(.trailing, 1.0)

                
                    }
                    }
                    
        
            }
            .padding(.trailing, 100.0)
            
        }
        .padding(.trailing, 0.0)
        .frame(width: 390.0)
        
        
    }
    
}
struct ProduktCategory_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProduktCategoryView()
            ProduktCategoryView()
        }
    }
}





//---------------------------------Produkte-----------------------------------------

struct category : Identifiable {
    
    var id : Int
    var name : String
    var image : String
}

//Kategorien
var categoryitems = [
category(id: 0, name: "Obst",image: "Früchte"),
category(id: 1, name: "Gemüse",image: "Gemüse"),
category(id: 2, name: "Getränke",image: "Trinken"),
category(id: 3, name: "Fisch",image: "Fisch"),
category(id: 4, name: "Backwaren",image: "Brot"),
category(id: 5, name: "Tiefkühl",image: "Tiefkühl"),
category(id: 6, name: "Süßes & Salziges",image: "Sweets"),
category(id: 7, name: "Kaffee, Tee und Kakao",image: "Kaffee"),

]


struct CategoryCellView : View {
    
    var data : category
    
    @State var show = false
    
    var body : some View{
        
        if data.id == 0 {
        
        ZStack{
            
            NavigationLink(destination: Detail0(show: self.$show), isActive: self.$show) {
                
                Text("")
            }
            
            HStack(spacing: 40.0){
                
                Image(data.image).resizable().frame(width: 70, height: 70)
                
                Text(data.name).fontWeight(.semibold).multilineTextAlignment(.leading)
                    
                
                
            }.padding(.trailing).onTapGesture {
                
                self.show.toggle()
            }
            
        }
            
            
        } else if data.id == 1 {
            ZStack{
                
                NavigationLink(destination: Detail1(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                HStack(spacing: 25.0){
                    
                    Image(data.image).resizable().frame(width: 70, height: 70)
                    
                    
                    Text(data.name).fontWeight(.semibold).multilineTextAlignment(.leading)
                        
                    
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
                    
                    
                    Text(data.name).fontWeight(.semibold).multilineTextAlignment(.leading)
                        
        
                    
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
                
                HStack(spacing: 25.0){
                    
                    Image(data.image).resizable().frame(width: 70, height: 70)
                    
                   
                        Text(data.name).fontWeight(.semibold)
                        
                    
                    
                }.padding(.trailing, 30.0).onTapGesture {
                    
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
                    
                    
                        Text(data.name).fontWeight(.semibold)
                        
                    
                    
                }.padding(.leading, 20.0).onTapGesture {
                    
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
                    
                    
                        Text(data.name).fontWeight(.semibold)
                        
                    
                    
                }.padding(.trailing, 10.0).onTapGesture {
                    
                    self.show.toggle()
                }
                
            }
        }
        else if data.id == 6 {
            ZStack{
                
                NavigationLink(destination: Detail2(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                HStack(spacing: 22){
                    
                    Image(data.image).resizable().frame(width: 70, height: 70)
                    
                    
                        Text(data.name).fontWeight(.semibold)
                        
                    
                    
                }.padding(.leading, 60.0).onTapGesture {
                    
                    self.show.toggle()
                }
                
            }
        }
        else if data.id == 7 {
            ZStack{
                
                NavigationLink(destination: Detail2(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                HStack(spacing: 22){
                    
                    Image(data.image).resizable().frame(width: 70, height: 70)
                    
                    
                        Text(data.name).fontWeight(.semibold)
                        
                    
                    
                }.padding(.leading, 50.0).onTapGesture {
                    
                    self.show.toggle()
                }
                
            }
        }
        
    }
    
}
