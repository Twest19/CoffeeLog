//
//  CustomTextField.swift
//  CoffeeLog
//
//  Created by Tim West on 9/4/23.
//

import SwiftUI

struct CustomTextField: View {
    
    let placeHolder: String
    let imageName: String
    let backColor = Color(uiColor: .secondaryLabel)
    
    @Binding var value: String
    @State private var showPassword: Bool = false
    
    
    init(placeHolder: String, imageName: String, value: Binding<String>) {
        self.placeHolder = placeHolder
        self.imageName = imageName
        self._value = value
    }
    
    var body: some View {
        HStack(alignment: .center) {
            textFieldImage()
            newTextField()
            if placeHolder == "Password" || placeHolder == "Confirm Password" {
                Spacer()
                hidePasswordButton()
            }
        }
        .frame(minHeight: 25)
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(uiColor: .tertiaryLabel)).opacity(0.30))
    }
    
    @ViewBuilder
    private func newTextField() -> some View {
        if placeHolder == "Password" || placeHolder == "Confirm Password" {
            ZStack(alignment: .leading) {
                ZStack {
                    // Work around for making password field visible
                    TextField(placeHolder, text: $value)
                        .opacity(showPassword ? 1 : 0)
                    SecureField(placeHolder, text: $value)
                        .opacity(showPassword ? 0 : 1)
                }
                .passwordTextFieldStyle()
            }
        } else {
            ZStack(alignment: .leading) {
                TextField(placeHolder, text: $value)
            }
        }
    }
    
    
    private func hidePasswordButton() -> some View {
        Button {
            showPassword.toggle()
        } label: {
            Image(systemName: self.showPassword ? "eye" : "eye.slash")
                .tint(backColor)
        }
        .allowsHitTesting(!value.isEmpty)
    }
    
    
    private func textFieldImage() -> some View {
        Image(systemName: imageName)
            .foregroundColor(Color(uiColor: .secondaryLabel))
            .frame(width: 20, height: 20)
    }
}


struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeHolder: "Password",
                        imageName: "person.fill",
                        value: .constant("asd"))
    }
}
