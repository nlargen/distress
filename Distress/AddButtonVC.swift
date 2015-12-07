//
//  AddButtonVC.swift
//  Distress
//
//  Created by Nicholas Largen on 12/7/15.
//  Copyright © 2015 awesomefat. All rights reserved.
//

import UIKit
import Parse
class AddButtonVC: UIViewController {
  

    @IBOutlet weak var MessageTF: UITextField!
    @IBOutlet weak var PhoneTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ButtonNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameTF.becomeFirstResponder()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveButtonPressed(sender: AnyObject)
    {
        ButtonSingleton.count = ButtonSingleton.count + 1
        let buttonsMade = PFObject(className:"ButtonsMade")
        buttonsMade["ContactName"] = nameTF.text
        buttonsMade["ButtonMessage"] = MessageTF.text
        buttonsMade["PhoneNum"] = PhoneTF.text
        buttonsMade["ButtonName"] = ButtonNameTF.text
        ButtonSingleton.buttonnum = ButtonSingleton.buttonnum + 1
        buttonsMade["ButtonNum"] = ButtonSingleton.buttonnum
        //buttonsMade["owner_id"] = PFUser.currentUser()
        
        buttonsMade.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success)
            {
                print("saved")
                ButtonSingleton.buttonName = ButtonSingleton.buttonobj[ButtonSingleton.count].objectForKey("ButtonName") as? String
                //ButtonSingleton.buttonnum = (ButtonSingleton.buttonobj[0].objectForKey("ButtonNum") as? Int)!
                self.dismissViewControllerAnimated(true, completion: nil)
                

                
            }
            else
            {
                print("save error")
                // There was a problem, check error.description
            }
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
