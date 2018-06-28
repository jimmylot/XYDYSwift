//
//  XYTabBarView.swift
//  XYDYSwift
//
//  Created by zhaofan on 2018/6/28.
//  Copyright © 2018年 zhaofan. All rights reserved.
//

import UIKit


protocol XYTabBarDataSource: NSObjectProtocol {
    func tabBarViewForRows(_ tabBarView: XYTabBarView) -> [XYTabBar]
    
    func tabBarViewForMiddle(_ tabBarView: XYTabBarView, size: CGSize) -> UIView?
}

protocol XYTabBarDelegate: NSObjectProtocol {
    func tabBarView(_ tabBarView: XYTabBarView, didSelectRowAt index: Int)
}




class XYTabBarView: UIView {

    weak var dataSource: XYTabBarDataSource?
    weak var delegate: XYTabBarDelegate?
    
    var superView : UIView?
    var topLine   : UIView?
    
    var selectIndex: Int = 0//从1开始
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
        reloadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setUpUI()
        reloadUI()
    }
    
    
    func setUpUI() {
        self.backgroundColor = UIColor.clear
    }
    
    func reloadUI() {
        
        superView?.removeFromSuperview()
        superView = UIView(frame: self.bounds)
        superView?.backgroundColor = UIColor.clear
        
        updateUI()
    }
    
    func updateUI() {
        
        let SelfWidth = self.frame.size.width
        let SelfHeight = self.frame.size.height
        
        if let dataS = dataSource {
            let dataArray = dataS.tabBarViewForRows(self)
            
            var width  = SelfWidth / CGFloat(dataArray.count + 1)
            let height = SelfHeight
            
            let middleView = dataS.tabBarViewForMiddle(self, size: CGSize(width: width, height: height))
            
            var middleIndex = Int(dataArray.count) / 2
            if middleView == nil {
                width = SelfWidth / CGFloat(dataArray.count)
                middleIndex = 0
            }
            
            topLine = UIView(frame: CGRect(x: 0, y: 0, width: SelfWidth, height: 0.6))
            topLine?.backgroundColor = UIColor.hexString(color: "#f2f2f2")
            superView?.addSubview(topLine!)
            
            var xIndex = 0
            for (index, value) in dataArray.enumerated(){
                xIndex = index
                if xIndex >= middleIndex && middleIndex != 0 {
                    xIndex += 1
                }
                
                if index == middleIndex && middleIndex != 0 {
                    let view = UIView(frame: CGRect(x: CGFloat(middleIndex) * width, y: 0, width: width, height: height))
                    view.backgroundColor = UIColor.clear
                    view.addSubview(middleView!)
                    superView?.addSubview(view)
                }
                
                let btn = UIButton(type: UIButtonType.custom)
                btn.frame = CGRect(x: CGFloat(xIndex) * width, y: 0, width: width, height: height)
                btn.backgroundColor = UIColor.clear
                
                let normalTitle = NSMutableAttributedString(string: value.title, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.gray])
                btn.setAttributedTitle(normalTitle, for: UIControlState.normal)
                
                let selectTitle = NSMutableAttributedString(string: value.title, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: UIColor.white])
                btn.setAttributedTitle(selectTitle, for: UIControlState.selected)
                
                btn.addTarget(self, action: #selector(self.selectAction(sender:)),for: .touchUpInside)
                btn.isSelected = false
                btn.tag = index + 1
                
                var textRect = CGRect()
                let textSize = CGSize(width: 0, height: 2)
                textRect = value.title.boundingRect(with: textSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16)], context: nil)
                
                let lineView = LineView.lineView(textW: textRect.size.width, index: xIndex, supSize: CGSize(width: width, height: height))
                lineView.tag  = index + 1 + 100
                
                superView?.addSubview(btn)
                superView?.addSubview(lineView)
            }
        }
        self.addSubview(superView!)
    }
    
    
    func selectTabBar(index: Int) {
        if index == selectIndex {
            return
        }
        if let btn: UIButton = superView?.viewWithTag(index) as? UIButton {
            if let btn: UIButton = superView?.viewWithTag(selectIndex) as? UIButton {
                btn.isSelected = false
            }
            btn.isSelected = true
            
            updateBottomView(index: index)
            
            selectIndex = index
        }
    }
    
    
    func updateBottomView(index: Int) {
        
        for view in (superView?.subviews)! {
            if view is LineView {
                if view.tag - 100 == index {
                    view.isHidden = false
                }else{
                    view.isHidden = true
                }
            }
        }
    }
    
    
    //MARK: Action
    
    @objc func selectAction(sender: UIButton) {
        if let del = self.delegate {
            del.tabBarView(self, didSelectRowAt: (sender.tag - 1))
            selectTabBar(index: sender.tag)
        }
    }
}

class LineView: UIView {
    
    class func lineView(textW: CGFloat, index: Int, supSize: CGSize) -> LineView {
        
        let lineView = LineView(frame: CGRect(x: CGFloat(index) * supSize.width + (supSize.width - textW) / 2, y: supSize.height - 4, width: textW, height: 2))
        lineView.backgroundColor = UIColor.white
        return lineView
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

