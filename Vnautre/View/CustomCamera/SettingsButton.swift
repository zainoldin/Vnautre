//
//  SettingsButton.swift
//  BlackCamera
//
//  Created by Almas on 01.08.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import Foundation
import UIKit

class SettingsButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.setImage(#imageLiteral(resourceName: "settingslogo"), for: .normal)
        self.backgroundColor = .clear
    }
}
