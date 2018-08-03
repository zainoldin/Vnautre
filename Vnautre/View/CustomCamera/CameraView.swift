//
//  CameraView.swift
//  BlackCamera
//
//  Created by Almas on 30.07.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import Foundation
import UIKit
import Cartography

class CameraView: UIView {
    
    lazy var shootButton = ShootButton(frame: .zero)
    
    lazy var view = UIView(frame: .zero)
    
    lazy var flashButton =  FlashButton(frame: .zero)
    
    lazy var swapButton = SwapButton(frame: .zero)
    
    lazy var gridButton = GridButton(frame: .zero)
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.backgroundBlack
        return view
    }()
    
    lazy var galleryButton = GalleryButton(frame: .zero)
    
    lazy var settingsButton = SettingsButton(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(view)
        self.addSubview(containerView)
        self.containerView.addSubview(shootButton)
        self.containerView.addSubview(flashButton)
        self.containerView.addSubview(swapButton)
        self.containerView.addSubview(gridButton)
        self.containerView.addSubview(galleryButton)
        self.containerView.addSubview(settingsButton)
    }
    
    func setupConstraints() {
        constrain(containerView, view , self) { cv, vw, sf in
            cv.bottom == sf.bottom
            cv.left == sf.left
            cv.right == sf.right
            cv.height == 230
            
            vw.top == sf.top
            vw.left == sf.left
            vw.right == sf.right
            vw.bottom == cv.top
        }
        
        constrain(flashButton, swapButton, shootButton, gridButton, containerView) { fb, swb, sb,gb, cv in
            sb.centerX == cv.centerX
            sb.bottom == cv.bottom - 30
            sb.width == 100
            sb.height == 100
            
            fb.left == cv.left + 20
            fb.top == cv.top + 20
            fb.width == 11
            fb.height == 22
            
            swb.centerX == cv.centerX
            swb.centerY == fb.centerY
            swb.width == 24
            swb.height == 20
            
            gb.right == cv.right - 20
            gb.centerY == swb.centerY
            gb.width == 20
            gb.height == 20
        }
        
        constrain(galleryButton, settingsButton, containerView, shootButton) { gb, stb , cv, sb in
            gb.right == cv.right - 20
            gb.centerY == sb.centerY
            gb.width == 35
            gb.height == 35
            
            stb.left == cv.left + 20
            stb.centerY == sb.centerY
            stb.width == 25
            stb.height == 25
        }
    }
    
    
    
    
}
