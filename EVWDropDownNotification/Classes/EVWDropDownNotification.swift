//
//  EVWDropDownNotification.swift
//
//
//  Created by CRE8IT GmbH on 26/06/16.
//  Copyright © 2016 CRE8IT GmbH. All rights reserved.
//

import Foundation
import UIKit

public protocol EVWDropDownNotificationDelegate {
    func dropdownNotificationTopButtonTapped()
    func dropdownNotificationBottomButtonTapped()
    func dropdownNotificationDismissedWithTap()
}

public enum ButtonPosition {
    case Bottom
    case Top
}

public class EVWDropDownNotification: NSObject {
    
    private var titleLabel:UILabel?
    private var subTitileLabel:UILabel?
    private var imageView:UIImageView?
    private var topButton:UIButton?
    private var bottomButton:UIButton?
    
    private var screenSize:CGSize?
    private var animator:UIDynamicAnimator?
    private var gravityAnimation:Bool?
    private var notificationView:UIView?
    private var isBeingShown:Bool = false
    
    public var delegate:EVWDropDownNotificationDelegate?
    
    
    
    /*
     * Padding between elements
     */
    public var paddingBetweenElements:CGFloat = 10
    
    /*
     * Background Color If set, it overwrites the blur effect
     */
    public var backgroundColor:UIColor?
    
    /*
     * Title Attributes
     */
    public var titleLabelFontSize:CGFloat = 19
    public var titleLabelColor:UIColor = UIColor.black
    public var titleText:String?
    
    /*
     * Subtitle Attributes
     */
    public var subTitleLabelFontSize:CGFloat = 14
    public var subTitleLabelColor:UIColor = UIColor.black
    public var subtitleText:String?
    
    /*
     * General Button Attributes
     */
    public var buttonFontSize:CGFloat = 13
    public var buttonCornerRadius:CGFloat = 10
    public var buttonBorderWidth:CGFloat = 1
    public var buttonBorderColor:UIColor = UIColor.black
    public var buttonWidth:CGFloat = 75
    public var buttonHeight:CGFloat = 30
    public var buttonVerticalAligment:ButtonPosition = .Bottom
    
    /*
     * Top Button Attributes
     */
    public var topButtonText:String?
    public var topButtonTextColor:UIColor = UIColor.black
    public var topButtonBackgroundColor:UIColor = UIColor.clear
    
    
    /*
     * Bottom Button Attributes
     */
    public var bottomButtonText:String?
    public var bottomButtonTextColor:UIColor = UIColor.black
    public var bottomButtonBackgroundColor:UIColor = UIColor.clear
    
    /*
     * Icon Attribute -> Size is squared
     */
    public var imageSquaredSize:CGFloat = 40
    public var image:UIImage?
    
    
    /*
     * Dismiss On Tap
     */
    public var dismissOnTap:Bool = false
    
    
    
    // MARK: - INIT Method
    
    override public init() {
        
        super.init()
        
        notificationView = UIView()
        
        titleLabel = UILabel()
        titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: titleLabelFontSize)
        titleLabel?.textColor = titleLabelColor
        
        subTitileLabel = UILabel()
        subTitileLabel?.font = UIFont(name: "HelveticaNeue", size: subTitleLabelFontSize)
        subTitileLabel?.numberOfLines = 0
        subTitileLabel?.textColor = subTitleLabelColor
        
        imageView = UIImageView()
        imageView?.image = nil
        
        topButton = UIButton(type: .custom)
        topButton?.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: buttonFontSize)
        topButton?.setTitleColor(topButtonTextColor, for: .normal)
        topButton?.adjustsImageWhenHighlighted = true
        topButton?.backgroundColor = topButtonBackgroundColor
        
        topButton?.layer.cornerRadius = buttonCornerRadius
        topButton?.layer.borderColor = buttonBorderColor.cgColor
        topButton?.layer.borderWidth = buttonBorderWidth
        topButton?.layer.masksToBounds = true
        
        
        bottomButton = UIButton(type: .custom)
        bottomButton?.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: buttonFontSize)
        bottomButton?.setTitleColor(bottomButtonTextColor, for: .normal)
        bottomButton?.adjustsImageWhenHighlighted = true
        bottomButton?.backgroundColor = bottomButtonBackgroundColor
        
        bottomButton?.layer.cornerRadius = buttonCornerRadius
        bottomButton?.layer.borderColor = buttonBorderColor.cgColor
        bottomButton?.layer.borderWidth = buttonBorderWidth
        bottomButton?.layer.masksToBounds = true
        
        screenSize = UIScreen.main.bounds.size
        
    }
    
    // MARK: - PresentView Method
    
    public func presentInView(view:UIView, withGravityAnimation animation:Bool) {
        
        if isBeingShown == false {
            
            imageView?.image = image
            titleLabel?.text = titleText
            subTitileLabel?.text = subtitleText
            topButton?.setTitle(topButtonText, for: .normal)
            bottomButton?.setTitle(bottomButtonText, for: .normal)
            
            
            // Calculation
            let textWidth = Int( (screenSize?.width)! - ( 4 * paddingBetweenElements) - imageSquaredSize - buttonWidth)
            let titleAttr = [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Medium", size: titleLabelFontSize)!]
            let titleHeight = NSString(string: titleLabel!.text!).boundingRect(with: CGSize(width: textWidth,height: 999), options: .usesLineFragmentOrigin, attributes: titleAttr, context: nil).size.height
            
            let subtitleAttr = [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue", size: subTitleLabelFontSize)!]
            let subtitleHeight = NSString(string: subTitileLabel!.text!).boundingRect(with: CGSize(width: textWidth,height: 999), options: .usesLineFragmentOrigin, attributes: subtitleAttr, context: nil).size.height
            
            var notificationHeight = (20 + paddingBetweenElements + titleHeight + (paddingBetweenElements / 2) + subtitleHeight + paddingBetweenElements)
            
            if notificationHeight < 100 {
                notificationHeight = 100
            }
            
            
            // Notification View
            notificationView!.frame = CGRect(x: 0, y: -notificationHeight, width: screenSize!.width, height: notificationHeight)
            
            //notificationView!.backgroundColor = backgroundColor
            
            view.addSubview(notificationView!)
            view.bringSubviewToFront(notificationView!)
            
            
            if NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1 && backgroundColor == nil {
                let visualEffect = UIBlurEffect(style: .light)
                let blurView = UIVisualEffectView(effect: visualEffect)
                blurView.frame = (notificationView?.bounds)!
                notificationView?.addSubview(blurView)
            }else{
                notificationView?.backgroundColor = backgroundColor
            }
            
            //Image View
            
            imageView?.frame = CGRect(x: paddingBetweenElements, y: (notificationHeight/2)-(paddingBetweenElements/2)+(20/2), width: imageSquaredSize, height: imageSquaredSize)
            
            if image != nil {
                notificationView?.addSubview(imageView!)
            }
            
            // Title
            
            titleLabel!.frame = CGRect(x: paddingBetweenElements + imageSquaredSize + paddingBetweenElements, y: 20 + paddingBetweenElements, width: CGFloat(textWidth), height: CGFloat(titleHeight))
            
            if titleText != nil {
                notificationView?.addSubview(titleLabel!)
            }
            
            //Sub Title
            
            subTitileLabel!.frame = CGRect(x: paddingBetweenElements + imageSquaredSize + paddingBetweenElements, y: titleLabel!.frame.origin.y + titleLabel!.frame.size.height + 3 , width: CGFloat(textWidth), height: CGFloat(subtitleHeight))
            //subTitileLabel?.numberOfLines = 99
            if subtitleText != nil {
                notificationView?.addSubview(subTitileLabel!)
            }
            
            //Top Button
            
            if buttonVerticalAligment == .Top {
                topButton!.frame = CGRect(x: titleLabel!.frame.origin.x + titleLabel!.frame.size.width + paddingBetweenElements, y: 20 + (paddingBetweenElements / 2), width:  buttonWidth, height: buttonHeight)
            }else{
                topButton!.frame = CGRect(x: titleLabel!.frame.origin.x + titleLabel!.frame.size.width + paddingBetweenElements, y: notificationView!.frame.size.height - (paddingBetweenElements * 2 ) - ( buttonHeight * 2) , width: buttonWidth, height: buttonHeight)
            }
            
            
            topButton?.addTarget(self, action: #selector(self.topButtonTapped), for: .touchUpInside)
            
            
            if topButtonText != nil {
                notificationView?.addSubview(topButton!)
            }
            
            //Bottom Button
            
            bottomButton!.frame = CGRect(x: titleLabel!.frame.origin.x + titleLabel!.frame.size.width + paddingBetweenElements, y: topButton!.frame.origin.y + topButton!.frame.size.height + paddingBetweenElements, width: buttonWidth , height: buttonHeight)
            
            bottomButton?.addTarget(self, action: #selector(self.bottomButtonTapped), for: .touchUpInside)
            
            
            if bottomButtonText != nil {
                notificationView?.addSubview(bottomButton!)
            }
            
            
            if dismissOnTap == true {
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
                tap.numberOfTapsRequired = 1
                notificationView?.addGestureRecognizer(tap)
            }
            
            if animation == true {
                
                animator = UIDynamicAnimator(referenceView: view)
                let gravity = UIGravityBehavior(items: [notificationView!])
                animator?.addBehavior(gravity)
                
                let collision = UICollisionBehavior(items: [notificationView!])
                collision.translatesReferenceBoundsIntoBoundary = false
                collision.addBoundary(withIdentifier: "notificationEnd" as NSCopying, from: CGPoint(x: 0,y: notificationHeight), to: CGPoint(x: screenSize!.width, y: notificationHeight))
                animator?.addBehavior(collision)
                
                let elasticBehavior = UIDynamicItemBehavior(items: [notificationView!])
                elasticBehavior.elasticity = 0.3
                animator?.addBehavior(elasticBehavior)
                
                
            }else{
                
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                    self.notificationView!.frame = CGRect(x: 0, y: 0, width:  self.screenSize!.width , height: notificationHeight)
                    }, completion: nil)
                
                
                
            }
            
            isBeingShown = true
            gravityAnimation = animation
            
            
            
            
        } // end if shown
        
        
        
        
    } //end present in view
    
    
    
    
    // MARK: -  Delegate Methods
    
    @objc private func topButtonTapped(){
        if delegate != nil {
            self.delegate?.dropdownNotificationTopButtonTapped()
        }
    }
    
    @objc private func bottomButtonTapped(){
        if delegate != nil {
            self.delegate?.dropdownNotificationBottomButtonTapped()
        }
    }
    
    // MARK: - Dismiss Methods
    
    @objc private func dismiss(){
        self.delegate?.dropdownNotificationDismissedWithTap()
        self.dismissWithGravityAnimation(animation: gravityAnimation!)
    }
    
    public func dismissWithGravityAnimation (animation:Bool) {
        
        if animation == true {
            let gravity = UIGravityBehavior(items: [notificationView!])
            gravity.gravityDirection = CGVector(dx: 0, dy: -1.5)
            animator?.addBehavior(gravity)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.animator?.removeAllBehaviors()
                self.removeSubviews()
                self.notificationView?.removeFromSuperview()
                self.isBeingShown = false
            }
        }else{
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                self.notificationView?.frame = CGRect(x: 0, y: self.notificationView!.frame.size.height , width: self.screenSize!.width, height: self.notificationView!.frame.size.height)
                
                }, completion: { (finished) in
                    
                    self.removeSubviews()
                    self.notificationView!.removeFromSuperview()
                    self.isBeingShown = false
            })
        }
    }
    
    func removeSubviews(){
        for subview in notificationView!.subviews {
            subview.removeFromSuperview()
        }
    }
    
    
    
}
