//
//  LoginViewModel.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2022/12/17.
//

import UIKit

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
    }
    
}
