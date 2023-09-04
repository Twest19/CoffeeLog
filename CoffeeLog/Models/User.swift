//
//  User.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import Foundation


struct User: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let joined: TimeInterval
}
