//
//  Errors.swift
//  CoffeeLog
//
//  Created by Tim West on 12/22/23.
//

import Foundation

enum ValidationError: String {
    case nameRequired = "Name is required."
    case nameTooLong = "Sorry, max of 50 characters."
    case emailRequired = "Email is required."
    case invalidEmail = "Invalid Email."
    case passwordRequired = "Password is required."
    case invalidPasswordLength = "Invalid Password length."
    case confirmPasswordRequired = "Confirm Password is required."
    case passwordsDoNotMatch = "Passwords do not match!"
}
