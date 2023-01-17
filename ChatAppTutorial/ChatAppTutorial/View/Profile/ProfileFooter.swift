//
//  ProfileFooter.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2023/01/16.
//

import UIKit

protocol ProfileFooterDelegate: AnyObject {
    func handleLogout()
}

class ProfileFooter: UIView {
    
    // MARK: - Properties
    weak var delegate: ProfileFooterDelegate?
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc func handleLogout() {
        delegate?.handleLogout()
    }
    
    // MARK: - Helpers
    func configureLayout() {
        addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        logoutButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
