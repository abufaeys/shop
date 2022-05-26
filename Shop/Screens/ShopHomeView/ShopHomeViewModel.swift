//
//  ShopListViewModel.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

final class ShopHomeViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var searchText = ""
    @Published var listEnabled = true
    @Published var alreadyAppeared = false
    
    let columns: [GridItem] = [
        
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    var filteredShop: [Item] {
        
        if searchText.isEmpty {
            
            return items
            
        } else {
            
            return items.filter { $0.name.localizedCaseInsensitiveContains(searchText.lowercased()) }
            
        }
        
    }
    
    /// Retrieves shop items from api only when screen appears for the first time
    func getShopOnAppear() {
        
        if !alreadyAppeared {
            
            getShop()
            alreadyAppeared = true
            
        }
        
    }
    
    /// Retrieves shop items data from api. If successful we set it to our items array.  Otherwise we display an alert on the screen with what went wrong.
    func getShop() {
        
        self.isLoading = true
        
        NetworkManager.shared.getShop { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                
                switch result {
                case .success(let items):
                    self.items = items
                    
                case .failure(let error):
                    self.retrieveShopError(error: error)
                    
                }
                
            }
            
        }
        
    }
    
    
    /// Returns an error if we failed to retrieve shop items from UserDefaults.
    /// - Parameter error: The error being returned
    func retrieveShopError(error: ShopError) {
        
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
