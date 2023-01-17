//
//  SettingsViewModel.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2023/01/17.
//

import Foundation

enum SettingsSections: Int, CaseIterable {
    case general
}

enum GeneralSettings: Int, CaseIterable, ProfileOptionViewModelProtocol {
    case notifications
    
    var description: String {
        switch self {
        case .notifications: return "Allow Push Notifications"
        }
    }
    
    var iconImageName: String {
        switch self {
        case .notifications: return "bell.fill"
        }
    }
    
    var optionId: Int { return self.rawValue }
    var sectionId: Int { return SettingsSections.general.rawValue }
}
