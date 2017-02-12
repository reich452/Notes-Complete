//
//  note.swift
//  notePractice4
//
//  Created by Nick Reichard on 2/11/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private let nameKey = "nameKey"
    
    var name: String
    
    init(name: String) {
        
        self.name = name
    
    }
    
     // Create a dictionary so UD can read it and store it
    
    var dictionaryRepresenation: [String:String] {
        let dictionary = [nameKey:name]
        return dictionary
    }
    
    init?(dictionary: [String: String]) {
        guard let name = dictionary[nameKey] else { return nil }
        
        self.name = name
    }

}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs === rhs 
}
