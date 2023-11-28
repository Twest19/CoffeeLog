//
//  CLTabView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/2/23.
//

import SwiftUI

struct CLTabView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject var settings: Settings

    
    private var selectedScheme: ColorScheme? {
        guard let theme = SchemeType(rawValue: settings.systemTheme) else { return nil }
        print(theme.rawValue)
        switch theme {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return nil
        }
    }
    
    let logged = false
    
    var body: some View {
        if logged {
            // Sign in
            loggedInView
        } else {
            LoginView()
                .preferredColorScheme(selectedScheme)
        }
    }
    
    @ViewBuilder
    var loggedInView: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }

        }
        .preferredColorScheme(selectedScheme)
    }
}

struct CLTabView_Previews: PreviewProvider {
    static var previews: some View {
        CLTabView().environmentObject(Settings())
    }
}
