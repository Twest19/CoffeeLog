//
//  LoginViewModel.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login() {
        
        guard validateLogin() else {
            return
        }
        
        // Try to log in
        // FireBase Login
//        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validateLogin() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        
        return true
    }
    
    
}
