//
//  nextViewController.swift
//  foodApp1
//
//  Created by Felix ITS 003 on 27/12/18.
//  Copyright © 2018 ankita. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {
    @objc func handle(sender:UISwipeGestureRecognizer)
    {
        let next = navigationController?.viewControllers[0] as! ViewController
        
        self.navigationController?.popToViewController(next, animated: true)
        
    }
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handle(sender:)))
        print("out")
        leftSwipe.direction = UISwipeGestureRecognizerDirection.right
        
        view.addGestureRecognizer(leftSwipe)
       


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
