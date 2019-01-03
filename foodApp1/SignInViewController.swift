//
//  SignInViewController.swift
//  foodApp1
//
//  Created by Felix ITS 003 on 27/12/18.
//  Copyright © 2018 ankita. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBAction func btnSignIn(_ sender: UIButton) {
        let testStr = txtemail.text
        let emailReqEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0_9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailReqEx)
        let val = emailTest.evaluate(with: testStr)
        print(val)
        if( txtPassword.text != "" && txtVerify.text != "" &&  txtemail.text! != "" && txtname.text != ""){
            if val == true
            { if(txtPassword.text == txtVerify.text)
            {
                let insertQuery = "Insert into login(userName , EmailId , password) values('\(txtname.text!)','\(txtemail.text!)','\(txtPassword.text!)')"
                let isSuccess = DBWrapper.sharedObject.executeQuery(query: insertQuery)
                if isSuccess
                {
                    let alert = UIAlertController(title: "LogIn", message: "User is  signIn", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default){(okAction) in
                        print("Ok pressed")
                      
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    lblv.text = "*"
                    lblpass.text = "*"
                }
            }
            else
            { lblEmail.text = "*"
                let alert = UIAlertController(title: "LogInFailed", message: "User is not signIn", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default){(okAction) in
                    print("Ok pressed")
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
                }
            }
            else
            {
                print("Email is incomplete")
            }
        }
        else
        {
            if txtPassword.text == ""
            {
                lblpass.isHidden = false
                
            }
            if txtname.text == ""
            {
                lbluser.isHidden = false
            }
            if txtVerify.text == ""
            {
                lblv.isHidden = false
            }
            if txtemail.text == ""
            {
                lblEmail.isHidden = false
            }
            let alert = UIAlertController(title: "Field Empty", message: "Empty", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default){(okAction) in
                print("Ok pressed")
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBOutlet weak var lblv: UILabel!
    @IBOutlet weak var lblpass: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lbluser: UILabel!
    @IBOutlet weak var txtVerify: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
