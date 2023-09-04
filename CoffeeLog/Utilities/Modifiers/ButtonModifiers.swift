//
//  ButtonModifiers.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandGreyTeal)
            .controlSize(.large)
            .buttonBorderShape(.capsule)
    }
}
