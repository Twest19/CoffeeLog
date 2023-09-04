//
//  LoginView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {

        NavigationStack {

                VStack(spacing: 10) {
                    // Header
                    LoginHeaderView()
                        .ignoresSafeArea()
                        .offset(y: -90)
                    Spacer()
                    // Sign in form
                    LoginFormView(viewModel: viewModel, color: .brandGreyTeal)
                        .offset(y: -50)
                    Spacer()
                    // Footer
                    LoginFooterView()
                        .foregroundColor(Color.brandGreyTeal)
                        .padding()
                }
                .padding()

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
