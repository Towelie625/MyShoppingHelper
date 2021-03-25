//
//  ShoppingList.swift
//  grocery
//
//  Created by Dennis Lentz on 23.03.21.
//  Copyright © 2021 Marcel. All rights reserved.
//

import SwiftUI

struct ShoppingList: View {
    @ObservedObject var listStore = ListStore()
    @State var newList : String = ""
    
    var searchBar : some View {
        HStack {
            TextField("Neues Lebensmittel", text: self.$newList)
            Button(action: self.addNewList, label: {
                Text("Hinzufügen")
            })
        }
    }
    
    func addNewList() {
        listStore.listen.append(Liste(id: String(listStore.listen.count + 1), listeItem: newList))
        self.newList = ""
        //Add auto generated id in the future.
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.listStore.listen) { task in
                        Text(task.listeItem)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }.navigationBarTitle("Einkaufsliste")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    func move(from source : IndexSet, to destination : Int) {
        listStore.listen.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet) {
        listStore.listen.remove(atOffsets: offsets)
    }
    
}

struct ShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingList()
    }
}
