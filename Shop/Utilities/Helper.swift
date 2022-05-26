//
//  Helper.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import Foundation


struct Helper{
    
    /// Retrieves first url string from the Array.
    ///
    /// If we have URL in array of String, we will return the first String. If we fail, we will return empty String.
    ///
    /// - Parameter arr:  Array of URL String .
    static func RetrieveFirstItemHasData(arr:[String?]?) -> String {
        return (arr?.first(where: { image in
            if let image = image,!image.isEmpty{
                return true
            }
            return false
        }) ?? "") ?? ""
    }
}
