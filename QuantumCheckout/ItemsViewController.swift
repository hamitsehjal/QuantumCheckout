//
//  ItemsViewController.swift
//  QuantumCheckout
//
//  Created by Hamit Sehjal on 2024-02-29.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore:ItemStore!
    
    // add a new item to table
    @IBAction func addNewItem(_ sender:UIButton){
        
    }
    
    /**
     Toggle Editing Mode and inform user the state of the view
     - when user is not in editing mode, title shows "Edit"
     - when user enters editing mode, title shows "Done"
     */
    @IBAction func toggleEditingMode(_ sender:UIButton){
        // If we are currently in editing mode
        if isEditing{
            // change the text on the Button to display "Edit"
            sender.setTitle("Edit", for: .normal)
            
            // turn off the editing mode
            setEditing(false, animated: true)
        }else{
            // change the text on the Button to display "Done"
            sender.setTitle("Done", for: .normal)
            
            // turn on the editing mode
            setEditing(true, animated: true)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        // Get a new or recycled cell with identifier "UITableViewCell" and add it to the table
        let cell=tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // set the text on the cell with the description of the item
        // that is at the nth index of items collections, where n = row this cell
        // will appear on
        
        // Extract the item from the collection
        let item=itemStore.allItems[indexPath.row]
        
        // set the cell labels with the item properties
        cell.textLabel?.text=item.name
        cell.detailTextLabel?.text="$ \(item.price)"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
