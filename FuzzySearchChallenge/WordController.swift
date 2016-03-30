//
//  WordController.swift
//  FuzzySearchChallenge
//
//  Created by Parker Donat on 3/30/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class WordController {
    
    static var words: [Word] = []
    
    static func createWordList() {
        let filePath = "/Code/DevMountain Projects/Swift/Stretch Problems/FuzzySearchChallenge/FuzzySearchChallenge/dictionary.json"
        
        guard let data = NSData(contentsOfFile: filePath) else {return}
        guard let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) else {return}
        if let jsonDictionary = json as? [String: String] {
            var words: [Word] = []
            for (word, definition) in jsonDictionary {
                let word = Word(word: word, definition: definition)
                words.append(word)
            }
            WordController.words = words.sort{$0.word < $1.word}
        }
    }
}