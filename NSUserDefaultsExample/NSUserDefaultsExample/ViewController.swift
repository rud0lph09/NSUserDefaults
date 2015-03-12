//
//  ViewController.swift
//  NSUserDefaultsExample
//
//  Created by Rodolfo Castillo on 12/03/15.
//  Copyright (c) 2015 Rodolfo Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var demon: String = ""

    @IBOutlet weak var segColour: UISegmentedControl!
    
    @IBAction func BGColour(sender: UISegmentedControl) {
        println("BG selected ID: \(self.segColour.selectedSegmentIndex)")
        
        //This var is just there for nothing... really!
        
        //Just to see how segmentControls work
        
        //We declare a switch to change color of view
        
        switch(segColour.selectedSegmentIndex){
        case 0:
            self.view.backgroundColor = UIColor.redColor()
        case 1:
            self.view.backgroundColor = UIColor.blueColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        default:
            demon = "h"
        }
        
    }
    
    @IBAction func savePrf(sender: AnyObject) {
        let bgColourNo = segColour.selectedSegmentIndex
        userDefaults.setObject(bgColourNo, forKey: "bgcolor")
        userDefaults.synchronize()
        println("BG Saved at ID: \(segColour.selectedSegmentIndex)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var bgColourNo: Int? = userDefaults.objectForKey("bgcolor") as Int?
        if(bgColourNo == nil){
            bgColourNo = 1
            userDefaults.setObject(bgColourNo, forKey: "bgcolor")
            println("BG: wuz nil")
        } else {
            println("BG: wuznt nil")
        }
        
        switch(bgColourNo!){
        case 0:
            self.view.backgroundColor = UIColor.redColor()
        case 1:
            self.view.backgroundColor = UIColor.blueColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        default:
            demon = "h"
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

