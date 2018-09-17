//
//  UIView+Extension.swift
//  ios-rxswift-practice-hot
//
//  Created  on 2018/09/17.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import UIKit


enum FadeType: TimeInterval {
    case
    fast = 0.1,
    normal = 0.2,
    slow = 0.5
}
extension UIView {
    
    func fadeIn(type: FadeType = .normal, completed: (() -> ())? = nil) {
        fadeIn(duration: type.rawValue, completed: completed)
    }
    
    func fadeIn(duration: TimeInterval = FadeType.normal.rawValue, completed: (() -> ())? = nil) {
        alpha = 0
        isHidden = false
        UIView.animate(withDuration: duration,
                                   animations: {
                                    self.alpha = 1
        }) { finished in
            completed?()
        }
    }
    
    func fadeOut(type: FadeType = .normal, completed: (() -> ())? = nil) {
        fadeOut(duration: type.rawValue, completed: completed)
    }
    
    func fadeOut(duration: TimeInterval = FadeType.normal.rawValue, completed: (() -> ())? = nil) {
        UIView.animate(withDuration: duration
            , animations: {
                self.alpha = 0
        }) { [weak self] finished in
            self?.isHidden = true
            self?.alpha = 1
            completed?()
        }
    }
}
