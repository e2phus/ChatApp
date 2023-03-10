//
//  ConversationCell.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2023/01/04.
//

import UIKit

class ConversationCell: UITableViewCell {
    
    // MARK: - Properties
    var conversation: Conversation? {
        didSet {
            configure()
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let timestampLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.text = "2h"
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let messageTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func configure() {
        guard let conversation = conversation else { return }
        let viewModel = ConversationViewModel(conversation: conversation)
        
        usernameLabel.text = conversation.user.username
        messageTextLabel.text = conversation.message.text
        timestampLabel.text = viewModel.timestamp
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
    }
    
    func configureLayout() {
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.left.equalTo(snp.left).offset(12)
            $0.width.height.equalTo(50)
            $0.centerY.equalTo(snp.centerY)
        }
        profileImageView.layer.cornerRadius = 25
        
        let stackView = UIStackView(arrangedSubviews: [usernameLabel, messageTextLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView.snp.centerY)
            $0.left.equalTo(profileImageView.snp.right).offset(12)
            $0.right.equalTo(snp.right).offset(-16)
        }
        
        addSubview(timestampLabel)
        timestampLabel.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(20)
            $0.right.equalTo(snp.right).offset(-12)
        }
    }
}
