//
//  XYRootNavigationVC.swift
//  XYDYSwift
//
//  Created by zhaofan on 2018/6/27.
//  Copyright © 2018年 zhaofan. All rights reserved.
//

import UIKit

class XYRootNavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

       self.interactivePopGestureRecognizer?.delegate = self;
    }

}


extension XYRootNavigationVC: UIGestureRecognizerDelegate {
    
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.viewControllers.count <= 1 {
            return false
        }
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return gestureRecognizer.isKind(of: UIScreenEdgePanGestureRecognizer.self)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
