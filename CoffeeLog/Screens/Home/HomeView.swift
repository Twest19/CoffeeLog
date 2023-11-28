//
//  ContentView.swift
//  CoffeeLog
//
//  Created by Tim West on 8/31/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Divider()
                    // Header: Horizontal scroll shelf
                    HStack(spacing: 20) {
                        CoffeeStatView(number: "23", title: "Streak")
                        CoffeeStatView(number: "23", title: "Streak")
                        CoffeeStatView(number: "23", title: "Streak")
                    }
                    Divider()
                    // Calendar
                    CalendarView(dateInterval: DateInterval(start: .distantPast, end: .distantFuture))
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
