//
//  ContainerView.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2022/12/16.
//

import UIKit

class InputContainerView: UIView {
        
    init(image: UIImage?, textField: UITextField) {
        super.init(frame: .zero)
        
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .white
        imageView.alpha = 0.87
        
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.left.equalTo(snp.left).offset(8)
            $0.height.width.equalTo(24)
            $0.centerY.equalTo(snp.centerY)
        }
        
        addSubview(textField)
        textField.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.left.equalTo(imageView.snp.right).offset(8)
        }
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white.withAlphaComponent(0.75)
        addSubview(dividerView)
        dividerView.snp.makeConstraints {
            $0.left.equalTo(snp.left).offset(8)
            $0.right.equalTo(snp.right).offset(-8)
            $0.bottom.equalTo(snp.bottom)
            $0.height.equalTo(0.75)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
