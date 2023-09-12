//
//  RegisterViewModel.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI


final class RegisterViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    
    @Published var password = "" {
        didSet {
            validateAndUpdateStrength(password: password)
        }
    }
    
    @Published var cPassword = "" {
        didSet {
            validatePasswordsMatch()
        }
    }
    
    @Published var passwordsMatch: Bool = false
    @Published var passwordStrength: Double = 0
    
    @Published var eightLength: Bool = false
    @Published var oneCapital: Bool = false
    @Published var oneNumb: Bool = false
    @Published var oneSpecial: Bool = false
    
    @Published var nameErrorMessage: String?
    @Published var emailErrorMessage: String?
    @Published var passwordErrorMessage: String?
    @Published var cPasswordErrorMessage: String?
    
    
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

    // Used for confirm password status bar
    private func validatePasswordsMatch() -> Bool {
        self.passwordsMatch = password == cPassword
        return self.passwordsMatch
    }
    
    // Check name, likely going to only accept first names
    func validateName() -> Bool {
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            nameErrorMessage = "Name is required."
            return false
        }
        
        guard name.count <= 50 else {
            nameErrorMessage = "Sorry, max of 50 characters."
            return false
        }
        
        nameErrorMessage = nil
        return true
    }
    
    // Check email
    func validateEmail() -> Bool {
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            emailErrorMessage = "Email is required."
            return false
        }
        
        guard email.contains("@") else {
            emailErrorMessage = "Invalid Email."
            return false
        }
        
        emailErrorMessage = nil
        return true
    }
    
    // Check Password
    func validatePassword() -> Bool {
        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            passwordErrorMessage = "Password is required."
            return false
        }
        
        guard password.count >= 8 && password.count <= 25 else {
            passwordErrorMessage = "Invalid Password length."
            return false
        }
        
        passwordErrorMessage = nil
        return true
    }
    
    // Check Confirm Password
    func validateCPassword() -> Bool {
        guard !cPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            cPasswordErrorMessage = "Confirm Password is required."
            return false
        }
        
        guard validatePasswordsMatch() else {
            cPasswordErrorMessage = "Passwords do not match!"
            return false
        }
        
        cPasswordErrorMessage = nil
        return true
    }
    
    
    // Validates all form fields
    func validateForm() -> Bool {
        let isNameValid = validateName()
        let isEmailValid = validateEmail()
        let isPasswordValid = validatePassword()
        let isCPasswordValid = validateCPassword()
        
        return isNameValid && isEmailValid && isPasswordValid && isCPasswordValid
    }

}
