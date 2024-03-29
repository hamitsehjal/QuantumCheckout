//
//  Item.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-02-29.
//

import UIKit

class Item:Equatable{
    var name:String
    var quantityInStock:Int
    var serialNumber:String?
    var price:Float
    var dateCreated:Date
    
    
    // designated initializer
    init(name: String, quantity: Int, price: Float,serial:String?) {
        self.name = name
        self.quantityInStock = quantity
        self.price = price
        self.serialNumber=serial
        self.dateCreated=Date()
        
    }
    
    /**
    Convinience Initializer
    creates a randomly generated Item from pre-defined options
    */
    convenience init(random:Bool=false){
        if random{

            typealias Product=(productName:String,productPrice:Float)
            
            // Creating a array of type - Product(name,price)
            var products:[Product]=[]
            products.append(("Smartphone", 690.99))
            products.append(("Speaker", 149.99))
            products.append(("SmartWatch", 89.99))

            
            
            let product=products.randomElement()! // choose a random value from the products collection
            let productName=product.productName // extract name from the product
            let productPrice=product.productPrice // extract price from the product
            
            let productQuantity=Int.random(in: 1..<6) // generate a random number in the range 1<=5
            let randomSerialNumber=UUID().uuidString.components(separatedBy: "-").first!
            self.init(name:productName,quantity: productQuantity,price:productPrice,serial: randomSerialNumber)
        }
        else{
            self.init(name:"",quantity: 0,price:0.00,serial: nil)
        }
    }
    
    static func ==(lfs:Item,rhs:Item)->Bool{
        return lfs.name==rhs.name
        && lfs.price==rhs.price
        && lfs.quantityInStock==rhs.quantityInStock
        && lfs.dateCreated==rhs.dateCreated
    }
}
