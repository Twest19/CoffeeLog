//
//  RegisterViewModel.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI


final class RegisterViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var password = ""
    @Published var cPassword = ""
    @Published var name = ""
    @Published var email = ""
    
    
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
}
