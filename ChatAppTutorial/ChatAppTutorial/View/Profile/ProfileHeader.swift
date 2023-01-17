//
//  ProfileHeader.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2023/01/16.
//

import UIKit

protocol ProfileHeaderDelegate: AnyObject {
    func dismissController()
}

class ProfileHeader: UIView {
    
    // MARK: - Properties
    var user: User? {
        didSet {
            populateUserData()
        }
    }
    
    weak var delegate: ProfileHeaderDelegate?
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(handleDissmissal), for: .touchUpInside)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.heightAnchor.constraint(equalToConstant: 22).isActive = true
        button.imageView?.widthAnchor.constraint(equalToConstant: 22).isActive = true
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 4.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGradientLayer()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc func handleDissmissal() {
        delegate?.dismissController()
    }
    
    // MARK: - Helpers
    func populateUserData() {
        guard let user = user else { return }
        guard let url = URL(string: user.profileImageUrl) else { return }
        
        fullnameLabel.text = user.fullname
        usernameLabel.text = "@" + user.username
        profileImageView.sd_setImage(with: url)
                
    }
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPink.cgColor, UIColor.systemYellow.cgColor]
        gradient.locations = [0, 1]
        layer.addSublayer(gradient)
        gradient.frame = self.frame
    }
    
    func configureLayout() {
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(96)
            $0.width.height.equalTo(200)
            $0.centerX.equalTo(snp.centerX)
        }
        profileImageView.layer.cornerRadius = 200 / 2

        let stackView = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.top.equalTo(profileImageView.snp.bottom).offset(16)
        }
       
        addSubview(dismissButton)
        dismissButton.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(44)
            $0.left.equalTo(snp.left).offset(44)
            $0.width.height.equalTo(48)
        }
    }
    
    
    
    
}
