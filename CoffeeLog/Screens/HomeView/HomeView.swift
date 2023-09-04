//
//  ContentView.swift
//  CoffeeLog
//
//  Created by Tim West on 8/31/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Divider()
                    // Header: Horizontal scroll shelf
                    ShelfView()
                    Divider()
                    // Calendar
                    CalendarView()
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Good Morning Tim ☕️")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
