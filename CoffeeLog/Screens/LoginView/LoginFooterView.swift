//
//  LoginFooterView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct LoginFooterView: View {
    
    var body: some View {
        // create account - Footer
        NavigationLink {
            RegisterView(color: .blue)
        } label: {
            HStack {
                Text("Do not have an account?")
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                Text("Sign up!")
            }
        }
    }
}

struct LoginFooterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFooterView()
    }
}
