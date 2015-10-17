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
    
    let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
    
    
    func keyboardWillShow(notification: NSNotification!) {
        
    signinScrollView.contentOffset.y = 70
        
    signinView.transform = CGAffineTransformMakeTranslation( 0, -190)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        
        
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
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
            
        presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            
            
            
            }
            
        }
    }


}
