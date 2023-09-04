//
//  LoginFooterView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct LoginFooterView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("New Here?")
            NavigationLink {
                //RegisterView()
            } label: {
                VStack(alignment: .center, spacing: 10) {
                    Label("Create Account", systemImage: "person.badge.plus.fill")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

struct LoginFooterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFooterView()
    }
}
