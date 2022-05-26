//
//  RemoteImage.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import SwiftUI

/// Downloads image from api.
final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    /// Downloads  an image from the api
    /// - Parameters:
    ///   - urlString: The url of the api where we get our data from.
    func load(fromURLString urlString: String) {
        
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            
            guard let uiImage = uiImage else { return }
            
            DispatchQueue.main.async { self.image = Image(uiImage: uiImage) }
            
        }
        
    }
    
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        
        image?.resizable() ?? Image(Strings.placeholder).resizable()
        
    }
    
}

struct ShopRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    
    let urlString: String
    
    var body: some View {
        
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
        
    }
    
}
