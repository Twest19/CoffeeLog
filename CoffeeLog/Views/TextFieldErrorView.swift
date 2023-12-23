//
//  TextFieldErrorView.swift
//  CoffeeLog
//
//  Created by Tim West on 12/22/23.
//

import SwiftUI

struct TextFieldErrorView: View {
    
    var message: String?
    
    var body: some View {
        if let errorMessage = message {
            HStack {
                Label(errorMessage, systemImage: "xmark")
                    .font(.caption)
                    .foregroundColor(.red)
                Spacer()
            }
        }
    }
}

#Preview {
    TextFieldErrorView()
}
