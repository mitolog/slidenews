//
//  TabBaseViewController.swift
//  SlideView
//
//  Created by mito on 10/8/14.
//  Copyright (c) 2014 mito. All rights reserved.
//

import UIKit

class TabBaseViewController: UIViewController {

    var vcFrame: CGRect?
    var vcInfo: Dictionary<String, String>
    
    required init(coder aDecoder: NSCoder) {
        self.vcInfo = ["":""]
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.vcFrame = CGRectZero
        self.vcInfo = ["":""]
        super.init(nibName: nibNameOrNil?, bundle: nibBundleOrNil?)
    }
    
    required convenience init(frame: CGRect?, info: Dictionary<String, String>) {
        self.init(nibName: info["nibName"], bundle: nil)
        self.vcInfo = info
        self.vcFrame = frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
