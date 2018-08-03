//
//  FlashButton.swift
//  BlackCamera
//
//  Created by Almas on 30.07.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import Foundation
import Cartography
import UIKit

class FlashButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.tag = 0
        self.setImage(#imageLiteral(resourceName: "flashOn"), for: .normal)
        self.addTarget(self, action: #selector(changeMode(_:)), for: .touchUpInside)
        self.backgroundColor = .clear
        self.layer.masksToBounds = true
    }
    
    @objc private func changeMode(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.setImage(#imageLiteral(resourceName: "flashOff"), for: .normal)
            self.tag = 1
        default:
            self.setImage(#imageLiteral(resourceName: "flashOn"), for: .normal)
            self.tag = 0
        }
    }
    
}
