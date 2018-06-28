//
//  XYRootTabBarVC.swift
//  XYDYSwift
//
//  Created by zhaofan on 2018/6/28.
//  Copyright © 2018年 zhaofan. All rights reserved.
//

import UIKit



class XYRootTabBarVC: XYTabBarController {

    var dataArray: [XYTabBar] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setChaildVC()
        setTabBarViewColor()
        
    }
    
    
    func setChaildVC() {
        let Home            = R.storyboard.main.xyHomeVC()!
        let Attention       = R.storyboard.main.xyAttentionVC()!
        let News            = R.storyboard.main.xyNewsVC()!
        let Mine            = R.storyboard.main.xyMineVC()!
        
        let tabBarHome = XYTabBar.init(vc: Home, title: "首页", icon: "", selectIcon: "")
        let tabBarAtt  = XYTabBar.init(vc: Attention, title: "关注", icon: "", selectIcon: "")
        let tabBarNews = XYTabBar.init(vc: News, title: "消息", icon: "", selectIcon: "")
        let tabBarMine = XYTabBar.init(vc: Mine, title: "我", icon: "", selectIcon: "")
        dataArray = [tabBarHome, tabBarAtt, tabBarNews, tabBarMine]
        
        for value in dataArray {
            addChildWith(tabBar: value)
        }
        
        tabBarView?.reloadUI()
        selectIndexView(index: 1)
    }
    
    func setTabBarViewColor() {
        var bScrollEnabled = true
        if self.selectedIndex == 0 {
            tabBarView?.backgroundColor = UIColor.clear
            tabBarView?.topLine?.isHidden = false
        }
        else {
            bScrollEnabled = false
            tabBarView?.topLine?.isHidden = true
            tabBarView?.backgroundColor = UIColor.black
        }
        if self.navigationController?.viewControllers.first is XYRootScrollViewController {
            let vc = self.navigationController?.viewControllers.first as! XYRootScrollViewController
            vc.mainScrollView.isScrollEnabled = bScrollEnabled
        }
    }
    
    @objc func goAddViewAction(sender: UIButton) {
        print("+++++++++++++++++++++++++++++++")
    }
    
    override func tabBarViewForRows(_ tabBarView: XYTabBarView) -> [XYTabBar] {
        return dataArray
    }
    
    override func tabBarViewForMiddle(_ tabBarView: XYTabBarView, size: CGSize) -> UIView? {
        let wd = 15 as CGFloat
        let hd = 10 as CGFloat
        let w = CGFloat(size.width) - wd * CGFloat(2)
        let h = CGFloat(size.height) - hd * CGFloat(2)
        let middleBtn = UIButton(frame: CGRect(x: wd, y: hd, width: w, height:h))
        middleBtn.setTitle("+", for: .normal)
        middleBtn.setTitleColor(UIColor.black, for: .normal)
        middleBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        middleBtn.backgroundColor = UIColor.white
        middleBtn.layer.cornerRadius = 3
        middleBtn.addTarget(self, action: #selector(self.goAddViewAction(sender:)), for: .touchUpInside)
        
        return middleBtn
    }
    
    override func tabBarView(_ tabBarView: XYTabBarView, didSelectRowAt index: Int) {
        if self.selectedIndex == index {
//            let vc = self.childViewControllers[selectedIndex]
            switch selectedIndex {
            case 0: do {
                print("初始化 首页")
//                let v: XYHomeVC = vc as! XYHomeVC
//                v.mainCV.reloadData()
//                v.mainCV.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
            }
                break
            case 1:
                break
            case 2:
                break
            case 3:
                break
            default:
                break
            }
        }else {
            self.selectedIndex = index
            setTabBarViewColor()
        }
    }
    
}







