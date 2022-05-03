//
//  CustomCell.swift
//  FoodReview
//
//  Created by Daniel Lee on 5/2/22.
//

import SwiftUI

struct CustomCell: View {
    
    var itemName: String
    
    var quantity: String
    
    var url: String
    
    var body: some View {
        HStack {
            Text(itemName)
                .padding()
            
            Spacer()
            
            Text(quantity)
                .padding()
            
            Spacer()
            
            Link(self.itemName, destination: URL(string: self.url)!)
            
        }
    }

}

