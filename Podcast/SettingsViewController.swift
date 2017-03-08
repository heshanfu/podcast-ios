//
//  SettingsViewController.swift
//  Podcast
//
//  Created by Drew Dunne on 3/8/17.
//  Copyright © 2017 Cornell App Development. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    
    let sectionsAndItems = [
        ["Push Notifications", "Hopefully some other things"],
    ]
    let reusableCellID = "settingsCell"
    let sectionSpacing: CGFloat = 18

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Settings"
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), style: .grouped)
        tableView.showsVerticalScrollIndicator = true
        tableView.allowsSelection = false
        tableView.backgroundColor = .podcastWhiteDark
        tableView.contentInset = UIEdgeInsetsMake(0, 0, appDelegate.tabBarController.tabBarHeight, 0)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: reusableCellID)
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    // MARK: UITableViewDelegate & UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsAndItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsAndItems[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SettingsTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCellID, for: indexPath) as? SettingsTableViewCell ?? SettingsTableViewCell()
        cell.setTitle(sectionsAndItems[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionSpacing
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Can't happen but incase we nee it
        print("Selected \(sectionsAndItems[indexPath.section][indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
