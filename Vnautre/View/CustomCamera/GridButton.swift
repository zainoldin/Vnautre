//
//  GridButton.swift
//  BlackCamera
//
//  Created by Almas on 01.08.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import Foundation
import Cartography
import UIKit

class GridButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.tag = 0
        self.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        self.backgroundColor = .clear
        self.addTarget(self, action: #selector(changeTag(_ :)), for: .touchUpInside)
    }
    
    @objc private func changeTag(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.tag = 1
        default:
            self.tag = 0
        }
    }
    
}
