//
//  SlideViewController.swift
//  SlideView
//
//  Created by mito on 10/2/14.
//  Copyright (c) 2014 mito. All rights reserved.
//    


import UIKit

class SlideViewController: UIViewController, CategorieClipViewDelegate, UIScrollViewDelegate {
   
    // objcでいう@propertyのつもり
    var vcs: Array<TabBaseViewController>? = []
    var catClipView: CategoryClipView!
    var contentScrlViewControl: UIPageControl!
    var contentScrlView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBarHidden = true;

        /*****************
        カテゴリー名(画面上部)の横スクロールビュー
        *****************/
        let categories: Array<Dictionary<String,String>> =
        [
            [
                "name":"カラパイア","className":"Tab1ViewController",
                "nibName":"Tab1ViewController",
                "cellName":"BaseCell",
                "rssUrl":"http://karapaia.livedoor.biz/index.rdf"
            ],
            [
                "name":"ガジェット通信","className":"Tab1ViewController",
                "nibName":"Tab1ViewController",
                "cellName":"BaseCell",
                "rssUrl":"http://getnews.jp/feed/ext/orig"
            ],
            [
                "name":"tidaブログ","className":"Tab1ViewController",
                "nibName":"Tab1ViewController",
                "cellName":"BaseCell",
                "rssUrl":"http://tidanews.ti-da.net/index.rdf"
            ]
        ]
        
        let catScrlRect =
        CGRectMake(0, 0,CGRectGetWidth(self.view.frame),CGFloat(CATEGORYVIEW_HEIGHT)+20)
        self.catClipView = CategoryClipView(frame: catScrlRect, categories: categories)
        self.catClipView.delegate = self
        self.catClipView.backgroundColor = UIColor.catClipViewBgColor()
        self.view.addSubview(self.catClipView)

        /*****************
        コンテンツ(画面下部)の横スクロールビュー
        *****************/
        var contentScrlViewRect: CGRect = CGRectMake(0, CGRectGetMaxY(catScrlRect),
            CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-CGRectGetHeight(catScrlRect))
        self.contentScrlView = UIScrollView(frame: contentScrlViewRect)
        self.contentScrlView.bounds = contentScrlViewRect
        self.contentScrlView.clipsToBounds = false
        self.contentScrlView.pagingEnabled = true
        self.contentScrlView.showsHorizontalScrollIndicator = false
        self.contentScrlView.delegate = self
        self.contentScrlView.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.contentScrlView)
        
        var totalWidth: CGFloat = CGRectGetWidth(contentScrlViewRect) * CGFloat(categories.count)
        self.contentScrlView.contentSize = CGSizeMake(totalWidth, CGRectGetHeight(contentScrlViewRect))
        
        self.contentScrlViewControl = UIPageControl(frame: CGRectZero)
        self.contentScrlViewControl.backgroundColor = UIColor.clearColor()
        self.contentScrlViewControl.numberOfPages = categories.count
        
        // カテゴリごとのviewを張り付けていく
        var cnt: CGFloat = 0.0
        for aDic : Dictionary<String,String> in categories {
            var vcFrame: CGRect = CGRectMake(cnt*CGRectGetWidth(contentScrlViewRect), 0.0,
                CGRectGetWidth(contentScrlViewRect), CGRectGetHeight(contentScrlViewRect))
            let vcClass = NSClassFromString(aDic["className"]) as TabBaseViewController.Type
            let vc: TabBaseViewController = vcClass(frame: vcFrame, info: aDic)
            self.vcs?.append(vc)
            self.contentScrlView.addSubview(vc.view)
            
            cnt++
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func categoryScrollViewDidScroll(sender: CategoryClipView) {

        //[self changeContent];
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
