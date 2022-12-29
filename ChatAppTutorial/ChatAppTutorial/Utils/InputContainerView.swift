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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8).isActive = true
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white.withAlphaComponent(0.75)
        addSubview(dividerView)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        dividerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        dividerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dividerView.heightAnchor.constraint(equalToConstant: 0.75).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
