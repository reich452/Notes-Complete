//
//  NoteTableViewController.swift
//  notePractice4
//
//  Created by Nick Reichard on 2/11/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
 
    
    // MARK: - Live Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }


    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return NoteController.sharedController.notes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        let note = NoteController.sharedController.notes[indexPath.row]
        cell.textLabel?.text = note.name
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let note = NoteController.sharedController.notes[indexPath.row]
            NoteController.sharedController.remove(name: note)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNoteTVC" {
            // What - a note 
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let note = NoteController.sharedController.notes[indexPath.row]
                
                let noteTVC = segue.destination as? NoteDetailViewController
                
                noteTVC?.note = note
            }
        }
    }
    
    
    
    // MARK: --- Edit Button
    
    
    @IBAction func editButtonTapped(_ sender: Any) {
        self.isEditing = !self.isEditing
        
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = NoteController.sharedController.notes[sourceIndexPath.row]
        NoteController.sharedController.notes.remove(at: sourceIndexPath.row)
        NoteController.sharedController.notes.insert(movedObject, at: destinationIndexPath.row)
        
        
    }
    
}







