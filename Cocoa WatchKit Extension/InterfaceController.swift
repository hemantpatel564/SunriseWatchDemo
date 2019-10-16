//
//  InterfaceController.swift
//  Cocoa WatchKit Extension
//
//  Created by MacStudent on 2019-10-16.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var resultlbl: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func showTime() {
        
            
            AF.request("https://api.sunrise-sunset.org/json?lat=43.6532&lng=-79.3832").responseJSON {
                (xyz) in
                
                // 2. write your code to deal with the JSON response
                print(xyz)
                
                let jsonData=JSON(xyz.value)
                let sunrise = jsonData["results"]["sunrise"]
                let sunset = jsonData["results"]["sunset"]
                
                print("Sunrise:\(sunrise)")
                print("Sunset:\(sunset)")
                self.resultlbl.setText(("Sunrise:\(sunrise)"))
                
            }
    }
}


