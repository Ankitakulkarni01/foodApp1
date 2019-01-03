//
//  LoginViewController.swift
//  foodApp1
//
//  Created by Felix ITS 003 on 27/12/18.
//  Copyright © 2018 ankita. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func sigIn(_ sender: UIButton) {
        let sign = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController")as! SignInViewController
        
        navigationController?.pushViewController(sign, animated: true)
    }
    var allLogIn = [String]()
    var allPassword = [String]()
    @IBAction func btnLog(_ sender: UIButton) {
        let testStr = txtUser.text
        let emailReqEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0_9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailReqEx)
        let val = emailTest.evaluate(with: testStr)
        print(val)
        
        if val == true
        {
            let selectQuery = "SELECT EmailId , password from login where EmailId = '\(txtUser.text!)' and password = '\(txtpass.text!)'"
            
            DBWrapper.sharedObject.selectTask(query: selectQuery)
            allLogIn = DBWrapper.sharedObject.loginArray!
            allPassword = DBWrapper.sharedObject.PasswordArray!
            if(allLogIn.count == 1)
            {
                print("login")
                let alert = UIAlertController(title: "LogIn", message: "User is  signIn", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default){(okAction) in
                    print("Ok pressed")
                    let next = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                    
                    self.navigationController?.pushViewController(next, animated: true)
                    
                }
                
                alert.addAction(okAction)
                
                
                self.present(alert, animated: true, completion: nil)
                //   let next = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
                //   navigationController?.pushViewController(next, animated: true)
                
            }
            else
            {
                let alert = UIAlertController(title: "LogInFailed", message: "User is not signIn", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default){(okAction) in
                    print("Ok pressed")
                    
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
                
            }
        }
    }
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtpass: UITextField!
    @IBOutlet weak var txtUser: UITextField!
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
