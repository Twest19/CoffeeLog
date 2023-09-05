//
//  PasswordStrength.swift
//  CoffeeLog
//
//  Created by Tim West on 9/5/23.
//

import SwiftUI

enum PasswordStrength: Double {
    case bad = 0.2
    case ok = 0.5
    case good = 0.75
    case strong = 1.0
    
    var textAndColor: (String, Color) {
        switch self {
        case .bad, .ok:
            return ("Bad", Color.red)
        case .good:
            return ("Good", Color.yellow)
        case .strong:
            return ("Strong", Color.green)
        }
    }
}
