//
//  ShopTitleView.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

struct ShopTitleView: View {
    
    var text: String
    
    var body: some View {
        
        Text(text)
            .font(.title)
            .padding(10)
            .background(Color.brandPrimary)
            .cornerRadius(10)
        
    }
    
}

struct ShopTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ShopTitleView(text: "Text")
    }
}
