//
//  LoginHeaderView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct LoginHeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 35)
                .foregroundColor(Color.brandMelon)
            Circle()
                .fill(Color.brandGreyBlue)
                .offset(x: -90, y: 80)
            Circle()
                .fill(Color.brandGreyTeal)
                .offset(x: 100, y: -120)
            Circle()
                .fill(Color.brandMint)
                .offset(x: -120, y: -120)
            
            VStack {
                Text("Coffee Buddy")
                Image(systemName: "cup.and.saucer.fill")
            }
            .foregroundColor(Color(uiColor: .systemBackground))
            .fontWeight(.bold)
            .font(.system(size: 40))
            .offset(y: 80)
            
        }
        .cornerRadius(50)
        .clipped()
        .frame(height: 300)
        
    }
}

struct LoginHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeaderView()
    }
}
