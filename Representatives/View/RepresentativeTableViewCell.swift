//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Quinten Smith on 9/3/18.
//  Copyright © 2018 Quinten Smith. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var representative: Representative? {
        didSet{
            updateViews()
        }
    }

    func updateViews() {
        
        guard let representative = representative else {return}
        
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        stateLabel.text = representative.state
        districtLabel.text = representative.district
        phoneLabel.text = representative.phone
        urlLabel.text = representative.link
        
    }

}
