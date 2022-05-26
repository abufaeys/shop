//
//  ShopApp.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//


import SwiftUI

@main
struct ShopApp: App {
    
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.brandPrimary ?? UIColor.black]
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            ShopHomeView()
            
        }
        
    }
    
}
