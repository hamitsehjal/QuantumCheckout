//
//  ItemsViewController.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-02-29.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore:ItemStore!
    
    /**
     Insert a new row to table
     - Add a new item to the Data Source
     - Updates the tableview
     */
    @IBAction func addNewItem(_ sender:UIBarButtonItem){
        
        // Create a new item and add it to the store
        let item = itemStore.createItem()
        
        // Figure out where this item is in the array
        if let row = itemStore.allItems.firstIndex(of: item){
            // Create a new IndexPath object in 0th section, `row` row
            let indexPath=IndexPath(row: row, section: 0)
            // Insert a new row to the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
  
    }
    
    /**
     Toggle Editing Mode and inform user the state of the view
     - when user is not in editing mode, title shows "Edit"
     - when user enters editing mode, title shows "Done"
     */
//    @IBAction func toggleEditingMode(_ sender:UIButton){
//        // If we are currently in editing mode
//        if isEditing{
//            // change the text on the Button to display "Edit"
//            sender.setTitle("Edit", for: .normal)
//            
//            // turn off the editing mode
//            setEditing(false, animated: true)
//        }else{
//            // change the text on the Button to display "Done"
//            sender.setTitle("Done", for: .normal)
//            
//            // turn on the editing mode
//            setEditing(true, animated: true)
//        }
//
//    }
//    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemStore.allItems.count
    }

    
    // Configure the content to be displayed in the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        // Get a new or recycled cell with identifier "UITableViewCell" and add it to the table
        let cell=tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // set the text on the cell with the description of the item
        // that is at the nth index of items collections, where n = row this cell
        // will appear on
        
        // Extract the item from the collection
        let item=itemStore.allItems[indexPath.row]
        
        // set the cell labels with the item properties
        cell.textLabel?.text="\(item.name) (\(item.quantity))"
        cell.detailTextLabel?.text="$ \(item.price)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // remove the item from the data store (itemStore)
            let item=itemStore.allItems[indexPath.row]
            itemStore.removeItem(item)
            
            // Delete the row from the tableview with an animation
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    


    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem=editButtonItem
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // if the triggered segue is the "showItem" segue
        switch segue.identifier{
        case "showItem":
            // Figure out which row was tapped
            if let row = tableView.indexPathForSelectedRow?.row{
                // Get the item associated with the row tapped and pass it along
                let item = itemStore.allItems[row]
                
                let detailController = segue.destination as! DetailViewController
                detailController.item=item
            }
      
        default:
            preconditionFailure("Unexpected Segue Failure")
        }
    }
    

}
