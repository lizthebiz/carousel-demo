//
//  SignInViewController.swift
//  carousel
//
//  Created by Liz Dalay on 10/14/15.
//  Copyright © 2015 Liz Dalay. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signinScrollView: UIScrollView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signinView: UIView!

    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        
        signinScrollView.contentOffset.y = 70
        
        signinView.transform = CGAffineTransformMakeTranslation( 0, -180)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onTap(sender: UIButton) {
        
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            
            print("empty text fields")
            
            let emptyAlertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            
            // add the OK action to the alert controller
            emptyAlertController.addAction(OKAction)
            
            self.presentViewController(emptyAlertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        }
        
        else if emailTextField.text != "liz@pizza.com" || passwordTextField.text != "sliceofcheese" {
            
            print("one or both text fields incorrect")
            
            self.loadingActivityIndicator.startAnimating()
                
            delay(2){
                
            self.loadingActivityIndicator.stopAnimating()
            
            let incorrectAlertController = UIAlertController(title: "Sign In Failed", message: "Incorrect email addresss and/or password.", preferredStyle: .Alert)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
          
                }
            
            // add the OK action to the alert controller
            incorrectAlertController.addAction(OKAction)
            
            self.presentViewController(incorrectAlertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                }
            }
            
        }
        
        else if emailTextField.text == "liz@pizza.com" && passwordTextField.text == "sliceofcheese" {
            
            print("both text fields correct")
            
            self.loadingActivityIndicator.startAnimating()
        
            delay(2){
                
            self.loadingActivityIndicator.stopAnimating()
                
            self.performSegueWithIdentifier("signinSegue", sender: nil)
            }
                
        }
    }

}
