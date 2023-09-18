//
//  CoffeeLogApp.swift
//  CoffeeLog
//
//  Created by Tim West on 8/31/23.
//

import SwiftUI

@main
struct CoffeeLogApp: App {
    
    @StateObject var settings = Settings()
    
    var body: some Scene {
        WindowGroup {
            CLTabView()
                .environmentObject(settings)
                .preferredColorScheme(settings.isDarkMode ? .dark : .light)
        }
    }
}
