//
//  ItemStore.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-02-29.
//

import UIKit

class ItemStore{
    var allItems = [Item]()
    
    /**
     create a newItem using convinience initializer and add the item to the items collection
     */
    @discardableResult func createItem()->Item{
        let newItem=Item(random: true)
        allItems.append(newItem)
        
        return newItem
    }
    
    // designated initializer to add 2 new items
    init() {
        for _ in 0..<2{
            createItem()
        }
    }
    
    
}
