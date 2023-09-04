//
//  ButtonModifiers.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct EmailTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .submitLabel(.next)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .textContentType(.emailAddress)
    }
}

struct PasswordTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }
}


extension View {
    
    func emailTextFieldStyle() -> some View {
        self.modifier(EmailTextFieldStyle())
    }
    
    func passwordTextFieldStyle() -> some View {
        self.modifier(PasswordTextFieldStyle())
    }
}
