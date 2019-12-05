//
//  MatchRule.swift
//  TM-Tokenizer
//
//  Created by Matthew Davidson on 26/11/19.
//  Copyright © 2019 Matt Davidson. All rights reserved.
//

import Foundation

public class MatchRule: Rule, Pattern {
    var name: String
    var match: String
    var captures: [String]
    
    public init(
        name: String,
        match: String,
        captures: [String] = []
    ) {
        self.name = name
        self.match = match
        self.captures = captures
    }
    
    public func resolve(grammar: Grammar) -> [Rule] {
        return [self]
    }
}
