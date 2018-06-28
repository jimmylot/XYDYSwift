//
//  XYRootScrollViewController.swift
//  XYDYSwift
//
//  Created by zhaofan on 2018/6/27.
//  Copyright © 2018年 zhaofan. All rights reserved.
//

import UIKit

class XYRootScrollViewController: XYBaseVC {

    @IBOutlet weak var mainScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainScrollView.setContentOffset(CGPoint(x: XYUI.Screen.Width, y: 0), animated: false)
        
    }


}
