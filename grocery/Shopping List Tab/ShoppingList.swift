//
//  ShoppingList.swift
//  grocery
//
//  Created by Dennis Lentz on 23.03.21.
//  Copyright © 2021 Marcel. All rights reserved.
//

import SwiftUI

struct ShoppingList: View {
    
    //Einkauslisten Sheet wird hier übergeben
    @ObservedObject var listStore = ListStore()
    @State var newList : String = ""
    
    
    //Name eines neuen Lebensmittels kann hier eingegeben werden
    //-> Anbindung an Backend, um auf vorgefertigte Produkte zurückgreifen zu können
    var searchBar : some View {
        HStack {
            TextField("Neues Lebensmittel", text: self.$newList)
            Button(action: self.addNewList, label: {
                Text("+")
            })
        }
    }
    
 //--------------------------------------------------------------------------------
    //Neue Einkaufsliste wird hinzugefügt
    func addNewList() {
        listStore.listen.append(Liste(id: String(listStore.listen.count + 1), listeItem: newList))
        self.newList = ""
        //Add auto generated id in the future.
    }
 
    //Lebensmittel wird hinzugefügt
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.listStore.listen) { task in
                        //Text(task.listeItem)
                        CheckView.init(title: task.listeItem)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }.navigationBarTitle("Einkaufsliste")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    //Ermöglicht die Reihenfolge von Lebensmitteln zu tauschen
    func move(from source : IndexSet, to destination : Int) {
        listStore.listen.move(fromOffsets: source, toOffset: destination)
    }

    //Ermöglicht das Löschen von Lebensmittel in der Einkaufsliste
    func delete(at offsets : IndexSet) {
        listStore.listen.remove(atOffsets: offsets)
    }
    
}

struct ShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingList()
    }
}



//Checkbox wird erstellt


struct CheckView: View {
    @State var isChecked:Bool = false
    var title:String
    func toggle(){isChecked = !isChecked}
    var body: some View {
        Button(action: toggle){
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
                Text(title)
            }

        }

    }

}

