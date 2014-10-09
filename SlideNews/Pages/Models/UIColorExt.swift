//
//  UIColorEXT.swift
//  SwiftHN
//
//  Created by Thomas Ricouard on 05/06/14.
//  Copyright (c) 2014 Thomas Ricouard. All rights reserved.
//

import UIKit

public extension UIColor {
    
    public class func RGBColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
    
    public class func catClipViewBgColor() -> UIColor {
        return UIColor.RGBColor(245, green: 245, blue: 245)
    }

    public class func themeColor() -> UIColor {
        return UIColor.RGBColor(250, green: 202, blue: 51)
    }
}