//
//  RegisterView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    @FocusState private var focusedTextField: FormTextField?
        
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                Color.brandBackground.ignoresSafeArea()
                VStack {
                    VStack(spacing: 40) {
                        // Background and title
                        ZStack {
                            Ellipse()
                                .frame(width: 510, height: 510)
                                .foregroundColor(.brandMelon)
                                .padding(.top, -520)
                                .padding(.trailing, -400)
                            Ellipse()
                                .frame(width: 510, height: 510)
                                .foregroundColor(.brandMint)
                                .padding(.top, -550)
                                .padding(.leading, -300)

                            VStack {
                                Text("Create Account")
                                    .multilineTextAlignment(.center)
                                Image(systemName: "person.fill")
                            }
                            .fontWeight(.bold)
                            .font(.system(size: 40))
                            .foregroundColor(color)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding([.leading, .trailing], 20)
                            .padding(.top, 50)
                        }
                        
                        // Form
                        VStack(spacing: 20) {
                            // TextFields
                            VStack(spacing: 30) {
                                
                                CustomTextField(placeHolder: "Name",
                                                imageName: "person.fill",
                                                backColor: color,
                                                opacity: 1.0,
                                                value: $viewModel.name)
                                .focused($focusedTextField, equals: .name)
                                .onSubmit {
                                    focusedTextField = .email
                                }
                                    .submitLabel(.next)
                                    .textContentType(.name)
                                
                                CustomTextField(placeHolder: "Email",
                                                imageName: "envelope.fill",
                                                backColor: color,
                                                opacity: 1.0,
                                                value: $viewModel.email)
                                    .focused($focusedTextField, equals: .email)
                                    .onSubmit {
                                        focusedTextField = .password
                                    }
                                    .submitLabel(.next)
                                    .emailTextFieldStyle()
                                
                                CustomTextField(placeHolder: "Password",
                                                imageName: "key",
                                                backColor: color,
                                                opacity: 1.0,
                                                value: $viewModel.password,
                                                strength: $viewModel.passwordStrength)
                                    .focused($focusedTextField, equals: .password)
                                    .onSubmit {
                                        focusedTextField = .cPassword
                                    }
                                    .submitLabel(.next)
                                    .passwordTextFieldStyle()
                                    .textContentType(.newPassword)
                                
                                CustomTextField(placeHolder: "Confirm Password",
                                                imageName: "key.fill",
                                                backColor: color,
                                                opacity: 1.0,
                                                value: $viewModel.cPassword,
                                                passwordsMatch: $viewModel.passwordsMatch)
                                    .focused($focusedTextField, equals: .cPassword)
                                    .onSubmit {
                                        focusedTextField = nil
                                    }
                                    .submitLabel(.return)
                                    .passwordTextFieldStyle()
                                    .textContentType(.newPassword)
                            }
                            .foregroundColor(.white)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Button("Dismiss") {
                                        focusedTextField = nil
                                    }
                                }
                            }
                            // Buttons
                            VStack(alignment: .trailing, spacing: 10) {
                                CLButton(title: "Log In",
                                         systemImage: "lock",
                                         color: .brandMint,
                                         textColor: .black) {
                                    // Log in The user
                                    viewModel.validate()
                                }
                                
                                SignInWithAppleButtonViewRepresentable(type: .signIn, style: .white)
                                .frame(height: 55)
                            }
                            .padding([.horizontal, .top], 20)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(color: Color(uiColor: .white))
    }
}
