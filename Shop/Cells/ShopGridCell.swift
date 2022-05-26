//
//  ShopGridCell.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

struct ShopGridCell: View {
    
    let item: Item
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            ShopRemoteImage(urlString: Helper.RetrieveFirstItemHasData(arr: item.imageUrlsThumbnails))
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.brandPrimary, lineWidth: 2)
                )
            
            VStack(alignment: .center, spacing: 5) {
                
                Text(item.name)
                    .foregroundColor(.brandPrimary)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(Strings.price + item.price)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
            }
            .scaledToFit()
            .lineLimit(1)
            
        }
        
    }
    
}

struct ShopGridCell_Previews: PreviewProvider {
    static var previews: some View {
        ShopGridCell( item: MockData.sampleShop)
    }
}
