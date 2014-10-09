//
//  BaseCell.swift
//  SlideView
//
//  Created by mito on 10/9/14.
//  Copyright (c) 2014 mito. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {

    @IBOutlet weak var bgIv: UIImageView!
    @IBOutlet weak var titleLabel: PaddingLabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
