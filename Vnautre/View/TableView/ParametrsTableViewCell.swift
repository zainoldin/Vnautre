//
//  ParametrsTableViewCell.swift
//  BlackCamera
//
//  Created by Almas on 01.08.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import UIKit
import Cartography

class ParametrsTableViewCell: UITableViewCell {

    
    lazy var titleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.font = UIFont.setAvenir(ofSize: 15)
        title.textColor = .lightGray
        return title
    }()
    
    lazy var saveSwitch: UISwitch = {
        let save  = UISwitch(frame: .zero)
        save.setOn(false, animated: true)
        save.tintColor  = .white
        save.onTintColor = .sun
        return save
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
        self.contentView.addSubview(saveSwitch)
    }
    
    private func setupConstraints() {
        constrain(titleLabel, saveSwitch, contentView) { tl, ss, cv in
            
            tl.left == cv.left + 20
            tl.centerY == cv.centerY
            
            ss.right == cv.right - 20
            ss.centerY == cv.centerY
        }
    }
    
}
