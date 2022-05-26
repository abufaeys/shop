//
//  ShopDetailView.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

struct ShopDetailView: View {
    
    @Binding var inPersistence: Bool
    
    @StateObject var detailViewModel = ShopDetailHomeViewModel()
    
    let item: Item
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                
                VStack(alignment: .center, spacing: 10) {
                    
                    ShopRemoteImage(urlString: item.imageUrls?[0] ?? "")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                    
                    Divider()
                    
                    HStack {
                        
                        ShopInfoView(item: item)
                        
                        Spacer()
                        
                    }
                    
                   
                    
                }
                .padding()
                
            }
            //.navigationTitle(item.name)
            .blur(radius: detailViewModel.isShowingAlert ? 5 : 0)
            .disabled(detailViewModel.isShowingAlert)
            .overlay { if detailViewModel.isLoading { LoadingView() } }
            
    
        }
        .animation(.easeInOut, value: detailViewModel.isShowingAlert)
        .animation(.easeInOut, value: detailViewModel.isLoading)
        .alert(item: $detailViewModel.alertItem) { item in
            
            Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
            
        }
        
    }
    
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(inPersistence: .constant(false), item: MockData.sampleShop)
    }
}
