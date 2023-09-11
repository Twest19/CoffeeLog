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
    
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 25) {
            // MARK: Name Field
            CustomTextField(placeHolder: "Name",
                            imageName: "person.fill",
                            value: $viewModel.name)
            .focused($focusedTextField, equals: .name)
            .onSubmit {
                focusedTextField = .email
            }
            .submitLabel(.next)
            .textContentType(.name)
            
            // MARK: Email Field
            CustomTextField(placeHolder: "Email",
                            imageName: "envelope.fill",
                            value: $viewModel.email)
            .focused($focusedTextField, equals: .email)
            .onSubmit {
                focusedTextField = .password
            }
            .submitLabel(.next)
            .emailTextFieldStyle()

            // MARK: Password Field
            VStack(alignment: .center) {
                CustomTextField(placeHolder: "Password",
                                imageName: "key",
                                value: $viewModel.password)
                .focused($focusedTextField, equals: .password)
                .onSubmit {
                    focusedTextField = .cPassword
                }
                .submitLabel(.next)
                .textContentType(.newPassword)
                
                passwordStrengthBar()
            }
            
            // MARK: Confirm Password
            VStack(alignment: .center) {
                CustomTextField(placeHolder: "Confirm Password",
                                imageName: "key.fill",
                                value: $viewModel.cPassword)
                .focused($focusedTextField, equals: .cPassword)
                .onSubmit {
                    focusedTextField = nil
                }
                .submitLabel(.return)
                .textContentType(.newPassword)
                
                confirmPasswordBar()
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
            let (text, color) = progressColor(viewModel.passwordStrength)
            VStack {
                ProgressView(value: viewModel.passwordStrength ?? 0.0)
                    .tint(color)
                HStack {
                    Text(text)
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
                HStack {
                    Text("Passwords do not match!")
                }
                .foregroundColor(.red)
                .font(.footnote)
            }
            .opacity((viewModel.passwordsMatch ?? false) ? 0 : 1)
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
}

struct RegisterFormView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterFormView(viewModel: RegisterViewModel())
    }
}
