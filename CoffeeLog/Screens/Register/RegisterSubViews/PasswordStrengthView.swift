//
//  PasswordStrengthView.swift
//  CoffeeLog
//
//  Created by Tim West on 12/23/23.
//

import SwiftUI

struct PasswordStrengthView: View {
    
    @ObservedObject var viewModel: RegisterViewModel
    
    var body: some View {
        if !viewModel.password.isEmpty {
            let (_, color) = progressColor(viewModel.passwordStrength)
            VStack {
                ProgressView(value: viewModel.passwordStrength)
                    .tint(color)
                HStack {
                    GroupBox {
                        VStack(alignment: .leading) {
                            Label("Between 8 and 25 characters",
                                  systemImage: viewModel.eightLength ? "checkmark" : "xmark")
                            .foregroundColor(viewModel.eightLength ? .green : .red)
                            
                            Label("At least 1 Capital",
                                  systemImage: viewModel.oneCapital ? "checkmark" : "xmark")
                            .foregroundColor(viewModel.oneCapital ? .green : .red)
                            
                            Label("At least 1 Number",
                                  systemImage: viewModel.oneNumb ? "checkmark" : "xmark")
                            .foregroundColor(viewModel.oneNumb ? .green : .red)
                            
                            Label("At least 1 special character like (! @ # $ % ^ * ?)",
                                  systemImage: viewModel.oneSpecial ? "checkmark" : "xmark")
                            .foregroundColor(viewModel.oneSpecial ? .green : .red)
                        }
                    }
                }
                .foregroundColor(color)
                .font(.footnote)
            }
        }
    }
    
    
    private func progressColor(_ strength: Double?) -> (String, Color) {
        guard let strength = strength else { return ("Bad", Color.red) }
        
        switch strength {
        case 0.0...0.30:
            return ("Bad", Color.red)
        case 0.31...0.50:
            return ("OK", Color.orange)
        case 0.51...0.99:
            return ("Good", Color.yellow)
        case 1.0...:
            return ("Strong", Color.green)
        default:
            return ("Bad", Color.red)
        }
    }
}


#Preview {
    PasswordStrengthView(viewModel: RegisterViewModel())
}
