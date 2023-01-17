//
//  AccountDetailsController.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2023/01/17.
//

import UIKit

private let reuseIdentifier = "EditProfileCell"

class AccountDetailsController: UITableViewController {
    
    // MARK: - Properties
    
    private var user: User
        
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        configureNavigationBar(withTitle: "Edit Profile", prefersLargeTitles: true)
    }
    
    // MARK: - Selectors
    
    @objc func handleDone() {
        view.endEditing(true)
        
        self.showLoader(true, withText: "Saving your data")
        print("DEBUG: User fullname is \(user.fullname)")
        
        Service.updateUserData(user: user) { error in
            self.showLoader(false)
            self.dismiss(animated: true)
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationItem.title = "Edit Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self,
                                                            action: #selector(handleDone))
        
        tableView.register(AccountDetailsCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        tableView.rowHeight = 64
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemGroupedBackground
    }
    
}

// MARK: - UITableViewDataSource

extension AccountDetailsController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return AccountDetailsSections.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = AccountDetailsSections(rawValue: section) else { return 0 }
        switch section {
        case .personal: return PersonalDetails.allCases.count
        case .privateDetails: return PrivateDetails.allCases.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AccountDetailsCell
        cell.delegate = self
        
        guard let section = AccountDetailsSections(rawValue: indexPath.section) else { return cell }
        
        switch section {
        case .personal:
            guard let option = PersonalDetails(rawValue: indexPath.row) else { return cell }
            cell.viewModel = AccountDetailsViewModel(user: user, option: option)
        case .privateDetails:
            guard let option = PrivateDetails(rawValue: indexPath.row) else { return cell }
            cell.viewModel = AccountDetailsViewModel(user: user, option: option)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AccountDetailsController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = AccountDetailsSections(rawValue: section) else { return nil }
        return section.description
    }
}

// MARK: - EditProfileCellDelegate

extension AccountDetailsController: AccountDetailsCellDelegate {
    func editProfileCell(_ cell: AccountDetailsCell, wantsToUpdateUserWith value: String) {
        let sectionId = cell.viewModel.option.sectionId
        let optionId = cell.viewModel.option.optionId
        guard let section = AccountDetailsSections(rawValue: sectionId) else { return }
        
        switch section {
        case .personal:
            guard let option = PersonalDetails(rawValue: optionId) else { return }
            
            switch option {
            case .fullname: user.fullname = value
            case .username: user.username = value
            }
        case .privateDetails:
            guard let option = PrivateDetails(rawValue: optionId) else { return }
            
            switch option {
            case .email: user.email = value
            }
        }
    }
}
