//
//  ViewController.swift
//  Todoey
//
//  Created by Sarju Mulmi on 8/18/18.
//  Copyright © 2018 Sarju Mulmi. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
//    MARK - tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark ? (tableView.cellForRow(at: indexPath)?.accessoryType = .none) : (tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
// MARK - Add new item
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        var textField = UITextField()
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what happens after user clicks Add Item button on our alert
            if textField.text!.count > 0 {
                self.itemArray.append(textField.text!)
                self.tableView.reloadData()
                print(textField.text!)
                print(self.itemArray)
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

