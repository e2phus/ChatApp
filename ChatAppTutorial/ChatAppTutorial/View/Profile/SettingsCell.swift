//
//  SettingsCell.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2023/01/17.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    // MARK: - Properties
    var option: ProfileOptionViewModelProtocol! {
        didSet {
            configure()
        }
    }
    
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
            $0.height.width.equalTo(24)
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
    
    private let toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.onTintColor = .systemPink
        return toggle
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
    
    func configure() {
        titleLabel.text = option?.description
        iconImage.image = UIImage(systemName: option?.iconImageName ?? "")
    }
    
    func configureLayout() {
        let stackView = UIStackView(arrangedSubviews: [iconView, titleLabel])
        stackView.spacing = 8
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.left.equalTo(snp.left).offset(12)
        }
        
        addSubview(toggle)
        toggle.snp.makeConstraints {
            $0.right.equalTo(snp.right).offset(-12)
            $0.centerY.equalTo(snp.centerY)
        }
    }
}
