//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Lee on 5/2/22.
//
import SwiftUI

class Items: Identifiable {
    
    var itemName: String
    
    var quantity: String
    
    var url: String
    
    init(itemName: String, quantity: String, url: String) {
        
        self.itemName = itemName
        
        self.quantity = quantity
        
        self.url = url
    }
    
}

struct ContentView: View {
    
    @State var tempItemName: String = ""
    @State var tempQuantity: String = ""
    @State var tempUrl: String = ""

    
    @State var list = [
        Items(itemName: "Free House", quantity: "3", url: "https://www.berkeleyfreehouse.com/"),
        Items(itemName: "Angeline's Kitchen", quantity: "4", url: "https://angelineskitchen.com/index.html"),
        Items(itemName: "La Note", quantity: "5", url: "https://www.lanoterestaurant.com/")
    ]
        
    var body: some View {
        NavigationView {
            List {
                ForEach(list) {
                    listItem in CustomCell(itemName: listItem.itemName, quantity: listItem.quantity, url: listItem.url)
                }
                
                HStack {
                    TextField("Restaurant", text: $tempItemName)
                    Spacer()
                    TextField("Review", text: $tempQuantity)
                    Spacer()
                    TextField("URL", text: $tempUrl)
                }
                
                Button("Add New Item") {
                    if (!(tempQuantity.isEmpty || tempItemName.isEmpty || tempUrl.isEmpty)) {
                        addItem()
                    }
                    
                }
                
                Button("Delete Last Item") {
                    if (!list.isEmpty) {
                        list.removeLast()
                    }
                }
            }.navigationTitle("Shopping List")
            
            
        }
    }
    
    func addItem() {
        list.append(Items(itemName: tempItemName, quantity: tempQuantity, url: tempUrl))
        tempItemName = ""
        tempQuantity = ""
        tempUrl = ""
    }
}
