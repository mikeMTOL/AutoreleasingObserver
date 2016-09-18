//
//  ViewController.swift
//  AutoreleasingObserver
//
//  Created by mike on 2016-04-28.
//  Copyright © 2016 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let queue = OperationQueue()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // send notification every 100ms
        queue.addOperation { 
            repeat {
                NotificationCenter.default.post(name: Notification.Name(rawValue: someNotification), object: "count \(self.count)")
                self.count += 1
                Thread.sleep(forTimeInterval: 0.1)
            } while true
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

