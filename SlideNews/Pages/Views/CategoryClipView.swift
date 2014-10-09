//
//  CategoryClipView.swift
//  SlideView
//
//  Created by mito on 10/7/14.
//  Copyright (c) 2014 mito. All rights reserved.
//

import UIKit

protocol CategorieClipViewDelegate : NSObjectProtocol{
    func categoryScrollViewDidScroll(sender: CategoryClipView)
}

class CategoryClipView: UIView, UIScrollViewDelegate
{
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    var delegate: CategorieClipViewDelegate?
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    let maxDispCategoryCnt :CGFloat! = 3
    var catPageSize: CGSize!
    
    // なんかこいつつけないといけないみたい
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, categories: NSArray!) {
        
        super.init(frame: frame)

        //self.frame = frame
        self.clipsToBounds = true
        
        // x,y,width,heightすべてCGFloatにしないといけない。厳しい！
        var scrlViewRect:CGRect = CGRectMake(
            CGRectGetMinX(frame) + (CGRectGetWidth(frame)/maxDispCategoryCnt),
            0,
            CGRectGetWidth(frame)/maxDispCategoryCnt,
            CGRectGetHeight(frame))
        self.scrollView = UIScrollView(frame: scrlViewRect)
        self.scrollView.pagingEnabled = true
        self.scrollView.clipsToBounds = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.delegate = self
        self.scrollView.tag = SCC_SCROLLVIEW_TAG
        self.scrollView.backgroundColor = UIColor.clearColor()
        
        self.addSubview(self.scrollView)
        
        if(categories==nil || !categories.isKindOfClass(NSArray)){return;}

        self.catPageSize = CGSizeMake(CGRectGetWidth(scrlViewRect), CGFloat(CATEGORYVIEW_HEIGHT))
        
        let totalWidth: CGFloat = self.catPageSize.width * CGFloat(categories.count)
        self.scrollView.contentSize = CGSizeMake(totalWidth, self.catPageSize.height)
        
        self.pageControl = UIPageControl(frame: CGRectZero)
        self.pageControl.backgroundColor = UIColor.clearColor()
        self.pageControl.numberOfPages = categories.count
        
        var cnt :CGFloat = 0
        for catName in categories{
            var labelFrame: CGRect = CGRectMake(cnt*self.catPageSize.width,0, self.catPageSize.width, self.catPageSize.height)
            var label: UILabel = UILabel(frame: labelFrame)
            label.bounds = labelFrame
            label.textAlignment = NSTextAlignment.Center
            label.font = UIFont.systemFontOfSize(14)
            label.adjustsFontSizeToFitWidth = true
            var aCat: NSDictionary = categories[NSInteger(cnt)] as NSDictionary
            label.text = aCat["name"] as NSString
            label.tag = NSInteger(cnt)
            label.backgroundColor = UIColor.clearColor()
            label.textColor = (NSInteger(cnt)==0) ? UIColor.themeColor() : UIColor.blackColor()
            self.scrollView.addSubview(label)
            cnt++
        }
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        if(pointInside(point, withEvent: event)){
            return self.scrollView
        }
        return nil
    }
    
    // UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var pageWidth: CGFloat = catPageSize.width
        var newPage: CGFloat = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        if(self.pageControl.currentPage != NSInteger(newPage) && self.scrollView.dragging)
        {
            self.pageControl.currentPage = NSInteger(newPage);
            NSLog("ページ %d",self.pageControl.currentPage);
            
           self.changeLabelAttributes()
   
            // デリゲートに通知
            if self.delegate == nil {return}
            if self.delegate?.respondsToSelector("categoryScrollViewDidScroll:") == nil {return}
            
            self.delegate?.categoryScrollViewDidScroll(self)
            
        }
    }
    
    func changeLabelAttributes(){
    
        // 現在のラベルの色を変更
        var scrlView: UIView = self.viewWithTag(SCC_SCROLLVIEW_TAG)!
        for v in scrlView.subviews {
            if v is UILabel {
                var col: UIColor = (v.tag == self.pageControl.currentPage) ? UIColor.themeColor() : UIColor.blackColor()
                let label = v as UILabel
                label.textColor = col
            }
        }

    }
    
}
