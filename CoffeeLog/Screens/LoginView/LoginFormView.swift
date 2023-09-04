//
//  LoginFormView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct LoginFormView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    @FocusState private var focusedTextField: FormTextField?
    
    let color: Color
    
    enum FormTextField {
        case email, password
    }
    
    init(viewModel: LoginViewModel, color: Color) {
        self.viewModel = viewModel
        self.color = color
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            if !viewModel.errorMessage.isEmpty {
                Text("*\(viewModel.errorMessage)")
                    .padding(5)
                    .foregroundColor(.red)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .opacity(0.2)
                    }
            }
            
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(height: 100)
                .opacity(0.2)
                .overlay {
                    VStack {
                        TextField("Email Address", text: $viewModel.email)
                            .padding(10)
                            .focused($focusedTextField, equals: .email)
                            .onSubmit {
                                focusedTextField = .password
                            }
                            .submitLabel(.next)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                            .autocorrectionDisabled()
                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(.plain)
                            .padding(10)
                            .focused($focusedTextField, equals: .password)
                            .onSubmit {
                                focusedTextField = nil
                            }
                            .submitLabel(.return)
                            .textInputAutocapitalization(.none)
                            .autocorrectionDisabled()
                        
                    }
                }
            
            CLButton(title: "Log In", systemImage: "person.fill", color: .brandGreyTeal) {
                // Log In The User
                print("Log In Tapped")
                viewModel.login()
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Dismiss") {
                    focusedTextField = nil
                }
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
        }
    }
}

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView(viewModel: LoginViewModel(), color: .brandGreyTeal)
    }
}
