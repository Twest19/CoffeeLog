//
//  CoffeeStatView.swift
//  CoffeeLog
//
//  Created by Tim West on 10/29/23.
//

import SwiftUI

struct CoffeeStatView: View {
    
    var number: String
    var title: String
    
    init(number: String, title: String) {
        self.number = number
        self.title = title
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .center) {
                Circle()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.yellow)
                Text(number)
                    .font(.title)
            }
            Text(title)
                .font(.title2)
        }
    }
}

struct CoffeeStatView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeStatView(number: "23", title: "Streak")
    }
}

