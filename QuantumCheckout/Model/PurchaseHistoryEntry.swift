//
//  PurchaseHistoryEntry.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-03-03.
//

import UIKit

class PurchaseHistoryEntry:Item{
    var purchaseDate:Date
    var purchaseQuantity:Int
    
    // designated initializer
    init(item:Item,quantity:Int){
        
        self.purchaseQuantity=quantity
        self.purchaseDate=Date()
        
        super.init(name:item.name,quantity: item.quantityInStock,price: item.price)
    }
}
