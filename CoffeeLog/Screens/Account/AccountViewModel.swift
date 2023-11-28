//
//  AccountViewModel.swift
//  CoffeeLog
//
//  Created by Tim West on 9/17/23.
//

import Foundation

final class AccountViewModel: ObservableObject {
    @Published var isShowingTerms = false
    @Published var isShowingPolicy = false
    
    @Published final var policyURL: URL = (URL(string: "https://www.apple.com/") ?? URL(string: "https://www.apple.com/")!)
    @Published final var termURL: URL = (URL(string: "https://www.apple.com/") ?? URL(string: "https://www.apple.com/")!)
}
