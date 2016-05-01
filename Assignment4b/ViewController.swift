//
//  ViewController.swift
//  Assignment4b
//
//  Created by George Pantazis on 30/04/2016.
//  Copyright © 2016 PAN Software. All rights reserved.
//

import UIKit
//class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
//class TableView: UIViewController, UITableViewDataSource, UITextFieldDelegate
class TableView: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

   
   @IBOutlet weak var txtInput: UITextField!

   @IBOutlet weak var tableView: UITableView!
   
   var userInput = [String]()
   

   override func viewDidLoad()
   {
      super.viewDidLoad()
      txtInput.delegate = self
   }

   
   func textFieldShouldReturn(textField: UITextField) -> Bool
   {
      
      userInput.insert(txtInput.text!, atIndex: userInput.count)
      
      tableView.reloadData()
      
      txtInput.text = ""
      
      //DisplayError("Did We", errorMsg: userInput[userInput.count - 1])
      
      return true
   }

   
   func numberOfSectionsInTableView(tableView: UITableView) -> Int
   {
      return 1
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      return userInput.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
      let cell = UITableViewCell()
      
      cell.textLabel?.text = userInput[indexPath.row]

      return cell
   }
   
   func DisplayError(errorTitle: String, errorMsg: String)
   {
      let InputError = UIAlertController(title: errorTitle, message: errorMsg, preferredStyle: UIAlertControllerStyle.Alert)
      
      let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
      
      InputError.addAction(okAction)
      
      self.presentViewController(InputError, animated: true, completion: nil)
      
   }

}

