//
//  FirstCustomSegue.swift
//  Tipsy
//
//  Created by Aaron Tourtellot on 1/14/16.
//  Copyright © 2016 Aaron Tourtellot. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {
    
    
    override func perform() {
        // Assign the source and destination views to local variables.
        
        let firstVC = self.sourceViewController as! DataViewController
        NSLog("%.2f",firstVC.currentNumber)
        // let total = firstVC.total
        
        let secondVC = self.destinationViewController as! SecondViewController
        
        secondVC .setFloatTotal(firstVC.currentNumber)
        
        let firstVCView = self.sourceViewController.view as UIView!
        let secondVCView = self.destinationViewController.view as UIView!
        
        // Get the screen width and height.
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Specify the initial position of the destination view.
        secondVCView.frame = CGRectMake(screenWidth, 0.0, screenWidth, screenHeight)
        
        // Access the app's key window and insert the destination view above the current (source) one.
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        // Animate the transition.
        UIView.animateWithDuration(0.8, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, -screenWidth, 0.0)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, -screenHeight)
            
            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as UIViewController,
                    animated: false,
                    completion: nil)
        }
        
    }

}
