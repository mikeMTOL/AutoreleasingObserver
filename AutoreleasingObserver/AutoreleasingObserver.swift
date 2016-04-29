//
//  AutoreleasingObserver.swift
//  AutoreleasingObserver
//
//  Created by mike on 2016-04-28.
//  Copyright © 2016 mike. All rights reserved.
//

import UIKit

class NotificationObserverHolder:NSObject {
    let observer:NSObjectProtocol
    init(notifcationName:String, object:AnyObject? = nil, usingBlock:(NSNotification) -> Void) {
        observer = NSNotificationCenter.defaultCenter().addObserverForName(notifcationName, object: object, queue: NSOperationQueue.mainQueue(), usingBlock: usingBlock)
        super.init()
    }
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(observer)
    }
}

extension NSObject {
    private struct AssociatedKeys {
        static var observerArrayKey = "notificationObserverArrayKey"
    }
    
    internal var observers:[NotificationObserverHolder]? {
        get {
            if let arr = objc_getAssociatedObject(self, &AssociatedKeys.observerArrayKey) as? [NotificationObserverHolder] {
                return arr
            } else {
                objc_setAssociatedObject(self, &AssociatedKeys.observerArrayKey, [], objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return []
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.observerArrayKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func registerObserver(notifcationName:String, object:AnyObject? = nil, usingBlock:(NSNotification) -> Void) {
        let obj = NotificationObserverHolder(notifcationName: notifcationName, object: object, usingBlock: usingBlock)
        observers?.append(obj)
    }
    
    func postNotification(notificationName:String, object:AnyObject? = nil, userInfo:[NSString:AnyObject]? = nil) {
        NSNotificationCenter.defaultCenter().postNotificationName(notificationName, object: object, userInfo: userInfo)
    }
}
