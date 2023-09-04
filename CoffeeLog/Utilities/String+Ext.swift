//
//  String+Ext.swift
//  CoffeeLog
//
//  Created by Tim West on 9/3/23.
//

import Foundation
import RegexBuilder

extension String {

        var isValidEmail: Bool {
            let emailRegex = Regex {
                /^/
                OneOrMore {
                    CharacterClass(
                        .anyOf("._%+-"),
                        ("A"..."Z"),
                        ("0"..."9"),
                        ("a"..."z")
                    )
                }
                "@"
                Repeat(1...2) {
                    Capture {
                        Regex {
                            OneOrMore {
                                CharacterClass(
                                    .anyOf("-"),
                                    ("A"..."Z"),
                                    ("a"..."z"),
                                    ("0"..."9")
                                )
                            }
                            "."
                        }
                    }
                }
                Repeat(2...64) {
                    CharacterClass(
                        ("A"..."Z"),
                        ("a"..."z")
                    )
                }
                /$/
            }
        return self.wholeMatch(of: emailRegex) != nil
    }
}

