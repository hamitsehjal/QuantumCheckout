//
//  ShopViewController.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-03-02.
//

import UIKit

class ShopViewController: UIViewController{
    var shopItems:ItemStore!

    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var itemSelected: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate=self
        pickerView.dataSource=self
        itemSelected.text=shopItems.allItems[0].name
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
        let value="\(shopItems.allItems[row].name)\t \(shopItems.allItems[row].quantity)\t\(shopItems.allItems[0].price)"
        return value
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        itemSelected.text=shopItems.allItems[row].name
    }
}
