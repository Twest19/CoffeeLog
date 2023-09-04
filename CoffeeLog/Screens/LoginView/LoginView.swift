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
            ZStack(alignment: .topLeading) {
                VStack {
                    VStack(spacing: 40) {
//                         Background and title
                        BackgroundView(systemImage: "cup.and.saucer.fill",
                                       text: "Welcome to \nCoffee Buddy")
                        
                        LoginFormView(viewModel: viewModel, color: .brandGreyTeal)
                        
                        LoginFooterView()
                        Spacer()
                    }
                }
            }
        }
        .tint(Color.brandMelon)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
