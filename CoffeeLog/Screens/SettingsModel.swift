//
//  SettingsModel.swift
//  CoffeeLog
//
//  Created by Tim West on 9/17/23.
//

import SwiftUI

final class Settings: ObservableObject {
    
    @AppStorage("systemThemeVal") var systemTheme: Int = SchemeType.allCases.first!.rawValue
 
}
