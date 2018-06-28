//
//  XYUI.swift
//  XYDYSwift
//
//  Created by zhaofan on 2018/6/28.
//  Copyright © 2018年 zhaofan. All rights reserved.
//

import UIKit

struct XYUI {
    
    
    struct Screen {
        
        static let  Width        : CGFloat       = UIScreen.main.bounds.width
        static let  Height       : CGFloat       = UIScreen.main.bounds.size.height
        static let  NavH         : CGFloat       = XYUI.Screen.IphoneX == true ?  88 : 64
        static let  StatusbarH   : CGFloat       = XYUI.Screen.IphoneX == true ?  44 : 20
        
        
        static let IphoneX: Bool =  XYUI.Screen.Width == 375.0 && XYUI.Screen.Height == 812.0
        
    }
    
    
    // 颜色
    struct Color {
        
        /// 主色调
        static let primary       =   UIColor.hexString(color: "#FFCA07")
        static let black         =   UIColor.hexString(color: "#333333")
        static let white         =   UIColor.white
    }
    
    
    
    
    struct Font {
        
        static func fitFont(size:CGFloat) -> CGFloat {
            
            if UIScreen.main.bounds.size.width == 320 {
                return size * 0.8
            }
            return size
        }
        
        static let f10 = UIFont.systemFont(ofSize: 10)
        static let f11 = UIFont.systemFont(ofSize: 11)
        static let f12 = UIFont.systemFont(ofSize: 12)
        static let f13 = UIFont.systemFont(ofSize: 13)
        static let f14 = UIFont.systemFont(ofSize: 14)
        static let f15 = UIFont.systemFont(ofSize: 15)
        static let f16 = UIFont.systemFont(ofSize: 16)
        static let f17 = UIFont.systemFont(ofSize: 17)
        static let f18 = UIFont.systemFont(ofSize: 18)
        
        static let f20 = UIFont.systemFont(ofSize: 20)
    }
    
    
}
