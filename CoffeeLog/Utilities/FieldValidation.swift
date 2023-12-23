//
//  FieldValidation.swift
//  CoffeeLog
//
//  Created by Tim West on 12/22/23.
//

import Foundation


class FieldValidation {
    
    // Check name, likely going to only accept first names
    static func validateName(_ name: String) -> ValidationError? {
        guard name.isNonEmptyTrimmed else { return .nameRequired }
        
        guard name.count <= 50 else { return .nameTooLong }
        
        return nil
    }
    
    // Check email
    static func validateEmail(_ email: String) -> ValidationError? {
        guard email.isNonEmptyTrimmed else { return .emailRequired }
        
        guard email.isValidEmail else { return .invalidEmail }
        
        return nil
    }
    
    // Check Password
    static func validatePassword(_ password: String) -> ValidationError? {
        guard password.isNonEmptyTrimmed else { return .passwordRequired }
        
        guard password.isPasswordLength else { return .invalidPasswordLength }
        
        return nil
    }
    
    
    static func matchingPasswords(matchOne: String, matchTwo: String) -> ValidationError? {
        guard matchOne == matchTwo else { return .passwordsDoNotMatch }
        
        return nil
    }
}
