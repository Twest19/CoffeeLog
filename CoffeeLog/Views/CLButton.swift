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
    var textColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .frame(height: 50)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(color)
        .foregroundStyle(textColor)
    }
}

struct CLButton_Previews: PreviewProvider {
    static var previews: some View {
        CLButton(title: "Log In", systemImage: "person.fill", color: Color.brandGreyTeal, textColor: .black, action: {print("HEllo")})
    }
}
