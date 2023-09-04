//
//  CLButton.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct CLButton: View {
    
    var title: String
    var systemImage: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, minHeight: 50)
        }
        .buttonStyle(.bordered)
        .tint(color)
        .foregroundStyle(color)
    }
}

struct CLButton_Previews: PreviewProvider {
    static var previews: some View {
        CLButton(title: "Log In", systemImage: "person.fill", color: Color.brandGreyTeal, action: {print("HEllo")})
    }
}
