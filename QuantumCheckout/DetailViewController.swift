//
//  DetailViewController.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-02-29.
//

import UIKit

class DetailViewController: UIViewController {

    
    // DetailViewController holds a reference to the Item that is being currently displayed
    var item:Item!{
        didSet{
            navigationItem.title=item.name
        }
    }
    
    @IBOutlet var titleField: UITextField! // name of the item
    @IBOutlet var valueField: UITextField! // price of the item
    @IBOutlet var quantityField: UITextField! // quantity of the item
    
    let numberFormatter:NumberFormatter={
        let formatter=NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits=2
        formatter.minimumFractionDigits=2
        return formatter
    }()
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        
        // navigate back to ItemsViewController
        // pop off the current view controller from navigation controller's view controller stack
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        
        // Save changes to item
        item.name=titleField.text ?? ""
        
        // Attempt to convert Quantity Field's value(string) to Item's Quantity (Int)
        // First unwrap the text field's value using Optional Binding
        // If sucessful, unwrap the the value returned by converting string version to NSNumber
        // If that worked, assign the NSNumbe.intValue to the item's quantity property
        if let quantityText=quantityField.text,
           let value=numberFormatter.number(from: quantityText){
            item.quantityInStock=value.intValue
        }
        
        // Attempt to convert Price Field's value(string) to Item's Price (decimal)
        if let priceText=valueField.text,
           let value=numberFormatter.number(from: priceText){
            item.price=value.floatValue
        }
        
        // navigate back to ItemsViewController
        // pop off the current view controller from navigation controller's view controller stack
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleField.text=item.name
        // convert price value to string and assign to label
        valueField.text=numberFormatter.string(from: NSNumber(value: item.price))
        quantityField.text="\(item.quantityInStock)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
