//
//  LoadingView.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
            .scaleEffect(3)
            .padding(30)
            .background(.thinMaterial)
            .cornerRadius(15)
        
    }
    
}
