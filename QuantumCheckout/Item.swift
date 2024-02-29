//
//  Item.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-02-29.
//

import UIKit

class Item{
    var name:String
    var quantity:Int
    var price:Float
    var dateCreated:Date
    
    
    // designated initializer
    init(name: String, quantity: Int, price: Float) {
        self.name = name
        self.quantity = quantity
        self.price = price
        self.dateCreated=Date()
    }
    
    /**
    Convinience Initializer
    creates a randomly generated Item from pre-defined options
    */
    convenience init(random:Bool=false){
        if random{

            typealias Product=(productName:String,productPrice:Float)
            
            // Creating a array of Product Tuples
            var products:[Product]=[]
            products.append(("Computer", 400.99))
            products.append(("Monitor", 200.99))
            products.append(("Smartphone", 690.99))
            products.append(("Speaker", 149.99))
            products.append(("SmartWatch", 89.99))

            
            
            let product=products.randomElement()! // choose a random value from the products collection
            let productName=product.productName // extract name from the product
            let productPrice=product.productPrice // extract price from the product
            
            let productQuantity=Int.random(in: 1..<6) // generate a random number in the range 1<=5
            
            self.init(name:productName,quantity: productQuantity,price:productPrice)
        }
        else{
            self.init(name:"",quantity: 0,price:0.00)
        }
    }
}
