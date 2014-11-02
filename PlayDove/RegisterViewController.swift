//
//  RegisterViewController.swift
//  PlayDove
//
//  Created by Austin Truong on 10/28/14.
//  Copyright (c) 2014 LineBreak. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController{
    
    @IBOutlet weak var textboxName: UITextField!
    @IBOutlet weak var textboxPasssword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.redColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func registerAction(sender: AnyObject) {
        NSLog("Hello world")
        
       registerUser()
    }
    
    func registerUser(){
        var userObject = PFObject(className: "User")
        userObject.setObject(textboxName.text, forKey: "name")
        userObject.setObject(textboxPasssword.text, forKey: "password")
        userObject.saveInBackgroundWithBlock{
            (success: Bool!, error: NSError!) -> Void in
            if success != nil {
                NSLog("User \(userObject.objectId)")
            }
            else{
                NSLog("%@", error)
            }
        }
        
    }
}
