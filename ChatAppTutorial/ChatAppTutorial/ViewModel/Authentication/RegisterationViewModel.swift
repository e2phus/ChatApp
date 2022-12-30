//
//  RegisterationViewModel.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2022/12/17.
//

import UIKit

struct RegisterationViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
            && fullname?.isEmpty == false
            && username?.isEmpty == false
    }
}
