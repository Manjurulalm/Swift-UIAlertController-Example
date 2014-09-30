//
//  ViewController.swift
//  sampleAlert
//
//  Created by Osamu Nishiyama on 2014/09/30.
//  Copyright (c) 2014年 ever sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBAction func alertBtn(sender: UIButton) {
        let alertController = UIAlertController(title: "Hello!", message: "This is Alert sample.", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func actionSheetBtn(sender: AnyObject) {
        let alertController = UIAlertController(title: "Hello!", message: "This is ActionSheet sample.", preferredStyle: .ActionSheet)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        //For ipad And Univarsal Device
        alertController.popoverPresentationController?.sourceView = sender as UIView;
        alertController.popoverPresentationController?.sourceRect = CGRect(x: (sender.frame.width/2), y: sender.frame.height, width: 0, height: 0)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func choiceBtn(sender: UIButton) {
        let alertController = UIAlertController(title: "Hello!", message: "This is Alert sample.", preferredStyle: .Alert)
        let otherAction = UIAlertAction(title: "OK", style: .Default) {
            action in NSLog("pushed OK!")
        }
        let cancelAction = UIAlertAction(title: "CANCEL", style: .Cancel) {
            action in NSLog("Pushed CANCEL!")
        }
        
        alertController.addAction(otherAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func selectBtn(sender: UIButton) {
        let alertController = UIAlertController(title: "Hello!", message: "This is Alert sample.", preferredStyle: .ActionSheet)
        let firstAction = UIAlertAction(title: "First", style: .Default) {
            action in NSLog("Pushed First")
        }
        let secondAction = UIAlertAction(title: "Second", style: .Default) {
            action in NSLog("Pushed Second")
        }
        let cancelAction = UIAlertAction(title: "CANCEL", style: .Cancel) {
            action in NSLog("Pushed CANCEL")
        }
        
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(cancelAction)

        //For ipad And Univarsal Device
        alertController.popoverPresentationController?.sourceView = sender as UIView;
        alertController.popoverPresentationController?.sourceRect = CGRect(x: (sender.frame.width/2), y: sender.frame.height, width: 0, height: 0)
        alertController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.Up

        presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func inputFieldBtn(sender: UIButton) {
        var inputTextField: UITextField?
        var passwordField: UITextField?
        
        let alertController: UIAlertController = UIAlertController(title: "Login", message: "Input your ID and Password", preferredStyle: .Alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            println("Pushed CANCEL")
        }
        alertController.addAction(cancelAction)

        let logintAction: UIAlertAction = UIAlertAction(title: "Login", style: .Default) { action -> Void in
            println("Pushed Login")
            println(inputTextField?.text)
            println(passwordField?.text)
        }
        alertController.addAction(logintAction)
        
        alertController.addTextFieldWithConfigurationHandler { textField -> Void in
            inputTextField = textField
            textField.placeholder = "ID"
        }
        alertController.addTextFieldWithConfigurationHandler { textField -> Void in
            passwordField = textField
            textField.secureTextEntry = true
            textField.placeholder = "password"
        }
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

