//
//  DataCellClass.swift
//  InstagramDemo
//
//  Created by mysmac_adm!n on 20/01/20.
//  Copyright © 2020 Mridula. All rights reserved.
//

import UIKit

class DataCellClass: UITableViewCell {
    
    
    @IBOutlet weak var PlayerView: PlayerViewClass!
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
