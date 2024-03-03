//
//  PurchaseStore.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-03-03.
//

import UIKit

class PurchaseStore{
    var itemsPurchased=[PurchaseHistoryEntry]()
    
    /**
     create a new entry for purchased items  and add that item to collection
     */
    @discardableResult func createNewEntry(item:Item,quantityPurchased:Int)->PurchaseHistoryEntry{
        
        let item=PurchaseHistoryEntry(item: item, quantity: quantityPurchased)
        
        itemsPurchased.append(item)
        
        return item
    }
}
