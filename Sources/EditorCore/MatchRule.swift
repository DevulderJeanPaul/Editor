//
//  MatchRule.swift
//
//
//  Created by Matthew Davidson on 26/11/19.
//

import Foundation

public class MatchRule: Rule, Pattern {
    
    public let id: UUID
    
    public weak var grammar: Grammar?
    
    let scopeName: ScopeName
    var match: NSRegularExpression
    var captures: [Capture]
    
    let opts:NSRegularExpression.Options = [.anchorsMatchLines, .dotMatchesLineSeparators]
    
    public init(
        name: String,
        match: String,
        options: NSRegularExpression.Options,
        captures: [Capture] = []
    ) {
        self.id = UUID()
        self.scopeName = ScopeName(rawValue: name)
        do {
            self.match = try NSRegularExpression(pattern: match, options: options)
        }
        catch {
            fatalError("Could not create regex for MatchRule with name '\(name)' due to error: \(error.localizedDescription)")
        }
        self.captures = captures
    }
    
    
    public init(
        name: String,
        match: String,
        captures: [Capture] = []
    ) {
        self.id = UUID()
        self.scopeName = ScopeName(rawValue: name)
        do {
            self.match = try NSRegularExpression(pattern: match, options: opts)
        }
        catch {
            fatalError("Could not create regex for MatchRule with name '\(name)' due to error: \(error.localizedDescription)")
        }
        self.captures = captures
    }
    
    public func resolve(parser: Parser, grammar: Grammar) -> [Rule] {
        self.grammar = grammar
        return [self]
    }
}
