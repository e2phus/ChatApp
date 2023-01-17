//
//  AccountDetailsCell.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2023/01/17.
//

import UIKit

protocol AccountDetailsCellDelegate: AnyObject {
    func editProfileCell(_ cell: AccountDetailsCell, wantsToUpdateUserWith value: String)
}

class AccountDetailsCell: UITableViewCell {
    // MARK: - Properties
    var viewModel: AccountDetailsViewModel! {
        didSet {
            configure()
        }
    }
    
    weak var delegate: AccountDetailsCellDelegate?
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.addSubview(iconImage)
        iconImage.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        view.snp.makeConstraints {
            $0.height.width.equalTo(40)
        }
        view.layer.cornerRadius = 40 / 2
        view.backgroundColor = .systemPink
        return view
    }()
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints {
            $0.height.width.equalTo(28)
        }
        imageView.tintColor = .white
        return imageView
    }()
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.addTarget(self, action: #selector(updateUser), for: .editingDidEnd)
        return tf
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Actions
    @objc func updateUser(sender: UITextField) {
        guard let value = sender.text else { return }
        delegate?.editProfileCell(self, wantsToUpdateUserWith: value)
    }
    
    // MARK: - Helpers
    func configure() {
        titleLabel.text = viewModel?.option.description
        iconImage.image = UIImage(systemName: viewModel?.option.iconImageName ?? "")
        textField.text = viewModel?.textFieldValue
        
        if viewModel?.option.description == "Email" {
            iconImage.snp.makeConstraints {
                $0.height.width.equalTo(24)
            }
        }
    }

    func configureLayout() {
        let stackView = UIStackView(arrangedSubviews: [iconView, titleLabel])
        stackView.spacing = 8
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.left.equalTo(snp.left).offset(12)
        }
        
        addSubview(textField)
        textField.snp.makeConstraints {
            $0.right.equalTo(snp.right).offset(-12)
            $0.centerY.equalTo(snp.centerY)
        }
        
    }
}
