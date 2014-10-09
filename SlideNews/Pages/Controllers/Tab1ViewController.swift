//
//  Tab1ViewController.swift
//  SlideView
//
//  Created by mito on 10/8/14.
//  Copyright (c) 2014 mito. All rights reserved.
//

import UIKit

@objc(Tab1ViewController) class Tab1ViewController:
    TabBaseViewController,
    UITableViewDelegate,
    UITableViewDataSource
{
    
    @IBOutlet weak var tableView: UITableView!
    
    struct TableViewConstants {
        static let tableViewCellIdentifier = "BaseCell"
        static let tableViewCellHeight = 160
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = self.vcFrame!
        
        var tmpRect: CGRect! = self.tableView.frame
        self.tableView.frame = CGRectMake(
            CGRectGetMinX(tmpRect),
            CGRectGetMinY(self.vcFrame!),
            CGRectGetWidth(tmpRect),
            CGRectGetHeight(self.vcFrame!));
        
        // CellのViewをnibで定義
        var cellName: String = self.vcInfo["cellName"]!
        let nib: UINib! = UINib(nibName:cellName , bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: TableViewConstants.tableViewCellIdentifier)
        
//        self.refreshControl = [[UIRefreshControl alloc] init];
//        [self.refreshControl addTarget:self action:@selector(onRefresh:) forControlEvents:UIControlEventValueChanged];
//        [self.tableView addSubview:self.refreshControl];
//        
//        // Create dataSouece & set
//        self.ds = [[BlogTvDataSource alloc]init];
//        self.tableView.dataSource = self.ds;
//        
//        [self retrieveBlogPosts];

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(TableViewConstants.tableViewCellHeight)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewConstants.tableViewCellIdentifier, forIndexPath: indexPath) as BaseCell
        
        return cell
    }
}
