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
    
    let color: Color
    
    init(viewModel: LoginViewModel, color: Color) {
        self.viewModel = viewModel
        self.color = color
    }
    
    var body: some View {
        VStack(spacing: 30) {
            // TextFields
            VStack(spacing: 30) {
                CustomTextField(placeHolder: "Email",
                                imageName: "envelope.fill",
                                backColor: color,
                                opacity: 0.8,
                                value: $viewModel.email)
                    .focused($focusedTextField, equals: .email)
                    .onSubmit {
                        focusedTextField = .password
                    }
                    .submitLabel(.next)
                    .emailTextFieldStyle()
                
                CustomTextField(placeHolder: "Password", imageName: "key.fill", backColor: color, opacity: 0.8, value: $viewModel.password)
                    .focused($focusedTextField, equals: .password)
                    .onSubmit {
                        focusedTextField = nil
                    }
                    .submitLabel(.return)
                    .passwordTextFieldStyle()
                    .textContentType(.password)
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
            // Buttons
            VStack(alignment: .trailing, spacing: 10) {
                // Needs to be a button, navigation link for resetting password to firebase
                Text("Forgot Password?")
                    .fontWeight(.medium)
                
                CLButton(title: "Log In",
                         systemImage: "lock",
                         color: color,
                         textColor: Color(uiColor: .systemBackground)) {
                    print("Log in clicked")
                }
                
                Button {
                    print("Apple Button")
                } label: {
                    switch colorScheme {
                    case .dark:
                        SignInWithAppleButtonViewRepresentable(type: .signIn, style: .white)
                            .allowsHitTesting(false)
                        
                    case .light:
                        SignInWithAppleButtonViewRepresentable(type: .signIn, style: .black)
                            .allowsHitTesting(false)
                        
                    @unknown default:
                        fatalError("Not Yet Implemented")
                    }
                }.frame(height: 55)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView(viewModel: LoginViewModel(), color: .brandGreyTeal)
    }
}



//RoundedRectangle(cornerRadius: 10)
//    .fill(color)
//    .frame(height: 100)
//    .opacity(0.2)
//    .overlay {
//        VStack {
//            TextField("Email Address", text: $viewModel.email)
//                .padding(10)
//                .focused($focusedTextField, equals: .email)
//                .onSubmit {
//                    focusedTextField = .password
//                }
//                .submitLabel(.next)
//                .emailTextFieldStyle()
//
//            Divider()
//
//            SecureField("Password", text: $viewModel.password)
//                .textFieldStyle(.plain)
//                .padding(10)
//                .focused($focusedTextField, equals: .password)
//                .onSubmit {
//                    focusedTextField = nil
//                }
//                .submitLabel(.return)
//                .passwordTextFieldStyle()
//        }
//    }
