//
//  SettingsController.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2023/01/17.
//

import UIKit

private let reuseIdentifier = "SettingsCell"

class SettingsController: UITableViewController {
    
    // MARK: - Properties
            
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        configureNavigationBar(withTitle: "Settings", prefersLargeTitles: true)
    }
    
    // MARK: - Selectors
    
    @objc func handleDone() {
        
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationItem.title = "Edit Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self,
                                                            action: #selector(handleDone))
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        tableView.rowHeight = 64
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemGroupedBackground
    }
}

// MARK: - UITableViewDataSource

extension SettingsController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSections.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingsSections(rawValue: section) else { return 0 }
        switch section {
        case .general: return GeneralSettings.allCases.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        
        guard let section = SettingsSections(rawValue: indexPath.section) else { return cell }
        
        switch section {
        case .general:
            cell.option = GeneralSettings(rawValue: indexPath.row)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SettingsController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = AccountDetailsSections(rawValue: section) else { return nil }
        return section.description
    }
}
