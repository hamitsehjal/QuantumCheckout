//
//  ShopViewController.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-03-02.
//

import UIKit

class ShopViewController: UIViewController{
    var shopItems:ItemStore!
    var purchaseHistory:PurchaseStore!
    // item currently selected by User
    var itemSelected:Item!
    // quantity selected by User
    var quantitySelectedByUser:Int!{
        didSet{
            // if quantitySelected goes out of the following range
            // 0 < quantitySelected <  quantity in stock
            // change the totalPrice label's color to red
            // and disable buy button
         
            if quantitySelectedByUser>itemSelected.quantityInStock || quantitySelectedByUser<1{
                totalPriceLabel.textColor=UIColor.red
                buyButton.isEnabled=false
            }
            else{
                totalPriceLabel.textColor=UIColor.black
                buyButton.isEnabled=true
            }
            totalPriceLabel.text="\(Float(quantitySelectedByUser)*itemSelected.price)"
        }
    }

    // helper property to convert numbers to string and vice-versa
    let numberFormatter:NumberFormatter={
        let formatter=NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()
    

    // picker view for representing items
    @IBOutlet var pickerView: UIPickerView!
    // currently selected item
    @IBOutlet var itemSelectedLabel: UILabel!
    // total price
    @IBOutlet var totalPriceLabel: UILabel!
    // reference to Buy Button
    @IBOutlet var buyButton: UIButton!
    
    // Action being triggered for changing quantity
    // Try to unwrap the value first
    // if successful, try to convert the value to int
    @IBAction func quantitySelectedChanged(_ sender: UITextField) {
        if let text=sender.text,
        let value=numberFormatter.number(from: text){
            
            let price=Float(value.intValue)*itemSelected.price
            quantitySelectedByUser=value.intValue
//            totalPrice=price
        }
        
    }
    
    /**
     Action being triggered for buying an item
     // Create a new instance of PurchaseEntryItem using PurchaseStore
     //  - selected Item
     // - quantity selected by user
    */
    
    
    @IBAction func buyNewItem(_ sender: UIButton) {
        
        // create a entry for item Purchased
        purchaseHistory.createNewEntry(item: itemSelected, quantityPurchased: quantitySelectedByUser)
        
        // Notify the User
//        totalPriceLabel.text="\(totalPriceLabel.text)\(✅)"
        totalPriceLabel.text = "\(totalPriceLabel.text!) ✅"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate=self
        pickerView.dataSource=self
        itemSelectedLabel.text=shopItems.allItems[0].name
        itemSelected=shopItems.allItems[0]
        totalPriceLabel.text="\(0.0)"
        buyButton.isEnabled=false
        quantitySelectedByUser=1
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Access the ItemsViewController and set its item store
        let tabController=segue.destination as! UITabBarController
        let navController=tabController.viewControllers![0] as! UINavigationController
        let itemsController=navController.topViewController as! ItemsViewController

        itemsController.itemStore=shopItems
    }
    

}

// Picker View Configuration
extension ShopViewController:UIPickerViewDataSource,UIPickerViewDelegate{
    
    // number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // number of rows in each components
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return shopItems.allItems.count
    }
    
    // title for each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let value="\(shopItems.allItems[row].name)\t \(shopItems.allItems[row].quantityInStock)\t\(shopItems.allItems[0].price)"
        return value
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        // set the currently selected item to itemSelected Property
        itemSelectedLabel.text=shopItems.allItems[row].name
        itemSelected=shopItems.allItems[row]
        quantitySelectedByUser=1
        
        
    }
}
