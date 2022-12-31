//
//  UserCell.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2022/12/31.
//

import UIKit

class UserCell: UITableViewCell {
    
    // MARK: - Properties
    var user: User? {
        didSet {
            configure()
        }
    }
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPurple
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    func configureLayout() {
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        profileImageView.layer.cornerRadius = 32
        
        let stackView = UIStackView(arrangedSubviews: [usernameLabel, fullnameLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12).isActive = true
    }
    
    func configure() {
        guard let user = user else { return }
        guard let url = URL(string: user.profileImageUrl) else { return }
        profileImageView.sd_setImage(with: url)
        fullnameLabel.text = user.fullname
        usernameLabel.text = user.username
    }
    
    
    
}
