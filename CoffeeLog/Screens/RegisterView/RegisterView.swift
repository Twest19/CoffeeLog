//
//  RegisterView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    @FocusState private var focusedTextField: FormTextField?
        
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center) {
                    // MARK: Sign In Form
                    RegisterFormView(viewModel: viewModel)
                        .padding(.top)
                    
                    // login button
                    Button {
                        print("Create Clicked")
                        viewModel.validate()
                    } label: {
                        Label("Create Account", systemImage: "person.fill")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(minHeight: 46)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical)
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                    .buttonStyle(.bordered)
                    .tint(.green)
                    Spacer()
                }
            }
            .padding(.horizontal)
            .navigationTitle("Create Account")
        }
        .tint(.green)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(color: Color(uiColor: .white))
    }
}
