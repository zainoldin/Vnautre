//
//  ConfigurationViewController.swift
//  BlackCamera
//
//  Created by Almas on 03.08.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import UIKit
import Cartography

class ConfigurationViewController: UIViewController, Reusable {

    var configurationList: [String] = []
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.delegate = self
        table.dataSource = self
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: identifier)
        table.isScrollEnabled = false
        table.separatorStyle = .none
        table.backgroundColor = .clear
        return table
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
    }
    
    func setupViews() {
        self.view.addSubview(tableView)
        self.view.addSubview(closeButton)
    }
    
    func setupConstraints() {
        constrain(tableView, closeButton, view) { tv,cb, vw in
            constrain(tableView,closeButton, view) { tv,cb, vw in
                cb.width == 13
                cb.height == 25
                cb.left == vw.left + 20
                cb.top == vw.top + 20
                
                tv.left == vw.left + 1
                tv.right == vw.right - 1
                tv.top == vw.top + 80
                tv.height == 500
                
            }
        }
    }
    
    @objc func closeButtonPressed() {
        self.dismiss(animated: false, completion: nil)
    }
    
    
}

extension ConfigurationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configurationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingsTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        cell.titleLabel.text = configurationList[indexPath.row]
        cell.arrowImage.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
