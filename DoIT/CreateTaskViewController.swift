//
//  CreateTaskViewController.swift
//  DoIT
//
//  Created by Kevin Schwarz on 25.02.18.
//  Copyright © 2018 KSARC. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var prevViewController = TaskViewController()
    
    @IBOutlet weak var CTNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTapped(_ sender: Any) {
        
        let task = Task()
        task.name = CTNameField.text!
        task.important = importantSwitch.isOn
        
        prevViewController.tasks.append(task)
        prevViewController.tableViewCT.reloadData()
        
    }
 
}
