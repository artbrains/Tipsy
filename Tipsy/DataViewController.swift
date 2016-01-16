//
//  DataViewController.swift
//  Tipsy
//
//  Created by Aaron Tourtellot on 1/4/16.
//  Copyright © 2016 Aaron Tourtellot. All rights reserved.
//

import UIKit


class DataViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var dataObject: String = ""
    var result = Float()
    var currentNumber = Float(Int())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataLabel.text = ("\(result)")
        
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
    }
    
    func updateDataLabel() {
        dataLabel!.text = "\(result)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //        self.dataLabel!.text = dataObject
    }
    
    @IBAction func btnNumberInput(sender: UIButton) {
        currentNumber = currentNumber * 10 + Float(sender.titleLabel!.text!)!
        dataLabel.text = ("$" + "\(currentNumber)")
        
        
    }
    
    @IBAction func btnOperation(sender: UIButton) {
        
        currentNumber = 0
        dataLabel.text = ("\(result)")
        
        if(sender.titleLabel!.text == "=") {
            result = 0
        }
        
    }
    
    @IBAction func btnClear(sender: UIButton) {
        result = 0
        currentNumber = 0
        dataLabel.text = ("\(result)")
    }

    func showSecondViewController() {
        self.performSegueWithIdentifier("idFirstSegue", sender: self)
    }
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
        
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier{
            if id == "idFirstSegueUnwind" {
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)!
    }
}

