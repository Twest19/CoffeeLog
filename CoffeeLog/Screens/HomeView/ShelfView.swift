//
//  HomeHeaderView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/2/23.
//

import SwiftUI

struct ShelfView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "tray.fill")
                Text("Your Shelf")
                    .font(.title2)
                
                Spacer()
                
                Button {
                    print("Shelf button clicked")
                } label: {
                    Image(systemName: "chevron.right")
                }
                
            }
            .foregroundColor(Color(uiColor: .label))
            .padding([.leading, .trailing])
            
            ScrollView(.horizontal) {
                HStack(alignment: .center, spacing: 10) {
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 110, height: 150)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 110, height: 150)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 110, height: 150)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 110, height: 150)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 110, height: 150)
                }
                .padding([.leading, .trailing], 10)
                
            }
            .scrollBounceBehavior(.basedOnSize)
        }
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView()
    }
}
