//
//  ChatCell.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2022/12/31.
//

import UIKit

class ChatCell: UICollectionViewCell {
    
    // MARK: - Properties
    var message: Message? {
        didSet {
            configure()
        }
    }
    
    var bubbleLeftAnchor: NSLayoutConstraint!
    var bubbleRightAnchor: NSLayoutConstraint!
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPurple
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.textColor = .white
        textView.text = "Some test message for now..."
        return textView
    }()
    
    private let bubbleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPurple
        return view
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 4).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        profileImageView.layer.cornerRadius = 16
        
        addSubview(bubbleContainer)
        bubbleContainer.translatesAutoresizingMaskIntoConstraints = false
        bubbleContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bubbleContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        bubbleContainer.layer.cornerRadius = 12
        
        bubbleLeftAnchor = bubbleContainer.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12)
        bubbleLeftAnchor.isActive = false
        
        bubbleRightAnchor = bubbleContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        bubbleRightAnchor.isActive = false
        
        bubbleContainer.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: bubbleContainer.topAnchor, constant: 4).isActive = true
        textView.leadingAnchor.constraint(equalTo: bubbleContainer.leadingAnchor, constant: 12).isActive = true
        textView.bottomAnchor.constraint(equalTo: bubbleContainer.bottomAnchor, constant: -4).isActive = true
        textView.trailingAnchor.constraint(equalTo: bubbleContainer.trailingAnchor, constant: -12).isActive = true
    }
    
    func configure() {
        guard let message = message else { return }
        let viewModel = MessageViewModel(message: message)
        
        bubbleContainer.backgroundColor = viewModel.messageBackgroundColor
        textView.textColor = viewModel.messageTextColor
        textView.text = message.text
        
        bubbleLeftAnchor.isActive = viewModel.leftAnchorActive
        bubbleRightAnchor.isActive = viewModel.rightAnchorActive
        
        profileImageView.isHidden = viewModel.shouldHideProfileImage
    }

}
