//
//  SettingsTableViewCell.swift
//  BlackCamera
//
//  Created by Almas on 01.08.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import UIKit
import Cartography

class SettingsTableViewCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.setAvenir(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.setAvenir(ofSize: 15)
        label.textColor = .sun
        return label
    }()
    
    lazy var arrowImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = #imageLiteral(resourceName: "arrow")
        return image
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.layer.borderColor = UIColor.backgroundBlack.cgColor
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.tableViewBlack
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(arrowImage)
    }
    
    private func setupConstraints() {
        constrain(titleLabel, descriptionLabel, arrowImage, contentView) { tl, dl, ai, cv in
            
            tl.left == cv.left + 20
            tl.centerY == cv.centerY
            
            dl.centerY == cv.centerY
            dl.left == cv.right - 100
            
            ai.centerY == cv.centerY
            ai.right == cv.right - 10
            ai.width == 5
            ai.height == 10
            
        }
    }

}
