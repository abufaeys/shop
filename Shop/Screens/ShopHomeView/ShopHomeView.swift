//
//  ContentView.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

struct ShopHomeView: View {
    
    @StateObject var homeViewModel = ShopHomeViewModel()
    
    
    var listView: some View {
        
        List(homeViewModel.filteredShop) { item in

            NavigationLink(destination: ShopDetailView(inPersistence: .constant(false) ,item: item)) {
                
                ShopListCell(item: item)
                
            }

        }
        .listStyle(.plain)
        .accentColor(.brandPrimary)
        .navigationTitle(Strings.homeTitle)
        .navigationViewStyle(.stack)
        .refreshable { homeViewModel.getShop() }
        .toolbar {
            refresh
            switchCellType
        }
        .overlay { if homeViewModel.isLoading && homeViewModel.listEnabled { LoadingView() } }

    }
    
    var gridView: some View {
        
        ScrollView {
            
            LazyVGrid(columns: homeViewModel.columns) {
                
                ForEach(homeViewModel.filteredShop) { item in
                    
                    NavigationLink(destination: ShopDetailView(inPersistence: .constant(false), item: item)) {
                        
                        ShopGridCell(item: item)
                        
                    }
                    
                }
                
            }
            .padding()
            
        }
        .accentColor(.brandPrimary)
        .navigationTitle(Strings.homeTitle)
        .navigationViewStyle(.stack)
        .toolbar {
            refresh
            switchCellType
            
        }
        .overlay { if homeViewModel.isLoading { LoadingView() } }
        
    }
    
    /// Fetch shop items from server again .
    var refresh: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            
            Button {
                
                withAnimation { homeViewModel.getShop() } } label: {
                    
                    Image(systemName: SFSymbols.refresh)
                        .foregroundColor(Color.brandPrimary)
                    
                }
            
        }
        
    }
    
    /// switch between grid and list view .
    var switchCellType: some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarTrailing) {
            
            Button {
                
                withAnimation { homeViewModel.listEnabled.toggle() } } label: {
                    
                    Image(systemName: homeViewModel.listEnabled ? SFSymbols.grid : SFSymbols.list)
                        .foregroundColor(Color.brandPrimary)
                    
                }
            
        }
        
    }
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                                
                if homeViewModel.listEnabled {
                    
                    listView
                    
                } else {
                    
                    gridView
                    
                }
                
            }
            .navigationViewStyle(.stack)
            .animation(.easeInOut, value: homeViewModel.searchText)
            .animation(.easeInOut, value: homeViewModel.listEnabled)
            .onAppear { homeViewModel.getShopOnAppear() }
            
        }
        .accentColor(.brandPrimary)
        .searchable(text: $homeViewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .alert(item: $homeViewModel.alertItem) { alertItem in
            
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShopHomeView()
    }
}
