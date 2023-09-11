//
//  NavBarIconView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/4/23.
//

import SwiftUI

struct RegisterHeaderView: View {
    
    let color: Color
    let text: String
    let systemImage: String
    
    init(color: Color, text: String, systemImage: String) {
        self.color = color
        self.text = text
        self.systemImage = systemImage
    }
    
    var body: some View {
        ZStack {
            Ellipse()
                .frame(width: 510, height: 510)
                .foregroundColor(.brandMelon)
                .padding(.top, -520)
                .padding(.trailing, -400)
            Ellipse()
                .frame(width: 510, height: 510)
                .foregroundColor(.brandMint)
                .padding(.top, -550)
                .padding(.leading, -300)

            VStack {
                Text(text)
                    .multilineTextAlignment(.center)
                Image(systemName: systemImage)
            }
            .fontWeight(.bold)
            .font(.system(size: 40))
            .foregroundColor(color)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding([.leading, .trailing], 20)
            .padding(.top, 50)
        }

    }
}

struct NavBarIconView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterHeaderView(color: .white, text: "Create Account", systemImage: "person.fill")
    }
}
