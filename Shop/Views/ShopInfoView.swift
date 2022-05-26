//
//  ShopInfoView.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

struct ShopInfoView: View {
    
    let item: Item
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            ShopTitleView(text: Strings.info)
            
            Text(Strings.name) + Text(item.name).foregroundColor(.brandPrimary)
            
            Text(Strings.price) + Text(item.price).foregroundColor(.brandPrimary)
            
            if let createdAt = item.createdAt , createdAt.isNotEmpty{
                Text(Strings.CreatedAt + ": ") + Text(createdAt).foregroundColor(.brandPrimary)
            }
            
            
        }
        
    }
    
}
