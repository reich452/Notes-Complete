//
//  NoteDetailViewController.swift
//  notePractice4
//
//  Created by Nick Reichard on 2/11/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    @IBOutlet weak var noteTextView: UITextView!
    
    var note: Note?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let note = note {
            upDateWith(note: note)
        }
    }
    
  
    
    func upDateWith(note: Note) {
        self.noteTextView.text = note.name
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        // Capture the text from the TextView value 
        
        guard let capturedText = noteTextView.text, !capturedText.isEmpty else { return }
        
        NoteController.sharedController.addNoteWith(name: capturedText)
        
        
        _ = self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        self.noteTextView.text = ""
    }
    

}
