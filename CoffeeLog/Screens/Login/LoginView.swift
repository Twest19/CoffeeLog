//
//  LoginView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel = LoginViewModel()
    
    @State private var showCreate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: Header
                HeaderView(systemImage: "cup.and.saucer.fill",
                               text: "Welcome to\n Coffee Buddy!")
                .ignoresSafeArea()
                .padding(.horizontal)
                .padding(.top, -50)
                
                VStack(alignment: .center, spacing: 10) {
                    // MARK: Sign In Form
                    LoginFormView(viewModel: viewModel)
                        .padding(.top)
                    // Button Stack
                    VStack(spacing: 15) {
                        // login button
                        Button {
                            print("Log in clicked")
                        } label: {
                            Label("Login", systemImage: "person.fill")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(minHeight: 46)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonBorderShape(.roundedRectangle(radius: 10))
                        .buttonStyle(.bordered)
                        .tint(.green)
                        // Apple Sign in
                        appleSignInButton()
                    }
                    Spacer()
                    // MARK: Footer
                    Button {
                        showCreate = true
                    } label: {
                        HStack {
                            Text("Do not have an account?")
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            Text("Sign Up!")
                        }
                    }
                    .frame(minHeight: 35)
                    .padding(.bottom, 20)
                }
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(isPresented: $showCreate) {
                RegisterView(showCreate: $showCreate, color: .green)
            }
        }
        .tint(.green)
    }
    
    
    private func appleSignInButton() -> some View {
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
