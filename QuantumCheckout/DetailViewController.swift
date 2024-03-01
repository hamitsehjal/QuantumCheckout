//
//  DetailViewController.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-02-29.
//

import UIKit

class DetailViewController: UIViewController {

    
    // DetailViewController holds a reference to the Item that is being currently displayed
    var item:Item!
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var quantityField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleField.text=item.name
        valueField.text="$ \(item.price)"
        quantityField.text="\(item.quantity)"
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
