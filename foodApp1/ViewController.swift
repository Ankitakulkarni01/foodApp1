//
//  ViewController.swift
//  foodApp1
//
//  Created by Felix ITS 003 on 27/12/18.
//  Copyright © 2018 ankita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @objc func handle(sender:UISwipeGestureRecognizer)
{
    let next = self.storyboard?.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
    
    self.navigationController?.pushViewController(next, animated: true)
    }
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() { print("In")
        super.viewDidLoad()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handle(sender:)))
        print("out")
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(leftSwipe)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

