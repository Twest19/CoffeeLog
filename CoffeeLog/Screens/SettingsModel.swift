//
//  SettingsModel.swift
//  CoffeeLog
//
//  Created by Tim West on 9/17/23.
//

import SwiftUI

final class Settings: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false {
        didSet {
            objectWillChange.send()
        }
    }
}
