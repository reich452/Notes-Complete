//
//  noteControlelr.swift
//  notePractice4
//
//  Created by Nick Reichard on 2/11/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
// CRUD
// Singelton

import Foundation

class NoteController {
    
    static let sharedController = NoteController()
    
    var notes: [Note] = []
    
    private let noteDictionaryArrayKey = "noteDictionaryArrayKey"
    
    init() {
        loadToPersistentStore()
    }
    
    
    // MARK: - Create
    
    func addNoteWith(name: String) {
        // Create a note
        let note = Note(name: name)
        
        // Add the note to the notes array
        
        notes.append(note)
        saveToPersistentStore()
    }
    
    // MARK: - Read
    
    // MARK: - Update
    
    // MARK: - Delete
    
    func remove(name: Note) {
        guard let index = notes.index(of: name) else {
            return
        }
        notes.remove(at: index)
        
        saveToPersistentStore()
    }
    
    
    
    
    // MARK: - Save
    
    // The goal is to take our notes Array and save them to User Defaults. We must convert the notes inot something that UD can store (Simple types) // Put all the soups into containers then into one big container // will load saved dictionary notes from UserDefaults and set notes to the results
    
    
    
    func saveToPersistentStore() {
        var noteDictionaries: [[String:String]] = []
        
        for note in notes {
            let noteDictionary = note.dictionaryRepresenation
            
            noteDictionaries.append(noteDictionary)
            
        }
        
        UserDefaults.standard.set(noteDictionaries, forKey: noteDictionaryArrayKey)
        
    }
    
    
    
    // The goal is to get our note dictionaries out of UserDefaults, tun them back into instances of the Note Class, and set the note array with the load. Grabing the big container and placing the soups on the table
    
    
    func loadToPersistentStore() {
        if let noteDictionaries = UserDefaults.standard.object(forKey: noteDictionaryArrayKey) as? [[String:String]] {
            
            var notes: [Note] = []
            
            for noteDictionary in noteDictionaries {
                if let note = Note(dictionary: noteDictionary) {
                    notes.append(note)
                }
            }
            
            self.notes = notes
            
        }
    }
    
}

