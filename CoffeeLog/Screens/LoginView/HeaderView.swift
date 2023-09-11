//
//  SwiftUIView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/4/23.
//

import SwiftUI

struct HeaderView: View {
    
    let systemImage: String
    let text: String
    
    init(systemImage: String, text: String) {
        self.systemImage = systemImage
        self.text = text
       
    }
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green.opacity(0.3))
                .frame(height: 300)
                .overlay(alignment: .bottom) {
                    VStack(alignment: .center) {
                        // Header Symbol
                        Image(systemName: systemImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160, height: 160)
                        // Header Text
                        Text(text)
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .padding(.bottom)
                    }
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                    .fontWeight(.semibold)
                }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(systemImage: "cup.and.saucer.fill",
                       text: "Welcome to \nCoffee Buddy")
    }
}
