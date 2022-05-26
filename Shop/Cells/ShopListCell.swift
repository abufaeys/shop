//
//  ShopListCell.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

struct ShopListCell: View {
    
    let item: Item
    
    var body: some View {
        
        HStack(spacing: 5) {
            
            ShopRemoteImage(urlString: Helper.RetrieveFirstItemHasData(arr: item.imageUrlsThumbnails))
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .cornerRadius(8)
                                
            VStack(alignment: .leading, spacing: 5) {
                
                HStack {
                    
                    Text(item.name)
                        .foregroundColor(.brandPrimary)
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Text(Strings.info)
                        .font(.body)
                        .padding(5)
                        .background(Color.brandPrimary)
                        .cornerRadius(10)
                    
                }
                if let createdAt = item.createdAt,!createdAt.isEmpty{
                    Text(Strings.CreatedAt + ": " + createdAt )
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                }
            }
            .padding(.leading)
            
        }
        
    }
    
}

struct ShopListCell_Previews: PreviewProvider {
    static var previews: some View {
        ShopListCell(item: MockData.sampleShop)
    }
}
