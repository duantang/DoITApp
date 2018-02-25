//
//  CreateTaskViewController.swift
//  DoIT
//
//  Created by Kevin Schwarz on 25.02.18.
//  Copyright © 2018 KSARC. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var CTNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.CTNameField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CTNameField.resignFirstResponder()
        return true
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        if CTNameField != nil {
            task.name = CTNameField.text!
            task.important = importantSwitch.isOn
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}
