//
//  XYBaseVC.swift
//  XYDYSwift
//
//  Created by zhaofan on 2018/6/27.
//  Copyright © 2018年 zhaofan. All rights reserved.
//

import UIKit

class XYBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false);
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    
    func setNaView() {
        let navView = XYRootNaView.rootNaView(title: "jimmy")
        self.view.addSubview(navView)
    }

}
