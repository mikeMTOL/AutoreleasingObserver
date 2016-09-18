//
//  AutoreleasingObserverTests.swift
//  AutoreleasingObserverTests
//
//  Created by mike on 2016-04-29.
//  Copyright © 2016 mike. All rights reserved.
//

import Foundation
import XCTest

class AutoreleasingObserverTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNotifiationObserver() {
        typealias notification_block = (Notification) -> Void
        var observer:NotificationObserver?
        
        weak var objProtocol = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow, object: nil, queue: OperationQueue.main, using: { (notification) in
            debugPrint("im here:\(observer)")
        })
        
        observer = NotificationObserver(observer: objProtocol!)
        
        // nil `observer` to force a dealloc.
        observer = nil
        
        // `objProtocol` should be nil if NotificationObserver is doing it's job
        XCTAssertNil(objProtocol, "Returned observer hasnt been dealloc'd")
        
    }
    
    
}
