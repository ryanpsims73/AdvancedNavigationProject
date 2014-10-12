//
//  TabBarViewController.swift
//  AdvancedNavigationProject
//
//  Created by Ryan Sims on 10/8/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIScrollViewDelegate {
    
    var firstViewController: UIViewController!
    var secondViewController: UIViewController!
    var thirdViewController: UIViewController!
    

    @IBOutlet weak var indicatorChip: UIView!
    var activeTab: Int!

    @IBOutlet weak var containerView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var storyboard = UIStoryboard(name: "Main", bundle: nil)

        firstViewController = storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as UIViewController
        secondViewController = storyboard.instantiateViewControllerWithIdentifier("SecondViewController") as UIViewController
        thirdViewController = storyboard.instantiateViewControllerWithIdentifier("ThirdViewController") as UIViewController
        
        // simulate button click to load the tab
        //onFirstButton(self)
        
        containerView.contentSize = CGSize(width: 320 * 3, height: containerView.frame.height)
        
        containerView.addSubview(firstViewController.view)
        self.addChildViewController(firstViewController)
        firstViewController.view.frame.origin = CGPoint(x: 0,y: 0)
        firstViewController.didMoveToParentViewController(self)
        
        containerView.addSubview(secondViewController.view)
        secondViewController.view.frame.origin = CGPoint(x: 320,y: 0)

        containerView.addSubview(thirdViewController.view)
        thirdViewController.view.frame.origin = CGPoint(x: 320*2,y: 0)
        
        containerView.delegate = self

    }
    
    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func scrollViewDidScroll(containerView: UIScrollView) {
        //println("did scroll")
        
        indicatorChip.frame.origin.x = convertValue(containerView.contentOffset.x, r1Min: 0.0, r1Max: 640.0, r2Min: 14.0, r2Max: 245.0)
        
    }

    @IBAction func onFirstButton(sender: AnyObject) {
        println("onFirstButton")
        activeTab = 1
        
        self.containerView.scrollRectToVisible(self.firstViewController.view.frame, animated: true)

        //containerView.frame = firstViewController.view.frame
        //containerView.addSubview(firstViewController.view)
    }
    
    @IBAction func onSecondButton(sender: AnyObject) {
        println("onSecondButton")
        activeTab = 2

        self.containerView.scrollRectToVisible(self.secondViewController.view.frame, animated: true)
    }
    
    @IBAction func onThirdButton(sender: AnyObject) {
        println("onThirdButton")
        activeTab = 3
        
        self.containerView.scrollRectToVisible(self.thirdViewController.view.frame, animated: true)
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
