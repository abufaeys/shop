//
//  EmptyShopView.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

struct EmptyShopView: View {
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Image(Strings.placeholder)
                .resizable()
                .scaledToFit()
            
            Text(Strings.emptyShop)
                .font(.title)
            
        }
        .padding()
        
    }
    
}

struct EmptyShopView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyShopView()
    }
}
