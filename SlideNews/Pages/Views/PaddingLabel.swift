//
//  PaddingLabel.swift
//  SlideView
//
//  Created by mito on 10/9/14.
//  Copyright (c) 2014 mito. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    override func drawTextInRect(rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }
}
