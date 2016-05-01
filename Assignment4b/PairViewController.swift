//
//  PairViewController.swift
//  Assignment4b
//
//  Created by George Pantazis on 30/04/2016.
//  Copyright © 2016 PAN Software. All rights reserved.
//

import UIKit

class PairViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

   @IBOutlet weak var txtKey: UITextField!
   @IBOutlet weak var txtValue: UITextField!
   @IBOutlet weak var tableView: UITableView!
   
   var KeyValue = Dictionary<String, String>()
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      txtKey.delegate = self
      txtValue.delegate = self
   }
   
   func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
      
      textField.backgroundColor = UIColor.blueColor()
      return true
   }
   
   func textFieldDidEndEditing(textField: UITextField) {
      textField.backgroundColor = UIColor.redColor()
      
   }
   
   func textFieldShouldReturn(textField: UITextField) -> Bool
   {
      var retValue: Bool
      
      if txtKey.text != "" && txtValue.text != ""
      {
         KeyValue[txtKey.text!] = txtValue.text!
    
         tableView.reloadData()
      
         txtKey.text = ""
         txtValue.text = ""

         retValue = true
      }
      else
      {
         retValue = false
      }
      
      return retValue
      
   }
   
   func numberOfSectionsInTableView(tableView: UITableView) -> Int
   {
      return 1
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      print(KeyValue.keys.count)
      return KeyValue.keys.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
   {
      
      let cell = UITableViewCell()
      
      let lazyMapCollection = KeyValue.keys
      
      let stringArray = Array(lazyMapCollection)
     
      let searchKey = stringArray[indexPath.row]
      
      let valueStr = searchKey + " - " + KeyValue[searchKey]!
      
      cell.textLabel?.text = valueStr
      
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
