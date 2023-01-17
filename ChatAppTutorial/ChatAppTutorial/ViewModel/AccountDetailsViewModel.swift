//
//  AccountDetailsViewModel.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2023/01/17.
//

import Foundation

protocol ProfileOptionViewModelProtocol {
    var description: String { get }
    var iconImageName: String { get }
    var optionId: Int { get }
    var sectionId: Int { get }
}

struct AccountDetailsViewModel {
    private let user: User
    let option: ProfileOptionViewModelProtocol
    
    var textFieldValue: String? {
        guard let section = AccountDetailsSections(rawValue: option.sectionId) else { return nil }
        
        switch section {
        case .personal:
            guard let option = PersonalDetails(rawValue: self.option.optionId) else { return nil }
            
            switch option {
            case .fullname: return user.fullname
            case .username: return user.username
            }
            
        case .privateDetails:
            guard let option = PrivateDetails(rawValue: self.option.optionId) else { return nil }
            
            switch option {
            case .email: return user.email
            }
        }
    }
    
    init(user: User, option: ProfileOptionViewModelProtocol) {
        self.user = user
        self.option = option
    }
}

enum AccountDetailsSections: Int, CaseIterable {
    case personal
    case privateDetails
    
    var description: String {
        switch self {
        case .personal: return "Public Profile"
        case .privateDetails: return "Private Details"
        }
    }
}

enum PersonalDetails: Int, ProfileOptionViewModelProtocol, CaseIterable {
    case fullname
    case username
    
    var description: String {
        switch self {
        case .fullname: return "Full Name"
        case .username: return "Username"
        }
    }
    
    var iconImageName: String {
        return "person.circle"
    }
    
    var optionId: Int {return self.rawValue }
    var sectionId: Int { return AccountDetailsSections.personal.rawValue }
}


enum PrivateDetails: Int, ProfileOptionViewModelProtocol, CaseIterable {
    case email
    
    var description: String {
        switch self {
        case .email: return "Email"
        }
    }
    
    var iconImageName: String {
        return "envelope.fill"
    }
    
    var optionId: Int { return self.rawValue }
    var sectionId: Int { return AccountDetailsSections.privateDetails.rawValue  }
}
