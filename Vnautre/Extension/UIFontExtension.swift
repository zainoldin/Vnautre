//
//  ExtensionUIFont.swift
//  Alippe
//
//  Created by Almas on 16.07.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static func setAvenir(ofSize size: CGFloat) -> UIFont{
        if let font = UIFont(name: "Avenir-Light", size: size){
            return font
        }
        return UIFont.systemFont(ofSize: size)
    }
}
