//
//  NavBarIconView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/4/23.
//

import SwiftUI

struct NavBarIconView: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "Back")
                .resizable()
                .frame(width: 18, height: 29)
                .foregroundColor(Color(uiColor: .label))
        }

    }
}

struct NavBarIconView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarIconView()
    }
}
