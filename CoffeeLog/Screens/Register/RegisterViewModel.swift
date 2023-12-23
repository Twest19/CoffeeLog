//
//  RegisterViewModel.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

@MainActor
final class RegisterViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var cPassword = ""
    
    @Published private(set) var matchingPasswords: Bool = false
    @Published private(set) var passwordStrength: Double = 0
    
    @Published private(set) var eightLength: Bool = false
    @Published private(set) var oneCapital: Bool = false
    @Published private(set) var oneNumb: Bool = false
    @Published private(set) var oneSpecial: Bool = false
    
    @Published private(set) var nameError: String?
    @Published private(set) var emailError: String?
    @Published private(set) var passwordError: String?
    @Published private(set) var cPasswordError: String?

    
    func testMatchingPasswords() { matchingPasswords = cPassword == password }
    
    func validateAndUpdateStrength(password: String) {
        var strengthCounter = 0.0
        
        oneSpecial = false; eightLength = false; oneCapital = false; oneNumb = false
        
        // Check for uppercase
        let hasUppercase = NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*")
        if hasUppercase.evaluate(with: password) {
            strengthCounter += 0.2
            oneCapital = true
        }
        
        // Check for numbers
        let hasNumbers = NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*")
        if hasNumbers.evaluate(with: password) {
            strengthCounter += 0.2
            oneNumb = true
        }
        
        // Check for special characters
        let hasSpecialCharacters = NSPredicate(format:"SELF MATCHES %@", ".*[!@#$%^&*()\\-_=+\\{\\}\\[\\]\\|:;'\"<>,.?/~]+.*")
        if hasSpecialCharacters.evaluate(with: password) {
            strengthCounter += 0.2
            oneSpecial = true
        }
        
        // Minimum length of 3 for any valid password
        if password.count < 3 {
            self.passwordStrength = 0
            return
        }
        
        // Length requirement: more weight given
        if password.count > 25 {
            eightLength = false
        } else if password.count >= 8 {
            strengthCounter += 0.4
            eightLength = true
        } else if password.count >= 6 {
            strengthCounter += 0.2
        }
        
        // Progress view only goes to 1.0, ensure it doesn't exceed that
        self.passwordStrength = min(strengthCounter, 1.0)
    }
    
    func validateName() {
        nameError = FieldValidation.validateName(name)?.rawValue
    }
    
    func validateEmail() {
        emailError = FieldValidation.validateEmail(email)?.rawValue
    }
    
    func validatePassword() {
        passwordError = FieldValidation.validatePassword(password)?.rawValue
    }
    
    func validateConfirmPassword() {
        cPasswordError = FieldValidation.validatePassword(cPassword)?.rawValue
    }
    
    // Only want to display pass do not match when other errors have cleared up
    // Also, only display under the confirm field
    func validatePasswordsMatch() {
        // Only set error if there are no other errors in the confirm password
        testMatchingPasswords()
        if cPasswordError == nil && !matchingPasswords {
            cPasswordError = ValidationError.passwordsDoNotMatch.rawValue
        }
    }

    func validateForm() -> Bool {
        // Call individual validation methods
        validateName()
        validateEmail()
        validatePassword()
        validateConfirmPassword()
        validatePasswordsMatch()
        
        // Check if any error messages are set
        let hasErrors = nameError?.isEmpty == false ||
                        emailError?.isEmpty == false ||
                        passwordError?.isEmpty == false ||
                        cPasswordError?.isEmpty == false

        return !hasErrors
    }
}
