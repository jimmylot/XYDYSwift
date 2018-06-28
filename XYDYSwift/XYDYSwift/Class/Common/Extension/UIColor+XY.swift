//
//  UIColor+XY.swift
//  XYDYSwift
//
//  Created by zhaofan on 2018/6/28.
//  Copyright © 2018年 zhaofan. All rights reserved.
//

import UIKit

extension UIColor {
    
    //获取16进制颜色
    static func hexString (color:String,alapha:CGFloat? = nil) -> UIColor {
        
        
        var cString:String = color.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            
            let index = cString.index(cString.startIndex, offsetBy: 1)
            cString = cString.suffix(from: index).lowercased()//substring(from: index)
            
        } else if cString.hasPrefix("0X") {
            
            let index = cString.index(cString.startIndex, offsetBy: 1)
            cString = cString.suffix(from: index).lowercased()//.substring(from: index)
        }
        
        if (cString.count != 6) {
            return UIColor.white
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        //         debugPrint("r,g,b",r,g,b)
        
        if alapha == nil {
            
            return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1)
        } else {
            return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alapha!)
        }
    }
    
}
