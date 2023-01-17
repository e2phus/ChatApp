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
        imageView.backgroundColor = .systemPink
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
    
    // MARK: - Helpers
    func configureLayout() {
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.left.equalTo(snp.left).offset(12)
            $0.width.height.equalTo(64)
        }
        profileImageView.layer.cornerRadius = 32
        
        let stackView = UIStackView(arrangedSubviews: [usernameLabel, fullnameLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView.snp.centerY)
            $0.left.equalTo(profileImageView.snp.right).offset(12)
        }
    }
    
    func configure() {
        guard let user = user else { return }
        guard let url = URL(string: user.profileImageUrl) else { return }
        
        profileImageView.sd_setImage(with: url)
        fullnameLabel.text = user.fullname
        usernameLabel.text = user.username
    }
    
    
    
}
