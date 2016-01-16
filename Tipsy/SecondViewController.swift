//
//  SecondViewController.swift
//  Tipsy
//
//  Created by Aaron Tourtellot on 1/14/16.
//  Copyright © 2016 Aaron Tourtellot. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var billTotal = Float()
    
    override func viewDidLoad() {

        
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFirstViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        TipControl.selectedSegmentIndex = 0;
        
        let tipMultiplier = 0.1 + Float(TipControl.selectedSegmentIndex) * 0.05
        
        BillAmount.text = NSString.init(format: "$%.2f",billTotal) as String;
        
        TipAmount.text = NSString.init(format: "$%.2f",billTotal*tipMultiplier) as String;
        
        TotalBill.text = NSString.init(format: "$%.2f",billTotal + billTotal*tipMultiplier) as String;
        
        
        
    }
    
    func showFirstViewController() {
        self.performSegueWithIdentifier("idFirstSegueUnwind", sender: self)
    }
    func setFloatTotal(floatTotal : Float) {
        NSLog("Setting total: %.2f", floatTotal)
        
        billTotal = floatTotal;
    }
    
    //Labels
    
    @IBOutlet weak var TipAmount: UILabel!
    
    @IBOutlet weak var BillAmount: UILabel!
    
    @IBOutlet weak var TotalBill: UILabel!
    
    @IBOutlet weak var TipControl: UISegmentedControl!
    
    @IBAction func TipPercentage(sender: UISegmentedControl) {
        
        let tipMultiplier = 0.1 + Float(TipControl.selectedSegmentIndex) * 0.05
        
        BillAmount.text = NSString.init(format: "$%.2f",billTotal) as String;
        
        TipAmount.text = NSString.init(format: "$%.2f",billTotal*tipMultiplier) as String;
        
        TotalBill.text = NSString.init(format: "$%.2f",billTotal + billTotal*tipMultiplier) as String;
    }
    
    
    
    
    
}
