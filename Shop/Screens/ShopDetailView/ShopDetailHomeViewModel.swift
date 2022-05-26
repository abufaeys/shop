//
//  ShopDetailViewModel.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import Foundation

final class ShopDetailHomeViewModel: ObservableObject {
    
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    @Published var isLoading = false
    
    

    /// Returns an error if we failed to retrieve shop items from UserDefaults.
    /// - Parameter error: The error being returned
    func retrieveShopError(error: ShopError) {
        
        DispatchQueue.main.async {
            
            switch error {
            
            case .invalidURL:
                self.alertItem = AlertContext.invalidURL
                
            case .invalidResponse:
                self.alertItem = AlertContext.invalidResponse
                
            case .invalidData:
                self.alertItem = AlertContext.invalidData
                
            case .unableToComplete:
                self.alertItem = AlertContext.unableToComplete
            }
            
        }
        
    }
    
}
