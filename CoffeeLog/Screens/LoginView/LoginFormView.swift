//
//  LoginFormView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI
import AuthenticationServices

struct LoginFormView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    @FocusState private var focusedTextField: FormTextField?
    
    @Environment(\.colorScheme) var colorScheme
    
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 15) {
            // Email field
            CustomTextField(placeHolder: "Email",
                            imageName: "envelope.fill",
                            value: $viewModel.email)
            .focused($focusedTextField, equals: .email)
            .onSubmit {
                focusedTextField = .password
            }
            .submitLabel(.next)
            .emailTextFieldStyle()

            // Pass field
            CustomTextField(placeHolder: "Password",
                            imageName: "lock.fill",
                            value: $viewModel.password)
                .focused($focusedTextField, equals: .password)
                .onSubmit {
                    focusedTextField = nil
                }
                .submitLabel(.return)
                .passwordTextFieldStyle()
                .textContentType(.password)
            
            HStack {
                Spacer()
                // forgot password
                Button("Forgot Password?") {
                    print("Create account clicked")
                }
                .frame(minHeight: 44, alignment: .top)
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

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView(viewModel: LoginViewModel())
    }
}
