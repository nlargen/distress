//
//  ViewController.swift
//  Distress
//
//  Created by Michael Litman on 12/4/15.
//  Copyright © 2015 awesomefat. All rights reserved.
//

import UIKit
import Parse
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    
    @IBOutlet weak var theCV: UICollectionView!
    
    override func viewDidLoad()
    {
        let query = PFQuery(className: "ButtonsMade")
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock { (buttondata : [PFObject]?, error: NSError?) -> Void in
            if(buttondata != nil)
            {
                
                
                ButtonSingleton.buttonobj = buttondata!
                
            }
            else
            {
                print("None Found")
            }
            
        }

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        // #warning Incomplete implementation, return the number of items
        return ButtonSingleton.count
    }
    override func viewDidAppear(animated: Bool)
    {
        self.theCV.reloadData()
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCVCell
        
        // Configure the cell
        cell.backgroundColor = UIColor.redColor()
        if(ButtonSingleton.buttonName != nil)
        {
            cell.theLabel.text = ButtonSingleton.buttonName!
        }
        else
        {
            cell.theLabel.text = "User"
        }
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

