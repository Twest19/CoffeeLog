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
    @State private var showPassword: Bool = false
    
    var body: some View {
        HStack {
            textFieldSymbol()
            
            if placeHolder == "Password" || placeHolder == "Confirm Password" {
                ZStack(alignment: .leading) {
                    if $value.wrappedValue.isEmpty { emptyTextField() }
                    ZStack {
                        // Work around for making password field visible
                        regularTextField()
                            .opacity(showPassword ? 1 : 0)
                        secureTextField()
                            .opacity(showPassword ? 0 : 1)
                    }
                }
                .overlay(alignment: .trailing) {
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: self.showPassword ? "eye" : "eye.slash")
                            .tint(backColor.opacity(opacity))
                            .padding(.trailing, 20)
                    }
                    .allowsHitTesting(!value.isEmpty)
                }
                
            } else {
                ZStack(alignment: .leading) {
                    if $value.wrappedValue.isEmpty {
                        emptyTextField()
                    }
                    regularTextField()
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
    
    @ViewBuilder
    private func emptyTextField() -> some View {
        Text(placeHolder)
            .foregroundColor(backColor.opacity(opacity))
            .padding(.leading, 12)
            .font(.system(size: 20))
    }
    
    @ViewBuilder
    private func regularTextField() -> some View {
        TextField(placeHolder, text: $value)
            .padding(.leading, 12)
            .font(.system(size: 20))
            .frame(height: 45)
    }
    
    @ViewBuilder
    private func secureTextField() -> some View {
        SecureField(placeHolder, text: $value)
            .padding(.leading, 12)
            .font(.system(size: 20))
            .frame(height: 45)
    }
    
    @ViewBuilder
    private func textFieldSymbol() -> some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.leading, 20)
            .foregroundColor(backColor.opacity(opacity))
    }
}

struct CustomTextField_Previews: PreviewProvider {
    @FocusState static var focus: FormTextField?
    
    static var previews: some View {
        CustomTextField(placeHolder: "Password",
                        imageName: "person.fill",
                        backColor: .brandGreyTeal,
                        opacity: 0.6,
                        value: .constant(""))
    }
}
