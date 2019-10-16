//
//  ViewController.swift
//  Cocoa
//
//  Created by MacStudent on 2019-10-16.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    

    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func resultButtonpressed(_ sender: Any) {
        
        AF.request("https://api.sunrise-sunset.org/json?lat=43.6532&lng=-79.3832").responseJSON {
            (xyz) in
            
            // 2. write your code to deal with the JSON response
            print(xyz)
            
            let jsonData=JSON(xyz.value)
            let sunrise = jsonData["results"]["sunrise"]
            let sunset = jsonData["results"]["sunset"]
            
            print("Sunrise:\(sunrise)")
             print("Sunset:\(sunset)")
            self.resultLabel.text = ("Sunrise:\(sunrise)")
        
    }
    
}
}
