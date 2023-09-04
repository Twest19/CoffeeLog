//
//  SwiftUIView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/4/23.
//

import SwiftUI

struct BackgroundView: View {
    
    let systemImage: String
    let text: String
    
    init(systemImage: String, text: String) {
        self.systemImage = systemImage
        self.text = text
       
    }
    
    var body: some View {
        ZStack {
            ZStack {Ellipse()
                    .frame(width: 510, height: 470)
                    .padding(.leading, -200)
                    .foregroundColor(.brandGreyTeal)
                    .padding(.top, -130)
                Ellipse()
                    .frame(width: 510, height: 510)
                    .foregroundColor(.brandMelon)
                    .padding(.top, -550)
                Ellipse()
                    .frame(width: 510, height: 470)
                    .padding(.leading, 500)
                    .foregroundColor(.brandGreyBlue)
                    .padding(.top, -150)
            }
            .padding(.top, -90)
            
            VStack {
                Text("Coffee Buddy")
                    .multilineTextAlignment(.center)
                Image(systemName: "person.fill")
            }
            .fontWeight(.bold)
            .font(.system(size: 40))
            .foregroundColor(Color(uiColor: .systemBackground))
            .frame(maxWidth: .infinity)
            .padding()
            .padding(.top, 10)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(systemImage: "cup.and.saucer.fill",
                       text: "Welcome to \nCoffee Buddy")
    }
}
