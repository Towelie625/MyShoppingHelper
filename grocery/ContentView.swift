//
//  ContentView.swift
//  grocery
//
//  Created by Marcel on 23/03/21.
//  Copyright © 2021 Marcel. All rights reserved.
//


import SwiftUI
import UIKit

struct LoginView: View {
    
    var body: some View {
        
        
        //Verlinkung auf den LoginScreen
        
        ZStack {
            
            LinearGradient(gradient: .init(colors:
                [Color("Color-1"),Color ("Color-2"),Color ("Color-3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            if UIScreen.main.bounds.height > 800{
                
                LoginHome()
            }
            else{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LoginHome()
                }
        }
        }
}
//Der LoginScreen an sich:
struct LoginHome : View {
    @State var index = 0
    var body : some View {
        
        VStack{
            Image("logo")
                .resizable()
                .frame(width:180, height:180)
            
            HStack {
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                    
                    self.index = 0
                    
                }
                }) {
                    Text("Login")
                        .foregroundColor(self.index == 0 ? .black : .white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }.background(self.index == 0 ? Color.white : Color.clear)
                .clipShape(Capsule())
                
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                    
                    self.index = 1
                    
                }
                    
                }) {
                    Text("Registrieren")
                        .foregroundColor(self.index == 1 ? .black : .white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }.background(self.index == 1 ? Color.white : Color.clear)
                .clipShape(Capsule())
            }
            .background(Color.black.opacity(0.1))
            .clipShape(Capsule())
            .padding(.top, 25)
            
            if self.index == 0 {
                
                Login()
            }
            
            else {
                SignUp()
            }
            
            if self.index == 0 {
                
                Button(action: {
                    
                }) {
                    
                    Text("Passwort vergessen?")
                        .foregroundColor(.white)
                    
                }
                .padding(.top, 20)
                
            }
            
            
            HStack (spacing: 15) {
                
                Color.white.opacity(0.7)
                    .frame(width: 35, height: 1)
                
                Text("Oder")
                
                    .fontWeight (.bold)
                    .foregroundColor(.white)
                
                Color.white.opacity(0.7)
                    .frame(width: 35, height: 1)
            }
            .padding(.top, 10)
            
            HStack {
                
                Button(action: {
                    
                }) {
                    
                    Image("fb")
                        .renderingMode(.original)
                        .padding()
                    
                }.background(Color.white)
                .clipShape(Circle())
                
                Button(action: {
                    
                }) {
                    
                    Image("google")
                        .renderingMode(.original)
                        .padding()
                    
                }.background(Color.white)
                .clipShape(Circle())
                .padding(.leading, 25)
            }
            .padding(.top, 10)
            }
        .padding()
        
    }
} //Wenn Login angezeigt werden soll: (Loginansicht)
    struct Login : View {
        @State var mail = ""
        @State var pass = ""
        @Environment(\.presentationMode) var presentationMode
        
        var body : some View {
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    
                    TextField("Email Adresse", text: self.$mail)
                    
                }.padding(.vertical, 20)
                Divider ()
            
                HStack(spacing: 15){
                        
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                            .foregroundColor(.black)
                        
                        SecureField("Passwort", text: self.$pass)
                        
                    Button(action:{
                        
                    }){
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                    }.padding(.vertical, 20)
                
                }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, 25)
            
            
            Button(action:{
                self.presentationMode.wrappedValue.dismiss()
                LoggedIn.LoggedIn = true
                
                

            }) {
                
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
            }.background(
            
                LinearGradient(gradient: .init(colors: [Color("Color-3"), Color ("Color-2"), Color ("Color-1")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .cornerRadius (8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
            }

        }
    //Wenn Registrieren angezeigt werden soll: (Registrierungsansicht)
    struct SignUp : View {
        
        @State var mail = ""
        @State var pass = ""
        @State var repass = ""
        @Environment(\.presentationMode) var presentationMode
        @State private var showingAlert = false
        
        var body : some View {
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    
                    TextField("Email Adresse", text: self.$mail)
                    
                }.padding(.vertical, 20)
                Divider ()
            
                HStack(spacing: 15){
                        
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                            .foregroundColor(.black)
                        
                        SecureField("Passwort", text: self.$pass)
                        
                    Button(action:{
                        
                    }){
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                    }.padding(.vertical, 20)
                
                Divider()
                
                HStack(spacing: 15){
                        
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                            .foregroundColor(.black)
                        
                        SecureField("Passwort wiederholen", text: self.$pass)
                        
                    Button(action:{
                        
                        
                    }){
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                    }.padding(.vertical, 20)
                
                }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, 25)
            

            
            
            Button(action:{
                showingAlert = true
                
            }) {
                
                
                Text("REGISTRIEREN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                
            }
            .alert(isPresented: $showingAlert) {
                      Alert(title: Text("Important message"), message: Text("Error - Please try again later..."), dismissButton: .default(Text("Got it!")))
                  }
            .background(
            
                LinearGradient(gradient: .init(colors: [Color("Color-3"), Color ("Color-2"), Color ("Color-1")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .cornerRadius (8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
            }

        }
    }
    

//Variable zur Globalen benutzung die angibt ob man eingeloggt ist oder nicht
struct LoggedIn {
    static var LoggedIn = false
}
    //Die "Main-View" welche die Logik der Navigation-Bar beinhaltet welche immer angezeigt wird
struct ContentView: View {
    @State public var selected = "Home"
    @State var UserSelected = false
    @State private var showingSheet = false
    
    var body: some View {
        
        NavigationView{
            
            
            VStack{
                
                if self.selected == "Home"{
                    
                    Home()
                }
                else if self.selected == "Einkaufsliste"{
                    
                    GeometryReader{_ in
                        
                       ShoppingListView()
                    }
                }
                
                else{
                    
                    GeometryReader{_ in
                        if LoggedIn.LoggedIn == false {
                            
                            notLoggedIn()
                        
                    }
                        else{
                            
                            UserView()
                            
                        }
                    }
                }
                
                CustomTabView(selected: $selected)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }
    }
}
//Struct für die Live-Preview von Xcode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//Weitere Logik für die Navigations-Bar - was passiert wenn man auf die einzelnen Punkte drückt
struct CustomTabView : View {
    
    @Binding var selected : String
    
    var body : some View{
        
        HStack{
            
            ForEach(tabs,id: \.self){i in
                
                VStack(spacing: 10){
                    
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 5)
                        .overlay(
                    
                            Capsule().fill(self.selected == i ? Color("Color") : Color.clear).frame(width: 55, height: 5)
                         )
                    
                    Button(action: {
                        
                        self.selected = i
                        
                    }) {
                        
                        VStack{
                            
                            Image(i).renderingMode(.original)
                            Text(i).foregroundColor(.black)
                        }
                    }
                }
            }
            
        }.padding(.horizontal)
    }
}
//Seite die Angezeigt wird, wenn man nicht eingeloggt ist aber auf das "User" Feld in der NavigationBar drückt
struct notLoggedIn : View {
    var body: some View{
        ZStack{
            VStack(spacing: 10){
                Image("myshoppinghelper")
                    .frame(width: 270, height: 40)
                Image("notLoggedIn").resizable()
                    .frame(width: 350, height: 350)
                Text("Bitte logge dich ein.").font(.title2)
                Text("Wenn du noch keinen Account hast kannst du dir einen neuen Erstellen.").frame(width: 350, height: 125, alignment: .center).font(.title3)
            }.padding() .frame(width: 400, height: 740, alignment: .center)
        }
    }
    
}
//Seite die unter "User" angezeigt wird wenn man Eingeloggt ist. (Profil Seite)
struct UserView : View {
    
    @State var index = 0
    @State var showingLogout = false
    
    var body: some View{
        
        VStack{
            
            HStack(spacing: 15){
            
                
                Text("Profil")
                    .font(.title)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    LoggedIn.LoggedIn = false
                    showingLogout = true
                }) {
                    
                    Text("Logout")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color("Color"))
                        .cornerRadius(10)
                }.alert(isPresented: $showingLogout) {
                    Alert(title: Text("Erfolg"), message: Text("Du wurdest erfolgreich ausgeloggt. Bitte kehre zum Home-Bildschirm zurück."), dismissButton: .default(Text("Ok")))
                }
            }
            .padding()
            
            HStack{
                
                VStack(spacing: 0){
                    
                    Rectangle()
                    .fill(Color("Color"))
                    .frame(width: 80, height: 3)
                    .zIndex(1)
                    
                    
                    // going to apply shadows to look like neuromorphic feel...
                    
                    Image("profile")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 6)
                    .padding(.bottom, 4)
                    .padding(.horizontal, 8)
                    .background(Color("Color1"))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                    .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                }
                
                VStack(alignment: .leading, spacing: 12){
                    
                    Text("Gurdula")
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.8))
                    
                    Text("Tier 3 Einkäufer")
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.top, 3)
                    
                    Text("gurdula@hotmail.com")
                        .foregroundColor(Color.black.opacity(0.7))
                }
                .padding(.leading, 20)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            // Tab Items...
            
            HStack{
                
                Button(action: {
                    
                    self.index = 0
                    
                }) {
                    
                    Text("Märkte")
                        .foregroundColor(self.index == 0 ? Color.white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color("Color") : Color.clear)
                        .cornerRadius(10)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    self.index = 1
                    
                }) {
                    
                    Text("Einstellungen")
                        .foregroundColor(self.index == 1 ? Color.white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("Color") : Color.clear)
                        .cornerRadius(10)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    self.index = 2
                    
                }) {
                    
                    Text("Kontakt")
                        .foregroundColor(self.index == 2 ? Color.white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("Color") : Color.clear)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal,8)
            .padding(.vertical,5)
            .background(Color("Color1"))
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
            .padding(.horizontal)
            .padding(.top,25)
            
            // Cards...
            
            HStack(spacing: 20){
                
                VStack(spacing: 12){
                    
                    Image("lidl")
                    .resizable()
                    .frame(width: 80, height: 80)
                    
                    Text("Lidl")
                        .font(.title)
                        .padding(.top,10)
                    
                    Text("Marktplatz")
                        .foregroundColor(Color("Color"))
                    
                    Text("Zuletzt aktualisiert: 19.02.2021")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                // half screen - spacing - two side paddings = 60
                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                .background(Color("Color1"))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                // shadows...
                
                VStack(spacing: 12){
                    
                    Image("rewe")
                    .resizable()
                    .frame(width: 80, height: 80)
                    
                    Text("Rewe")
                        .font(.title)
                        .padding(.top,10)
                    
                    Text("Paradeplatz")
                        .foregroundColor(Color("Color"))
                    
                    Text("Zuletzt aktualisiert: 20.03.2021")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                // half screen - spacing - two side paddings = 60
                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                .background(Color("Color1"))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                // shadows...
                
            }
            .padding(.top,20)
            
            HStack(spacing: 20){
                
                
            }
            .padding(.top,20)
            
            Spacer(minLength: 0)
        }
        .background(Color("Color1").edgesIgnoringSafeArea(.all))
    }
}

//Test Code der nicht mehr benötigt wurde:
/*struct UserView : View {
    
    var body: some View{
        
        Text ("  Du bist eingeloggt!").font(.title).padding(20)
        Button(action: {
            LoggedIn.LoggedIn = false
        }, label: {
            Text("Logout, alla").padding(150)
        })
    }
    
}
*/

//Die Home-View (Das Dashboard) Welche das Feld für die Suche, das Feld mit dem Rabatt (inkl. Logik für das "Sheet" mit dem QR-Code), den Login-Button oben Rechts und das Spotlight für Kategorien beinhaltet
    //Anschließend wird auf HomeBottomView verwiesen welche den unteren Teil abdeckt
struct Home : View {
    
    @State var txt = ""
    @State var showModal = false
    @State private var showingCategories = false
    @State public var showLogin = false
    
    var body : some View{
        
        VStack(spacing: 15){
            
            HStack(spacing: 12){
                
                Image("logo").renderingMode(.original).resizable().frame(width: 30, height: 30)
                
                Text("MyShoppingHelper").font(.body)
                
                Spacer()
                                  
                Image(systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .font(Font.title.weight(.thin))
                            .frame(width: 25, height: 25)
                    .onTapGesture(perform: {
                        self.showLogin.toggle()
                    }).sheet(isPresented: $showLogin) {
                        LoginView()
                    }
                
            }

            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15){
                    
                    HStack(spacing: 15){
                        
                        HStack{
                            
                            Image(systemName: "magnifyingglass").font(.body)
                            
                            TextField("Suche", text: $txt)
                            
                        }.padding(10)
                        .background(Color("Color1"))
                        .cornerRadius(20)
                        
                        
                    }
                    
                    Image("top").resizable().overlay(
                    
                        VStack{
                            
                            Spacer()
                            
                            HStack{
                                
                                Text("10% Rabatt bei Rewe").font(.title).foregroundColor(.white)
                                Spacer()
                                
                            }.padding().onTapGesture(perform: {
                                self.showModal = true
                            })
                            
                        }
                        .sheet(isPresented: $showModal) {
                            Image("qr-code").resizable()
                                        .font(.largeTitle)
                                        .frame(width: 350, height: 350)
                            Text("Scanne den QR-Code bei Rewe um den Rabatt zu erhalten.")
                                .font(.title)
                                .padding()
                        }
                    
                    )
                    
                    HStack{

                        Text("Kategorien").font(.title)
                        
                        Spacer()
                                    
                        Button("Mehr") {self.showingCategories.toggle()
                                       
                                   }
                                   .sheet(isPresented: $showingCategories) {
                                    
                                    ProduktCategoryView()
                                   }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 15){
                            
                            ForEach(categories,id: \.self){i in
                                
                                VStack{
                                    
                                    Image(i).renderingMode(.original)
                                    Text(i)
                                }
                            }
                        }
                    }
                    
                    HomeBottomView()
                    
                    
                }
            }
            
        }.padding(.horizontal)
    }
}
//Unterer Teil der Home-View mit den Spotlights für Produkte und Rezepte und zusätzlicher verlinkung auf "Mehr"
struct HomeBottomView : View {
    @State private var showingProduct = false
    @State private var showingRecipes = false
    var body : some View{
        
        VStack(spacing: 15){
            
            HStack{

                Text("Neue Produkte").font(.title)
                
                Spacer()
                
                Button("Mehr") {self.showingProduct.toggle()
                               
                           }
                           .sheet(isPresented: $showingProduct) {
                            
                              ProduktkatalogView()
                           }.foregroundColor(Color("Color"))
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(freshitems){i in
                        
                        FreshCellView(data: i)
                    }
                }
            }
            
            HStack{

                Text("Rezepte").font(.title)
                
                Spacer()
                
                
                Button("Mehr") {self.showingRecipes.toggle()
                               
                           }
                           .sheet(isPresented: $showingRecipes) {
                            
                              RecipeHome()
                           }.foregroundColor(Color("Color"))
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(recipeitems){i in
                        
                        RecipeCellView(data: i)
                    }
                }
            }
        }
    }
}
//Logik für die Detailansicht der einzelnen Produkte im Spotlight wenn man draufklickt
struct FreshCellView : View {
    
    var data : fresh
    @State var show = false
    
    var body : some View{
        
        if data.id == 0 {
        
        ZStack{
            
            NavigationLink(destination: Detail0(show: self.$show), isActive: self.$show) {
                
                Text("")
            }
            
            VStack(spacing: 10){
                
                Image(data.image)
                Text(data.name).fontWeight(.semibold)
                Text(data.price).foregroundColor(.green).fontWeight(.semibold)
                
            }.onTapGesture {
                
                self.show.toggle()
            }
            
        }
        } else if data.id == 1 {
            ZStack{
                
                NavigationLink(destination: Detail1(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                VStack(spacing: 10){
                    
                    Image(data.image)
                    Text(data.name).fontWeight(.semibold)
                    Text(data.price).foregroundColor(.green).fontWeight(.semibold)
                    
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
                
                VStack(spacing: 10){
                    
                    Image(data.image)
                    Text(data.name).fontWeight(.semibold)
                    Text(data.price).foregroundColor(.green).fontWeight(.semibold)
                    
                }.onTapGesture {
                    
                    self.show.toggle()
                }
                
            }
        }
    }
}
//Logik für die Detailansicht der einzelnen Rezepte im Spotlight wenn man draufklickt
struct RecipeCellView : View {
    
    var data : recipe
    @State var show = false
    var body : some View{
        if data.id == 0 {
        ZStack{
            NavigationLink(destination: Rezept1(show: self.$show), isActive: self.$show) {
                
                Text("")
            }
        VStack(spacing: 10){
            
            Image(data.image)
            
            HStack(spacing: 10){
                
                Image(data.authorpic)
                
                VStack(alignment: .leading, spacing: 6){
                    
                    Text(data.name).fontWeight(.semibold)
                    Text(data.author).foregroundColor(.green).fontWeight(.semibold)
                }
            }

        }.onTapGesture {
            self.show.toggle()
        }
      }
    } else if data.id == 1 {
        ZStack{
            NavigationLink(destination: Rezept2(show: self.$show), isActive: self.$show) {
                
                Text("")
            }
        VStack(spacing: 10){
            
            Image(data.image)
            
            HStack(spacing: 10){
                
                Image(data.authorpic)
                
                VStack(alignment: .leading, spacing: 6){
                    
                    Text(data.name).fontWeight(.semibold)
                    Text(data.author).foregroundColor(.green).fontWeight(.semibold)
                }
            }

        }.onTapGesture {
            self.show.toggle()
        }
      }
    } else if data.id == 2 {
        ZStack{
            NavigationLink(destination: Rezept3(show: self.$show), isActive: self.$show) {
                
                Text("")
            }
        VStack(spacing: 10){
            
            Image(data.image)
            
            HStack(spacing: 10){
                
                Image(data.authorpic)
                
                VStack(alignment: .leading, spacing: 6){
                    
                    Text(data.name).fontWeight(.semibold)
                    Text(data.author).foregroundColor(.green).fontWeight(.semibold)
                }
            }

        }.onTapGesture {
            self.show.toggle()
        }
      }
    }
    }
}
/* Code der nicht mehr benötigt wurde mit dem getestet wurde
 @State var show = false
 NavigationLink(destination: Rezept3(show: self.$show), isActive: self.$show) {
     
     Text("")
 }...
 {}.onTapGesture {
 self.show.toggle()
 }
 */

//Ab hier beginnen die Detail Seiten für die einzelnen Produkte sowie Rezepte ACHTUNG diese wiederholen sich strukturell mit jeweils anderen Daten für die verschiedenen Produkte. (Viele Zeilen Code)
struct Detail0 : View {
    
    @Binding var show : Bool
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    @State var count = 1
    
    var body : some View{
        
        VStack(spacing: 0){
            
            Image("f1")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 2.5)
                .edgesIgnoringSafeArea(.top)
                .overlay(
            
                    VStack{
                        
                        HStack(spacing: 12){
                            
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                
                                Image("back").renderingMode(.original)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("download").renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("Wishlist").renderingMode(.original)
                            }
                            
                        }.padding()
                        
                        Spacer()
                    }
            
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Forelle").font(.title)
                    
                    Text("3,99€ / Packung").foregroundColor(.green)
                    
                    Divider().padding(.vertical, 15)
                    
                    HStack{
                        
                        Image("rewe").resizable().frame(width: 60, height: 60)
                        
                        Text("Rewe")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("chat").renderingMode(.original)
                        }
                    }
                    
                    Text("Diese forellige Forelle aus der Forellengasse mundet zu jeder mahlzeit. Frisch aus dem Wasser nebenan.").foregroundColor(.gray)
                    
                    HStack{
                        
                        Text("Reviews (359)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Mehr")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("rp2").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 6){
                            
                           HStack{
                                
                                Text("5")
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                
                            }
                            
                            Text("")
                            Text("Fast wie direkt aus dem Meer. Ich bin begeistert.")
                        }
                        
                    }.padding()
                    .background(Color("Color1"))
                    .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        
                        Spacer(minLength: 12)
                        
                        Button(action: {
                            
                            self.count += 1
                        }) {
                            
                            Image(systemName: "plus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Text("\(self.count)")
                        
                        Button(action: {
                            
                            if self.count != 0{
                                
                                self.count -= 1
                            }
                            
                        }) {
                            
                            Image(systemName: "minus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Auf die Liste").padding()
                            
                        }.foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(12)
                        
                        Spacer(minLength: 12)
                    }
                }
                
            }.padding()
            .overlay(
            
            
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        HStack{
                            
                            Text("4").foregroundColor(.white)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            
                        }.padding()
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                    .padding(.top,-20)
                    .padding(.trailing)
                        
                    
                    Spacer()
                }
            
            )
            .background(RoundedCorner().fill(Color.white))
            .padding(.top, -top! - 25)
                
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Detail1 : View {
    
    @Binding var show : Bool
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    @State var count = 1
    
    var body : some View{
        
        VStack(spacing: 0){
            
            Image("f2")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 2.5)
                .edgesIgnoringSafeArea(.top)
                .overlay(
            
                    VStack{
                        
                        HStack(spacing: 12){
                            
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                
                                Image("back").renderingMode(.original)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("download").renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("Wishlist").renderingMode(.original)
                            }
                            
                        }.padding()
                        
                        Spacer()
                    }
            
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Zitrone").font(.title)
                    
                    Text("2,50€ / kg").foregroundColor(.green)
                    
                    Divider().padding(.vertical, 15)
                    
                    HStack{
                        
                        Image("rewe").resizable().frame(width: 60, height: 60)
                        
                        Text("Rewe")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("chat").renderingMode(.original)
                        }
                    }
                    
                    Text("Unsere Zitronen im 6er Pack sind extra Frisch.").foregroundColor(.gray)
                    
                    HStack{
                        
                        Text("Reviews (48)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Mehr")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("rp2").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 6){
                            
                           HStack{
                                
                                Text("4")
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                
                            }
                            
                            Text("")
                            Text("Die Zitronen sind bisher die Besten! Leider werden sie nicht einzeln Verkauft.")
                        }
                        
                    }.padding()
                    .background(Color("Color1"))
                    .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        
                        Spacer(minLength: 12)
                        
                        Button(action: {
                            
                            self.count += 1
                        }) {
                            
                            Image(systemName: "plus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Text("\(self.count)")
                        
                        Button(action: {
                            
                            if self.count != 0{
                                
                                self.count -= 1
                            }
                            
                        }) {
                            
                            Image(systemName: "minus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Auf die Liste").padding()
                            
                        }.foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(12)
                        
                        Spacer(minLength: 12)
                    }
                }
                
            }.padding()
            .overlay(
            
            
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        HStack{
                            
                            Text("4").foregroundColor(.white)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            
                        }.padding()
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                    .padding(.top,-20)
                    .padding(.trailing)
                        
                    
                    Spacer()
                }
            
            )
            .background(RoundedCorner().fill(Color.white))
            .padding(.top, -top! - 25)
                
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Detail2 : View {
    
    @Binding var show : Bool
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    @State var count = 1
    
    var body : some View{
        
        VStack(spacing: 0){
            
            Image("f3")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 2.5)
                .edgesIgnoringSafeArea(.top)
                .overlay(
            
                    VStack{
                        
                        HStack(spacing: 12){
                            
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                
                                Image("back").renderingMode(.original)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("download").renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("Wishlist").renderingMode(.original)
                            }
                            
                        }.padding()
                        
                        Spacer()
                    }
            
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Bauern Brot").font(.title)
                    
                    Text("2,99€ / Stück").foregroundColor(.green)
                    
                    Divider().padding(.vertical, 15)
                    
                    HStack{
                        
                        Image("rewe").resizable().frame(width: 60, height: 60)
                        
                        Text("Rewe")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("chat").renderingMode(.original)
                        }
                    }
                    
                    Text("Unser Bauern Brot ist das Beste auf dem Markt. Niemand kann so bauernhaft Backen wie unsere Mitarbeiter in der Backstube").foregroundColor(.gray)
                    
                    HStack{
                        
                        Text("Reviews (623)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Mehr")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("rp2").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 6){
                            
                           HStack{
                                
                                Text("4")
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                
                            }
                            
                            Text("")
                            Text("Ich habe noch nie so ein tolles und wohlschmeckendes Bauern Brot gegessen. Das erinnert mich direkt an meine Kindheit auf dem Bauernhof.")
                        }
                        
                    }.padding()
                    .background(Color("Color1"))
                    .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        
                        Spacer(minLength: 12)
                        
                        Button(action: {
                            
                            self.count += 1
                        }) {
                            
                            Image(systemName: "plus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Text("\(self.count)")
                        
                        Button(action: {
                            
                            if self.count != 0{
                                
                                self.count -= 1
                            }
                            
                        }) {
                            
                            Image(systemName: "minus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Auf die Liste").padding()
                            
                        }.foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(12)
                        
                        Spacer(minLength: 12)
                    }
                }
                
            }.padding()
            .overlay(
            
            
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        HStack{
                            
                            Text("4").foregroundColor(.white)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            
                        }.padding()
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                    .padding(.top,-20)
                    .padding(.trailing)
                        
                    
                    Spacer()
                }
            
            )
            .background(RoundedCorner().fill(Color.white))
            .padding(.top, -top! - 25)
                
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Rezept1 : View {
    
    @Binding var show : Bool
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    
    
    var body : some View{
        
        VStack(spacing: 0){
            
            Image("r1")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 2.5)
                .edgesIgnoringSafeArea(.top)
                .overlay(
            
                    VStack{
                        
                        HStack(spacing: 12){
                            
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                
                                Image("back").renderingMode(.original)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("download").renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("Wishlist").renderingMode(.original)
                            }
                            
                        }.padding()
                        
                        Spacer()
                    }
            
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Pasta Caprese").font(.title)
                    
                 
                    
                    HStack{
                        
                        Image("rp1").renderingMode(.original)
                        
                        Text("Lisa")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("chat").renderingMode(.original)
                        }
                    }
                    
                    Text("Ein Leckeres Rezept für eine selbstgemachte Pasta Caprese.").foregroundColor(.gray)
                    
                    HStack{
                        
                        Text("Reviews (48)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Mehr")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("rp2").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 6){
                            
                           HStack{
                                
                                Text("5")
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                
                            }
                        Text("Anabelle")
                        Text("Die Beste Pasta die ich je gegessen habe.")
                        }
                        
                    }.padding()
                    .background(Color("Color1"))
                    .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Rezept Anzeigen").padding()
                            
                        }.foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(12)
                                                
                        Spacer(minLength: 12)
                        
                    }
                }
                
            }.padding()
            .overlay(
            
            
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        HStack{
                            
                            Text("4").foregroundColor(.white)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            
                        }.padding()
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                    .padding(.top,-20)
                    .padding(.trailing)
                        
                    
                    Spacer()
                }
            
            )
            .background(RoundedCorner().fill(Color.white))
            .padding(.top, -top! - 25)
                
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Rezept2 : View {
    
    @Binding var show : Bool
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    
    
    var body : some View{
        
        VStack(spacing: 0){
            
            Image("r2")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 2.5)
                .edgesIgnoringSafeArea(.top)
                .overlay(
            
                    VStack{
                        
                        HStack(spacing: 12){
                            
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                
                                Image("back").renderingMode(.original)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("download").renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("Wishlist").renderingMode(.original)
                            }
                            
                        }.padding()
                        
                        Spacer()
                    }
            
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Bananen Müsli").font(.title)
                    
                   
                    
                    HStack{
                        
                        Image("rp2").renderingMode(.original)
                        
                        Text("Anabelle")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("chat").renderingMode(.original)
                        }
                    }
                    
                    Text("Ein Leckeres Rezept für ein Bananen Müsli.").foregroundColor(.gray)
                    
                    HStack{
                        
                        Text("Reviews (13)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Mehr")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("rp3").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 6){
                            
                           HStack{
                                
                                Text("5")
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                
                            }
                        Text("Anonym")
                        Text("Ein tolles Müsli für einen guten Start in den Tag.")
                        }
                        
                    }.padding()
                    .background(Color("Color1"))
                    .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        Button(action: {
                            
                        }) {
                            
                            Text("Rezept Anzeigen").padding()
                            
                        }.foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(12)
                    
                        Spacer(minLength: 12)
                        
                    }
                }
                
            }.padding()
            .overlay(
            
            
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        HStack{
                            
                            Text("4").foregroundColor(.white)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            
                        }.padding()
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                    .padding(.top,-20)
                    .padding(.trailing)
                        
                    
                    Spacer()
                }
            
            )
            .background(RoundedCorner().fill(Color.white))
            .padding(.top, -top! - 25)
                
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Rezept3 : View {
    
    @Binding var show : Bool
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    
    
    var body : some View{
        
        VStack(spacing: 0){
            
            Image("r3")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 2.5)
                .edgesIgnoringSafeArea(.top)
                .overlay(
            
                    VStack{
                        
                        HStack(spacing: 12){
                            
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                
                                Image("back").renderingMode(.original)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("download").renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("Wishlist").renderingMode(.original)
                            }
                            
                        }.padding()
                        
                        Spacer()
                    }
            
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Ramen").font(.title)
                    
                    
                    HStack{
                        
                        Image("rp3").renderingMode(.original)
                        
                        Text("Anonym")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("chat").renderingMode(.original)
                        }
                    }
                    
                    Text("Rezept für die japanische Spezialität - Ramen.").foregroundColor(.gray)
                    
                    HStack{
                        
                        Text("Reviews (78)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Mehr")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("rp1").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 6){
                            
                           HStack{
                                
                                Text("5")
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                
                            }
                        Text("Lisa")
                        Text("Mhhhhhmmm, Das schmeckt!.")
                        }
                        
                    }.padding()
                    .background(Color("Color1"))
                    .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        Button(action: {
                            
                        }) {
                            
                            Text("Rezept Anzeigen").padding()
                            
                        }.foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(12)
                        Spacer(minLength: 12)
                        
                    }
                }
                
            }.padding()
            .overlay(
            
            
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        HStack{
                            
                            Text("5").foregroundColor(.white)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            
                        }.padding()
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                    .padding(.top,-20)
                    .padding(.trailing)
                        
                    
                    Spacer()
                }
            
            )
            .background(RoundedCorner().fill(Color.white))
            .padding(.top, -top! - 25)
                
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

//Logik für die abgerundeten Ecken von manchen Objekten
struct RoundedCorner : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

// Einige Variablen und Listen welche im Code genutzt werden

var tabs = ["Home","Einkaufsliste","User"]

var categories = ["Früchte","Gemüse","Trinken","Fisch","Brot"]

struct fresh : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
}

struct recipe : Identifiable {
    
    var id : Int
    var name : String
    var author : String
    var image : String
    var authorpic : String
}

//Für das Produkt Spotlight
var freshitems = [
fresh(id: 0, name: "Forelle", price: "3,99€ / packung",image: "f1"),
fresh(id: 1, name: "Zitrone", price: "2,50€ / kg",image: "f2"),
fresh(id: 2, name: "Bauern Brot", price: "2,99€ / stück",image: "f3")
]

//Für das Rezepte Spotlight
var recipeitems = [
recipe(id: 0, name: "Pasta Caprese", author: "Lisa",image: "r1",authorpic: "rp1"),
recipe(id: 1, name: "Bananen Müsli", author: "Anabelle",image: "r2",authorpic: "rp2"),
recipe(id: 2, name: "Ramen", author: "Undefiniertes Wesen",image: "r3",authorpic: "rp3")
]

