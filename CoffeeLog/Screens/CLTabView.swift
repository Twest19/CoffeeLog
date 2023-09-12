//
//  CLTabView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/2/23.
//

import SwiftUI

struct CLTabView: View {
    
    let logged = false
    
    var body: some View {
        if logged {
            // Sign in
            loggedInView
        } else {
            LoginView()
                
        }
    }
    
    @ViewBuilder
    var loggedInView: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

        }
    }
}

struct CLTabView_Previews: PreviewProvider {
    static var previews: some View {
        CLTabView()
    }
}
