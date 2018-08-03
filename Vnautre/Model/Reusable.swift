//
//  Reusable.swift
//  Alippe
//
//  Created by Almas on 12.07.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import Foundation

protocol Reusable {
    
    var identifier: String { get }
}

extension Reusable {
    
    var identifier: String {
        return String(describing: self)
    }
}
