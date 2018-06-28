//
//  XYRootNaView.swift
//  XYDYSwift
//
//  Created by zhaofan on 2018/6/28.
//  Copyright © 2018年 zhaofan. All rights reserved.
//

import UIKit
import SnapKit

class XYRootNaView: UIView {

    var backBtn  : UIButton?
    var titleLab : UILabel?
    
    class func rootNaView(title:String) -> XYRootNaView {
        let rect =  CGRect(x: 0, y: 0, width: XYUI.Screen.Width, height: XYUI.Screen.NavH)
        let rootNaView = XYRootNaView(defaultFrame: rect)
        rootNaView.titleLab?.text = title
        return rootNaView
    }
    
    
    init(defaultFrame: CGRect) {
         super.init(frame: defaultFrame)
        
        setUpSubViews(size: defaultFrame.size)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpSubViews(size: CGSize) {
        
        let bjImageView = UIImageView()
        bjImageView.backgroundColor = XYUI.Color.black
        self.addSubview(bjImageView)
        bjImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.size.equalToSuperview()
        }
        
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(R.image.back_f2()!, for: .normal)
        self.addSubview(backBtn)
        
        backBtn.snp.makeConstraints { (make) in
            make.top.equalTo(XYUI.Screen.StatusbarH+8)
            make.left.equalTo(8)
            make.height.equalTo(32)
            make.width.equalTo(32)
        }
        
        titleLab = UILabel()
        titleLab?.textColor = XYUI.Color.white
        titleLab?.textAlignment = .center
        titleLab?.font = UIFont.systemFont(ofSize: XYUI.Font.fitFont(size: 17.0))
        self.addSubview(titleLab!)
        
        titleLab?.snp.makeConstraints { (make) in
            make.top.equalTo(XYUI.Screen.StatusbarH+8)
            make.left.equalTo(88)
            make.right.equalTo(-88)
            make.height.equalTo(32)
        }

    }

}
