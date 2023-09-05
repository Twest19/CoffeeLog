//
//  RegisterViewModel.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI


final class RegisterViewModel: ObservableObject {
    
    @Published var errorMessage = ""
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
    @Published var passwordsMatch: Bool? = false
    @Published var name = ""
    @Published var email = ""
    @Published var passwordStrength: Double? = 0
    
    
    init () {
        
    }
    
    func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !cPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("CHARS")
            return false
        }
        
        guard email.contains("@") else {
            print("EMAIL")
            return false
        }
        
        guard password.count >= 6 && password.elementsEqual(cPassword) else {
            print("NO MATCH")
            return false
        }
        
        print("CLICKED")
        return true
    }
    
    func validateAndUpdateStrength(password: String) {
        var strengthCounter = 0.0
        
        // 8 or more characters
        if password.count >= 8 {
             strengthCounter += 0.30
         }

         // Check for uppercase
         let hasUppercase = NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*")
         if hasUppercase.evaluate(with: password) {
             strengthCounter += 0.20
         }

         // Check for numbers
         let hasNumbers = NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*")
         if hasNumbers.evaluate(with: password) {
             strengthCounter += 0.20
         }

         // Check for special characters
         let hasSpecialCharacters = NSPredicate(format:"SELF MATCHES %@", ".*[!&^%$#@()/]+.*")
         if hasSpecialCharacters.evaluate(with: password) {
             strengthCounter += 0.30
         }
        // Progress view only goes to 1.0
        self.passwordStrength = strengthCounter
    }
    
    private func validatePasswordsMatch() {
        print("IN")
        self.passwordsMatch = password == cPassword
        print(passwordsMatch)
    }
}
