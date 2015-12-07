//
//  ButtonSingleton.swift
//  Distress
//
//  Created by Nicholas Largen on 12/7/15.
//  Copyright © 2015 awesomefat. All rights reserved.
//

import UIKit
import Parse
class ButtonSingleton: NSObject
{
    static var currUser : PFUser?
    static var buttonobj = [PFObject]()
    static var buttonnum = 0
    static var buttonName : String?
    static var PhoneNum : Int?
    static var ContactName : String?
    static var count = 0
}
