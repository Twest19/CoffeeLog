//
//  CustomTextField.swift
//  CoffeeLog
//
//  Created by Tim West on 9/4/23.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeHolder: String
    var imageName: String
    var backColor: Color
    var opacity: Double
    @Binding var value: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading, 20)
                .foregroundColor(backColor.opacity(opacity))
            
            if placeHolder == "Password" || placeHolder == "Confirm Password" {
                ZStack(alignment: .leading) {
                    if value.isEmpty {
                        Text(placeHolder)
                            .foregroundColor(backColor.opacity(opacity))
                            .padding(.leading, 12)
                            .font(.system(size: 20))
                    }
                    
                    SecureField(placeHolder, text: $value)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                        .frame(height: 45)
                }
            } else {
                ZStack(alignment: .leading) {
                    if value.isEmpty {
                        Text(placeHolder)
                            .foregroundColor(backColor.opacity(opacity))
                            .padding(.leading, 12)
                            .font(.system(size: 20))
                    }
                    
                    TextField(placeHolder, text: $value)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                        .frame(height: 45)
//                        .foregroundColor(backColor)
                }
            }
        }
        .overlay(alignment: .bottom) {
            Divider()
                .overlay {
                    backColor.opacity(opacity)
                }.padding(.horizontal, 20)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeHolder: "Test",
                        imageName: "person.fill",
                        backColor: .brandGreyTeal,
                        opacity: 0.6,
                        value: .constant(""))
    }
}
