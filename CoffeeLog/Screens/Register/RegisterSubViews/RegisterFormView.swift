//
//  RegisterFormView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/11/23.
//

import SwiftUI

struct RegisterFormView: View {
    @ObservedObject var viewModel: RegisterViewModel
    
    @FocusState private var focusedTextField: FormTextField?
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 25) {
            // MARK: Name Field
            VStack(alignment: .center) {
                CustomTextField(placeHolder: "Name",
                                imageName: "person.fill",
                                value: $viewModel.name)
                .focused($focusedTextField, equals: .name)
                .onSubmit {
                    viewModel.validateName()
                    focusedTextField = .email
                }
                .submitLabel(.next)
                .textContentType(.name)
                
                // Potential Errors
                TextFieldErrorView(message: viewModel.nameError)
            }
            
            // MARK: Email Field
            VStack(alignment: .center) {
                CustomTextField(placeHolder: "Email",
                                imageName: "envelope.fill",
                                value: $viewModel.email)
                .focused($focusedTextField, equals: .email)
                .onSubmit {
                    viewModel.validateEmail()
                    focusedTextField = .password
                }
                .submitLabel(.next)
                .emailTextFieldStyle()
                
                // Potential Errors
                TextFieldErrorView(message: viewModel.emailError)
            }
            
            // MARK: Password Field
            VStack(alignment: .center) {
                CustomTextField(placeHolder: "Password",
                                imageName: "key",
                                value: $viewModel.password)
                .focused($focusedTextField, equals: .password)
                .onChange(of: viewModel.password) { _, newValue in
                    viewModel.validateAndUpdateStrength(password: newValue)
                }
                .onSubmit {
                    viewModel.validatePassword()
                    focusedTextField = .cPassword
                }
                .submitLabel(.next)
                .textContentType(.newPassword)
                
                if focusedTextField == .password { PasswordStrengthView(viewModel: viewModel) }
                
                // Potential Errors
                TextFieldErrorView(message: viewModel.passwordError)
            }
            
            // MARK: Confirm Password
            VStack(alignment: .center) {
                CustomTextField(placeHolder: "Confirm Password",
                                imageName: "key.fill",
                                value: $viewModel.cPassword)
                .focused($focusedTextField, equals: .cPassword)
                .onChange(of: viewModel.cPassword) {
                    viewModel.testMatchingPasswords()
                }
                .onSubmit {
                    viewModel.validateConfirmPassword()
                    focusedTextField = nil
                }
                .submitLabel(.return)
                .textContentType(.newPassword)
                
                if focusedTextField == .cPassword { ConfirmPasswordBar(viewModel: viewModel) }
                
                // Potential Errors
                TextFieldErrorView(message: viewModel.cPasswordError)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Dismiss") {
                    focusedTextField = nil
                }
            }
        }
    }
}


#Preview {
    RegisterFormView(viewModel: RegisterViewModel())
}
