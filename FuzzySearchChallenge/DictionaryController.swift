//
//  DictionaryController.swift
//  FuzzySearchChallenge
//
//  Created by Parker Donat on 3/30/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class DictionaryController {
    // Search 
    // Create word list
//    static func searchForWords(searchTerm: String) -> Void {
//        
//        if let filePath = NSBundle.mainBundle().pathForResource("dictionary", ofType: "json") {
//            if let jsonData = try NSData(contentsOfFile: filePath, options: .DataReadingMappedIfSafe) {
//                
//                do {
//                    let json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments)
//                    
//                    if let resultsDictionary = json as? [String: String] {
//                        if let resultsArray = resultsDictionary as? [[String: String]] {
//                            var arrayOfWords: [Dictionary] = []
//                            
//                            // Cycle through dictionaryArray, convert to Model
//                            for dictionaryWord in resultsArray {
//                                if let word = Dictionary(json: dictionaryWord) {
//                                    arrayOfWords.append(word)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
}

/*
 NSString *filePath = [[NSBundle mainBundle] pathForResource:@"THENAMEOFTHEFILE" ofType:@"EXTENSIONOFYOUTFILE"];
 
 second, load the data of file:
 
 NSData *content = [[NSData alloc] initWithContentsOfFile:filePath];
 
 third, parse the data:
 
 NSDictionary *json = [NSJSONSerialization JSONObjectWithData:content options:kNilOptions error:nil];
 */