//
//  MainViewController.swift
//  Paging_Swift
//
//  Created by Paresh Jain on 5/13/16.
//  Copyright © 2016 swiftiostutorials.com. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {
    var scrollView : UIScrollView?
    var pageControl : UIPageControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        scrollView!.contentSize = CGSizeMake(scrollView!.frame.size.width * 3, scrollView!.frame.size.height)
        scrollView?.delegate = self
        pageControl = UIPageControl(frame:CGRectMake(0, self.view.frame.size.height - 100, scrollView!.frame.size.width, 40))
        pageControl!.numberOfPages = Int(scrollView!.contentSize.width / scrollView!.frame.size.width)
        pageControl!.addTarget(self, action: Selector("changePage:"), forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(scrollView!)
        self.view.addSubview(pageControl!)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl!.currentPage) * scrollView!.frame.size.width
        scrollView!.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) -> () {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width);
        pageControl!.currentPage = Int(pageNumber)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
