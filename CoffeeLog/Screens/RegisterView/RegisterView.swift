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
    
    @Environment(\.colorScheme) var colorScheme
    
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
                                                value: $viewModel.password)
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
                                                value: $viewModel.cPassword)
                                    .focused($focusedTextField, equals: .cPassword)
                                    .onSubmit {
                                        focusedTextField = nil
                                    }
                                    .submitLabel(.return)
                                    .passwordTextFieldStyle()
                                    .textContentType(.newPassword)
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
                                CLButton(title: "Log In",
                                         systemImage: "lock",
                                         color: .brandMint,
                                         textColor: .black) {
                                    
                                    viewModel.validate()
                                }
                                
                                SignInWithAppleButtonViewRepresentable(type: .signIn, style: .white)
                                .frame(height: 55)
                            }
                            .padding(.horizontal, 20)
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


//@FocusState private var focusedTextField: FormTextField?
//
//let color: Color
//
//init(color: Color) {
//    self.color = color
//}
//
//var body: some View {
//    ScrollView {
//        VStack(spacing: 10) {
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color.brandMelon)
//                .frame(height: 100)
//                .opacity(0.2)
//                .overlay {
//                    VStack {
//                        Text("Register")
//                            .font(.largeTitle)
//                            .fontWeight(.semibold)
//                        Text("Start logging Coffee")
//                            .font(.body)
//                            .multilineTextAlignment(.center)
//                        Spacer()
//                    }
//                    .padding()
//                }
//
//            VStack(alignment: .leading, spacing: 15) {
//                if !viewModel.errorMessage.isEmpty {
//                    Text("*\(viewModel.errorMessage)")
//                        .padding(5)
//                        .foregroundColor(.red)
//                        .overlay {
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.red)
//                                .opacity(0.2)
//                        }
//                }
//
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(color)
//                    .frame(height: 200)
//                    .opacity(0.2)
//                    .overlay {
//                        VStack {
//                            TextField("First Name", text: $viewModel.firstName)
//                                .focused($focusedTextField, equals: .firstName)
//                                .onSubmit {
//                                    focusedTextField = .lastName
//                                }
//                                .submitLabel(.next)
//                                .padding(10)
//
//
//                            TextField("Last Name", text: $viewModel.lastName)
//                                .focused($focusedTextField, equals: .lastName)
//                                .onSubmit {
//                                    focusedTextField = .email
//                                }
//                                .submitLabel(.next)
//                                .padding(10)
//
//                            TextField("Email Address", text: $viewModel.email)
//                                .focused($focusedTextField, equals: .email)
//                                .onSubmit {
//                                    focusedTextField = .password
//                                }
//                                .submitLabel(.next)
//                                .emailTextFieldStyle()
//                                .padding(10)
//
//                            SecureField("Password", text: $viewModel.password)
//                                .textFieldStyle(.plain)
//                                .focused($focusedTextField, equals: .password)
//                                .onSubmit {
//                                    focusedTextField = nil
//                                }
//                                .submitLabel(.return)
//                                .passwordTextFieldStyle()
//                                .padding(10)
//                        }
//                    }
//                CLButton(title: "Create Account", systemImage: "person.fill", color: .brandGreyTeal) {
//                    // Create Account
//                    print("Create Tapped")
//                }
//            }
//            .toolbar {
//                ToolbarItemGroup(placement: .keyboard) {
//                    Button("Dismiss") {
//                        focusedTextField = nil
//                    }
//                }
//            }
//            Spacer()
//        }
//        .padding()
//    }
//    .frame(maxHeight: .infinity)
//    .ignoresSafeArea(.keyboard)
//}
