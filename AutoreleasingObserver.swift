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
    
    convenience init(notifcationName:String, object:AnyObject? = nil, usingBlock:@escaping (Notification) -> Void) {
        let observer = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: notifcationName), object: object, queue: OperationQueue.main, using: usingBlock)
        self.init(observer: observer)
    }
    deinit {
        NotificationCenter.default.removeObserver(observer)
    }
}

extension NotificationCenter {
    func notificationObserverForName(_ notifcationName:NSNotification.Name, object: AnyObject? = nil, queue: OperationQueue = OperationQueue.main, usingBlock: @escaping (Notification) -> Void) -> NotificationObserver {
        let observer = NotificationCenter.default.addObserver(forName: notifcationName, object: object, queue: queue, using: usingBlock)
        return NotificationObserver(observer: observer)
    }
}
