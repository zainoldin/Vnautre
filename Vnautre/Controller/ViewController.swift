//
//  ViewController.swift
//  BlackCamera
//
//  Created by Almas on 30.07.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import UIKit
import Cartography
import CameraManager
import Hero

class ViewController: UIViewController {

    lazy var cameraManager: CameraManager = {
        let camera = CameraManager()
        camera.addPreviewLayerToView(self.cameraView)
        return camera
    }()
    
    lazy var cameraView: CameraView = {
        let camera = CameraView(frame: .zero)
        camera.shootButton.addTarget(self, action: #selector(takePicture), for: .touchUpInside)
        camera.flashButton.addTarget(self, action: #selector(switchFlash(_ :)), for: .touchUpInside)
        camera.swapButton.addTarget(self, action: #selector(swapCamera(_:)), for: .touchUpInside)
        camera.settingsButton.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        return camera
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraManager.addPreviewLayerToView(self.cameraView.view)
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        self.view.addSubview(cameraView)
    }
    
    func setupConstraints() {
        
        constrain(cameraView, view) { cv,vw in
            cv.edges == vw.edges
            
        }
    }

    @objc func takePicture() {
        cameraManager.capturePictureWithCompletion({ (image, error) -> Void in
            
        })
    }
    
    @objc func switchFlash(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            cameraManager.flashMode = .on
        default:
            cameraManager.flashMode = .off
        }
    }
    
    @objc func swapCamera(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            cameraManager.cameraDevice = .front
        default:
            cameraManager.cameraDevice = .back
        }
    }
    
    @objc func openSettings() {
//        self.navigationController?.present(SettingsViewController(), animated: true, completion: nil)
        self.hero.replaceViewController(with: SettingsViewController())
    }

}

