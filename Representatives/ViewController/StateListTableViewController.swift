//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Quinten Smith on 9/3/18.
//  Copyright © 2018 Quinten Smith. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatesCell", for: indexPath)
        
        let state = States.all[indexPath.row]
        cell.textLabel?.text = state
        return cell
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? StateDetailTableViewController,
            let selectedIndex = tableView.indexPathForSelectedRow?.row {
            
            let state = States.all[selectedIndex]
            destinationViewController.state = state
        }
        
    }
}
