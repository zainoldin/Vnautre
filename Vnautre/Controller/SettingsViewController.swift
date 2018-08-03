//
//  SettingsViewController.swift
//  BlackCamera
//
//  Created by Almas on 01.08.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import UIKit
import Cartography

class SettingsViewController: UIViewController, Reusable {
    
    let settingsList: [Settings] = Settings.list
    
    let tableViewSectionHeight: CGFloat = 30

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
        button.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        button.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        self.view.backgroundColor = UIColor.backgroundBlack
        self.view.addSubview(tableView)
        self.view.addSubview(closeButton)
    }
    
    func setupConstraints() {
        constrain(tableView,closeButton, view) { tv,cb, vw in
            cb.width == 35
            cb.height == 35
            cb.left == vw.left + 20
            cb.top == vw.top + 20
            
            tv.left == vw.left + 1
            tv.right == vw.right - 1
            tv.top == vw.top + 80
            tv.height == 500
            
        }
    }
    
    @objc func backToPrevious() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.total.rawValue
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewSectionHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: tableViewSectionHeight))
        view.backgroundColor = .clear
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: tableViewSectionHeight ))
        label.font = UIFont.setAvenir(ofSize: 14)
        label.textColor = UIColor.gray
        if let tableSection = Section(rawValue: section) {
            switch tableSection {
            case .settings:
                label.text = "Settings"
            case .parametrs:
                label.text = "Parametrs"
            default:
                label.text = "Support"
            }
        }
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settings = settingsList[indexPath.row]
        
        switch indexPath.section {
        case 0:
            let cell = SettingsTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            cell.selectionStyle = .default
            cell.titleLabel.text = settings.title
            cell.descriptionLabel.text = settings.description[0]
            return cell
        case 1:
            let cell = ParametrsTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            cell.titleLabel.text = "Save photos on gallery"
            return cell
        default:
            let cell = SettingsTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            cell.titleLabel.text = "Share"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0 :
            let vc = ConfigurationViewController()
            vc.configurationList = settingsList[indexPath.row].description
            self.present(vc, animated: false, completion: nil)
        default:
            print("")
        }
    }
}
