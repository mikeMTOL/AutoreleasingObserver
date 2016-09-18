//
//  ListeningViewController.swift
//  AutoreleasingObserver
//
//  Created by mike on 2016-04-28.
//  Copyright © 2016 mike. All rights reserved.
//

import UIKit

let someNotification = Notification.Name("someNotificationNotification")
class ListeningViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var observer:NotificationObserver? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // register for notifications.. dont remove observer on deinit
        // it's autoreleasing
        observer = NotificationCenter.default.notificationObserverForName(someNotification) { [unowned self](notification) in
            self.label.text = notification.object as? String
        }
        
    }

    deinit {
        debugPrint("Did deinit")
    }
    
    @IBAction func closeAction(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
