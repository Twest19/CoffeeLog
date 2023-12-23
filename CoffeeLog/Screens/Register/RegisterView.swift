//
//  RegisterView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel = RegisterViewModel()
    @FocusState private var focusedTextField: FormTextField?
    @Binding var showCreate: Bool
    
    let color: Color
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                // MARK: Sign In Form
                RegisterFormView(viewModel: viewModel)
                    .padding(.top)
                
                // login button
                Button {
                    print("Create Clicked")
                    if viewModel.validateForm() {
                        // create the users account and log them in
                        // navigate to next page
                    } else {
                        // show some error by the fields
                    }
                } label: {
                    Label("Create Account", systemImage: "person.fill")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(minHeight: 46)
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                .buttonStyle(.bordered)
                .tint(.green)
                Spacer()
            }
            
            // Footer
            Button {
                showCreate = false
            } label: {
                Label("Sign in with Apple?", systemImage: "apple.logo")
            }
            .frame(minHeight: 25)
            .padding(.vertical, 5)
            .tint(Color(uiColor: .label))

            
        }
        .padding(.horizontal)
        .navigationTitle("Create Account")
        .tint(.green)
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(showCreate: .constant(true),
                     color: Color(uiColor: .white))
    }
}
