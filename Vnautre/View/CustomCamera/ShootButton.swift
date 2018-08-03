//
//  ShootButton.swift
//  BlackCamera
//
//  Created by Almas on 31.07.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import Foundation
import UIKit

class ShootButton: UIButton, ShootButtonDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.sun.cgColor
        self.layer.borderWidth = 7.0
        self.backgroundColor = .clear
        self.addTarget(self, action: #selector(didPressed), for: .touchDragInside)
        self.addTarget(self, action: #selector(didUnPressed), for: .touchDragOutside)
    }
    
    @objc internal func didPressed() {
        self.backgroundColor = .sun
        UIView.animate(withDuration: 0.5) {
            self.backgroundColor = .clear
        }
    }
    
    @objc internal func didUnPressed() {
        self.backgroundColor = .clear
    }
    
}
