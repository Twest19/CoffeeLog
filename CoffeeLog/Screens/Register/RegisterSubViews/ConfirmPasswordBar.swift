//
//  PasswordBar.swift
//  CoffeeLog
//
//  Created by Tim West on 12/23/23.
//

import SwiftUI

struct ConfirmPasswordBar: View {
    
    @ObservedObject var viewModel: RegisterViewModel
    
    var body: some View {
        if !viewModel.cPassword.isEmpty {
            VStack {
                ProgressView(value: 1.0)
                    .tint(.red)
            }
            .opacity((viewModel.matchingPasswords) ? 0 : 1)
        }
    }
}

#Preview {
    ConfirmPasswordBar(viewModel: RegisterViewModel())
}
