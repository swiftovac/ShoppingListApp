//
//  ViewController.swift
//  ShopListApp
//
//  Created by Stefan Milenkovic on 3/4/19.
//  Copyright © 2019 Stefan Milenkovic. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        title = "Shopping List"
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForItem))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Clear list", style: .plain, target: self, action: #selector(clearList))
        
        
        
    
    
    }
    
    @objc func clearList() {
        
        shoppingList.removeAll()
        tableView.reloadData()
        
    }
    
    
    @objc func promptForItem() {
        
        let ac = UIAlertController(title: "Add Item", message: "Enter item to be added to shopping list", preferredStyle: .alert)
        
        ac.addTextField()
        
        let addItemAction = UIAlertAction(title: "Add", style: .default) {
            [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else {return}
            self?.addItem(item: item)
        }
        
   
        
        ac.addAction(addItemAction)
        present(ac, animated: true, completion: nil)
        
        
        
    }
    
    @objc func addItem(item: String) {
        shoppingList.insert(item.lowercased(), at: 0)
        let indePath = IndexPath(row: 0, section: 0)
        
        tableView.insertRows(at: [indePath], with: .automatic)
        return
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }

}

