//
//  ShopButton.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

struct ShopButton: View {
    
    var title: String
    
    var body: some View {
        
        Text(title)
            .font(.title3)
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color.brandPrimary)
            .cornerRadius(10)
        
    }
    
}

struct ShopButton_Previews: PreviewProvider {
    static var previews: some View {
        ShopButton(title: Strings.ok)
    }
}
