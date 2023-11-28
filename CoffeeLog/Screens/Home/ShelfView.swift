//
//  HomeHeaderView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/2/23.
//

import SwiftUI

struct ShelfView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "tray.fill")
                Text("Your Shelf")
                    .font(.title3)
                
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
                LazyHGrid(rows: viewModel.rows) {

                    ForEach(colors, id: \.self) { color in
                        Rectangle()
                            .fill(color)
                            .frame(width: 120, height: 170, alignment: .leading)
                    }
                    Button(action: {
                        
                    }, label: {
                        HStack(alignment: .center) {
                            Spacer()
                            Image(systemName: "plus.app")
                            Spacer()
                        }
                    })
                    .frame(width: 120, height: 170, alignment: .leading)
                    .background(.yellow)
                }
                .padding([.leading, .trailing], 10)
                
            }
            .scrollBounceBehavior(.basedOnSize)
        }
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView(viewModel: HomeViewModel())
    }
}


//HStack(alignment: .center, spacing: 10) {
//    Rectangle()
//        .fill(Color.red)
//        .frame(width: 130, height: 170)
//
//    Rectangle()
//        .fill(Color.red)
//        .frame(width: 130, height: 170)
//
//    Rectangle()
//        .fill(Color.red)
//        .frame(width: 130, height: 170)
//
//    Rectangle()
//        .fill(Color.red)
//        .frame(width: 130, height: 170)
//
//    Rectangle()
//        .fill(Color.red)
//        .frame(width: 130, height: 170)
//
//    Rectangle()
//        .fill(Color.red)
//        .frame(width: 130, height: 170)
//
//}
