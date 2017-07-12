//
//  ViewController.swift
//  Login
//
//  Created by Tung on 6/14/17.
//  Copyright © 2017 Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var addItemView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBAction func btn_showListAccount(_ sender: UIButton) {
        popUpListIn()
    }
    @IBAction func btn_dismissPopUp(_ sender: UIButton) {
        popUpListOut()
    }
    @IBOutlet weak var tf_Username: UITextField!
    @IBOutlet weak var tf_Password: UITextField!
    @IBOutlet weak var textView_ListAccount: UITextView!
    @IBAction func btn_signIn(_ sender: UIButton) {
        if let password = users[tf_Username.text!]{
            if password == tf_Password.text{
                lbl_Message.text = "Sign in is successfuly"
                print("Sign in is successfuly")
            }else{
                lbl_Message.text = "Password is incorrect"
                print("Password is incorrect")
            }
        }else{
            lbl_Message.text = "Username is not available"
            print("Username is not available")
        }
    }
    @IBAction func btn_signUp(_ sender: UIButton) {
        if let password = users[tf_Username.text!]{
            lbl_Message.text = "Username is not available"
        }else{
            users[tf_Username.text!] = tf_Password.text!
            lbl_Message.text = "Create Account successfuly"
        }
        users[tf_Username.text!] = tf_Password.text
    }
    @IBOutlet weak var lbl_Message: UILabel!

    
    var  effect : UIVisualEffect!
    var users = ["tung":"123","admin":"admin","Phuc":"456"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualEffectView.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func popUpListIn(){
        addItemView.isHidden = false
        self.visualEffectView.isHidden = false
        addItemView.layer.cornerRadius = 15
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        addItemView.alpha = 1
        //Print dictionary
        var list = ""
        for (key,value) in users{
            list += "\(key): \(value) \n"
        }
        textView_ListAccount.text = list
        }
    
    func popUpListOut(){
        self.addItemView.alpha = 0
        self.visualEffectView.isHidden = true
    }
}

