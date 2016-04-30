//
//  AutoreleasingObserver.swift
//  AutoreleasingObserver
//
//  Created by mike on 2016-04-28.
//  Copyright © 2016 mike. All rights reserved.
//

import UIKit

class NotificationObserver:NSObject {
    let observer:NSObjectProtocol
    
    init(observer:NSObjectProtocol) {
        self.observer = observer
        super.init()
    }
    
    convenience init(notifcationName:String, object:AnyObject? = nil, usingBlock:(NSNotification) -> Void) {
        let observer = NSNotificationCenter.defaultCenter().addObserverForName(notifcationName, object: object, queue: NSOperationQueue.mainQueue(), usingBlock: usingBlock)
        self.init(observer: observer)
    }
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(observer)
    }
}

