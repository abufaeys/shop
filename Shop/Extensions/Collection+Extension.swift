//
//  Collection+Extension.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import Foundation

//catch “Index out of range” in Swift
extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
