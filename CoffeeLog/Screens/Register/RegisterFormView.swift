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
                errorMessage(error: viewModel.nameErrorMessage)
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
                errorMessage(error: viewModel.emailErrorMessage)
            }

            // MARK: Password Field
            VStack(alignment: .center) {
                CustomTextField(placeHolder: "Password",
                                imageName: "key",
                                value: $viewModel.password)
                .focused($focusedTextField, equals: .password)
                .onSubmit {
                    viewModel.validatePassword()
                    focusedTextField = .cPassword
                }
                .submitLabel(.next)
                .textContentType(.newPassword)
                
                if focusedTextField == .password { passwordStrengthBar() }
                // Potential Errors
                errorMessage(error: viewModel.passwordErrorMessage)
            }
            
            // MARK: Confirm Password
            VStack(alignment: .center) {
                CustomTextField(placeHolder: "Confirm Password",
                                imageName: "key.fill",
                                value: $viewModel.cPassword)
                .focused($focusedTextField, equals: .cPassword)
                .onSubmit {
                    viewModel.validateCPassword()
                    focusedTextField = nil
                }
                .submitLabel(.return)
                .textContentType(.newPassword)
                
                if focusedTextField == .cPassword { confirmPasswordBar() }
                
                // Potential Errors
                errorMessage(error: viewModel.cPasswordErrorMessage)
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
    
    @ViewBuilder
    private func passwordStrengthBar() -> some View {
        if !viewModel.password.isEmpty {
            let (_, color) = progressColor(viewModel.passwordStrength)
            VStack {
                ProgressView(value: viewModel.passwordStrength)
                    .tint(color)
                HStack {
                    GroupBox {
                        VStack(alignment: .leading) {
                            Label("Between 8 and 25 characters",
                                  systemImage: viewModel.eightLength ? "checkmark" : "xmark")
                                .foregroundColor(viewModel.eightLength ? .green : .red)
                            
                            Label("At least 1 Capital",
                                  systemImage: viewModel.oneCapital ? "checkmark" : "xmark")
                                .foregroundColor(viewModel.oneCapital ? .green : .red)
                            
                            Label("At least 1 Number",
                                  systemImage: viewModel.oneNumb ? "checkmark" : "xmark")
                                .foregroundColor(viewModel.oneNumb ? .green : .red)
                            
                            Label("At least 1 special character like (! @ # $ % ^ * ?)",
                                  systemImage: viewModel.oneSpecial ? "checkmark" : "xmark")
                                .foregroundColor(viewModel.oneSpecial ? .green : .red)
                        }
                    }
                }
                .foregroundColor(color)
                .font(.footnote)
            }
        }
    }
    
    @ViewBuilder
    private func confirmPasswordBar() -> some View {
        if !viewModel.cPassword.isEmpty {
            VStack {
                ProgressView(value: 1.0)
                    .tint(.red)
//                HStack {
//                    Text("Passwords do not match!")
//                }
//                .foregroundColor(.red)
//                .font(.footnote)
            }
            .opacity((viewModel.passwordsMatch) ? 0 : 1)
        }
    }
    
    private func progressColor(_ strength: Double?) -> (String, Color) {
        guard let strength = strength else {
            return ("Bad", Color.red)
        }
        
        switch strength {
        case 0.0...0.30:
            return ("Bad", Color.red)
        case 0.31...0.50:
            return ("OK", Color.orange)
        case 0.51...0.99:
            return ("Good", Color.yellow)
        case 1.0...:
            return ("Strong", Color.green)
        default:
            return ("Bad", Color.red)
        }
    }
    
    @ViewBuilder
    private func errorMessage(error: String?) -> some View {
        if let errorMessage = error {
            HStack {
                Label(errorMessage, systemImage: "xmark")
                    .font(.caption)
                    .foregroundColor(.red)
                Spacer()
            }
        }
    }
}

struct RegisterFormView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterFormView(viewModel: RegisterViewModel())
    }
}
