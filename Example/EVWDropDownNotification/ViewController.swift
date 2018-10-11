//
//  ViewController.swift
//  EVWDropDownNotification
//
//  Created by CRE8IT GmbH on 06/27/2016.
//  Copyright (c) 2016 CRE8IT GmbH. All rights reserved.
//

import UIKit
import EVWDropDownNotification


class ViewController: UIViewController, EVWDropDownNotificationDelegate {

    
    let notification = EVWDropDownNotification()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func basicNotification(){
        notification.delegate = self
        notification.image = UIImage(named: "notification")
        notification.bottomButtonText = nil
        notification.topButtonText = nil
        notification.dismissOnTap = false
        notification.buttonVerticalAligment = .Bottom
        notification.titleText = "Lorem Ipsum"
        notification.subtitleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit."
    }
    
    func displayNotification(){
        notification.presentInView(view: self.view.superview!, withGravityAnimation: true)
    }
    
    // MARK: - Only Bottom Button
    
    @IBAction func onlyBottom(sender: AnyObject) {
        basicNotification()
        notification.bottomButtonText = "Bottom"
        displayNotification()
    }
    
    // MARK: -  Only Top Button
    
    @IBAction func onlyTop(sender: AnyObject) {
        basicNotification()
        notification.topButtonText = "Top"
        displayNotification()
    }
    
    // MARK: - Both Buttons
    
    @IBAction func bothButtons(sender: AnyObject) {
        basicNotification()
        notification.bottomButtonText = "Bottom"
        notification.topButtonText = "Top"
        displayNotification()
    }
    
    // MARK: - Dismiss On Tap
    
    @IBAction func dismissOnTap(sender: AnyObject) {
        basicNotification()
        notification.dismissOnTap = true
        notification.bottomButtonText = "Bottom"
        notification.topButtonText = "Top"
        displayNotification()
        
    }
    
    // MARK: - Vertical Aligment Top
    
    @IBAction func verticalTop(sender: AnyObject) {
        basicNotification()
        notification.buttonVerticalAligment = .Top
        notification.bottomButtonText = "Bottom"
        notification.topButtonText = "Top"
        displayNotification()
    }
    
    // MARK: - Notification Delegates
    
    func dropdownNotificationBottomButtonTapped() {
        notification.dismissWithGravityAnimation(animation: true)
        print("Bottom Button Tapped")
    }
    
    func dropdownNotificationTopButtonTapped() {
        notification.dismissWithGravityAnimation(animation: true)
        print("Top Button Tapped")
    }
    
    func dropdownNotificationDismissedWithTap() {
        
        /*
         * Dismissed with Gravity not required here
         */
        
        print("Dismissed On Tap")
    }

   

}

