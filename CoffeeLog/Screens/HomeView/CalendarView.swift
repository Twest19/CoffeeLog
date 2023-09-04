//
//  CalendarView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import SwiftUI

struct CalendarView: View {
    
    @State var date = Date()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "calendar")
                Text("Coffee Streak: 200")
                    .font(.title2)
                Spacer()
            }
            .padding(.leading)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.brandMelon)
                DatePicker("Coffee Days",
                           selection: $date,
                           in: Date()...,
                           displayedComponents: [.date])
                .tint(.brandMelon)
                .background(Color(uiColor: .systemBackground))
                .cornerRadius(10)
                .padding(5)
                .datePickerStyle(.graphical)
                
            }
            .padding([.leading, .trailing, .bottom])
            Spacer()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
