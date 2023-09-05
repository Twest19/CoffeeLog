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
    let backColor: Color
    let opacity: Double
    
    @Binding var value: String
    @Binding var strength: Double?
    @Binding var passwordsMatch: Bool?
    @State private var showPassword: Bool = false
    
    
    init(placeHolder: String, imageName: String, backColor: Color, opacity: Double,
         value: Binding<String>, strength: Binding<Double?> = .constant(nil),
         passwordsMatch: Binding<Bool?> = .constant(nil)) {
        self.placeHolder = placeHolder
        self.imageName = imageName
        self.backColor = backColor
        self.opacity = opacity
        self._value = value
        self._strength = strength
        self._passwordsMatch = passwordsMatch
    }
    
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
                    overlayGroup()
                }.padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    private func overlayGroup() -> some View {
        if !$value.wrappedValue.isEmpty {
            if let strengthValue = strength {
                passwordStrengthBar()
            } else if let match = passwordsMatch, !match {
                confirmPasswordBar()
            } else {
                backColor.opacity(opacity)
            }
        } else {
            backColor.opacity(opacity)
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
    
    @ViewBuilder
    private func passwordStrengthBar() -> some View {
        let (text, color) = progressColor(strength)
        Group {
            ProgressView(value: strength ?? 0.0)
                .tint(color)
            HStack {
                Text(text)
            }
            .foregroundColor(color)
            .font(.footnote)
            .padding(.top , 20)
        }
    }
    
    @ViewBuilder
    private func confirmPasswordBar() -> some View {
        Group {
            ProgressView(value: 1.0)
                .tint(.red)
            HStack {
                Text("Passwords do not match!")
            }
            .foregroundColor(.red)
            .font(.footnote)
            .padding(.top , 20)
        }.opacity((passwordsMatch ?? false) ? 0 : 1)
    }
    
    private func progressColor(_ strength: Double?) -> (String, Color) {
        guard let strength = strength else {
            return ("Bad", Color.red)
        }

        switch strength {
        case 0.0...0.2:
            return ("Bad", Color.red)
        case 0.21...0.5:
            return ("OK", Color.orange)
        case 0.51...0.75:
            return ("Good", Color.yellow)
        case 0.76...1.0:
            return ("Strong", Color.green)
        default:
            return ("Bad", Color.red)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    @FocusState static var focus: FormTextField?
    
    static var previews: some View {
        CustomTextField(placeHolder: "Password",
                        imageName: "person.fill",
                        backColor: .brandGreyTeal,
                        opacity: 0.6,
                        value: .constant("asdasdasdasd"),
                        strength: .constant(0.25))
    }
}
