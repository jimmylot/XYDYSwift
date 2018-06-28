//
//  XYTabBarController.swift
//  XYDYSwift
//
//  Created by zhaofan on 2018/6/28.
//  Copyright © 2018年 zhaofan. All rights reserved.
//

import UIKit

public struct XYTabBar {
    var vc: UIViewController = UIViewController()
    var title: String = ""
    var icon: String = ""
    var selectIcon: String = ""
    
    static func Null() -> XYTabBar {
        return XYTabBar()
    }
}


class XYTabBarController: UITabBarController, XYTabBarDelegate, XYTabBarDataSource {

     var tabBarView: XYTabBarView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarView()
    }

    func setTabBarView() {
        let frame = self.tabBar.frame
        tabBarView = XYTabBarView(frame: frame)
        tabBarView?.dataSource = self
        tabBarView?.delegate = self
        self.view.addSubview(tabBarView!)
        
        self.tabBar.isHidden = true
    }
    
    func addChildWith(tabBar: XYTabBar) {
        self.addChildViewController(tabBar.vc)
    }
    
    func selectIndexView(index: Int) {
        self.selectedIndex = index - 1
        tabBarView?.selectTabBar(index: index)
    }

    func tabBarView(_ tabBarView: XYTabBarView, didSelectRowAt index: Int) {
        self.selectedIndex = index
    }
    
    func tabBarViewForRows(_ tabBarView: XYTabBarView) -> [XYTabBar] {
        return [XYTabBar()]
    }
    
    func tabBarViewForMiddle(_ tabBarView: XYTabBarView, size: CGSize) -> UIView? {
        return nil
    }
}



