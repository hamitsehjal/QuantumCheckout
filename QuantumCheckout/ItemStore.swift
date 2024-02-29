//
//  ItemStore.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-02-29.
//

import UIKit

class ItemStore{
    var allItems = [Item]()
    
    // designated initializer to add 2 new items
    init() {
        
            let item1 = Item(name: "Computer", quantity: 5, price: 400.99)
            let item2=Item(name: "Monitor", quantity: 3, price: 200.99)
            allItems.append(item1)
            allItems.append(item2)
    }
    
    /**
     create a newItem using convinience initializer and add the item to the items collection
     */
    @discardableResult func createItem()->Item{
        let newItem=Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    /**
     remove an item from the store
     */
    func removeItem(_ item:Item){
        // find the index of the item to be removed
        if let index=allItems.firstIndex(of: item){
            // remove the item from the collections at a specific index
            allItems.remove(at: index)
        }
    }
    
    /**
     rearrange an item in the store
     
     */
    func moveItem(from fromIndex:Int,to toIndex:Int){
        if fromIndex==toIndex{
            return
        }
        
        // Get reference to the object being moved
        let movedItem=allItems[fromIndex]
        
        // Remove item from the collection
        allItems.remove(at: fromIndex)
        
        // Insert item at new location in the collection
        allItems.insert(movedItem, at: toIndex)
    }
}
