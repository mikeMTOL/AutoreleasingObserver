# AutoreleasingObserver
Autoreleasing NSNotification observers in swift

# Installation
Copy AutoreleasingObserver.swift to your project

# Usage
There are two ways to create auto-releasing NSNotificationCenter observers with completion blocks

1- Use NSNotificationCenter extension's function: `notificationObserverForName`
2- Use convenience init of NotificationObserver class

NOTE: You must save the returned object in a strong referenced instance variable within it's parent class.. Please look at example code below:
```swift
class ViewController:UIViewController {
	
	// instance variable that will hold your notification
	var observer:NotificationObserver? = nil
	
	override viewDidLoad() {
        super.viewDidLoad()

        // register for notifications.. dont remove observer on deinit
        // it's autoreleasing
        observer = NSNotificationCenter.defaultCenter().notificationObserverForName(someNotification) { [weak self](notification) in
            self?.label.text = notification.object as? String
        }	
	}
}
```
# License
MIT
