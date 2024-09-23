//
//  SpellsViewController.swift
//  dnd
//
//  Created by Trevor Sutherland on 9/22/24.
//

import UIKit

class SpellsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    
    var spellsManager = SpellsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
    }
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "type something..."
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let dndClass = searchTextField.text {
            print(spellsManager.fetchSpellsByClass(dndClassName: dndClass))
        }
        searchTextField.text = ""
    }
}

