//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Quinten Smith on 9/3/18.
//  Copyright © 2018 Quinten Smith. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    let representativeController = RepresentativeController() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            representativeController.searchRepresentatives(forState: state) { (representatives) in
                
                self.representatives = representatives ?? []
                
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }
    
    // Properties
    var representatives: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    var state: String?
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepresentativeTableViewCell
        cell?.representative = representatives[indexPath.row]
        return cell ?? RepresentativeTableViewCell()
    }
}
