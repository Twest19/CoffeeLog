//
//  SchemeType.swift
//  CoffeeLog
//
//  Created by Tim West on 9/17/23.
//

import Foundation

enum SchemeType: Int, Identifiable, CaseIterable {
    var id: Self { self }
    case system
    case light
    case dark
}

extension SchemeType {
    var description: String {
        switch self {
        case .system:
            return "System"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
}
