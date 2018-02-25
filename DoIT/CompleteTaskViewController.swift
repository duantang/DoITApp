//
//  CompleteTaskViewController.swift
//  DoIT
//
//  Created by Kevin Schwarz on 25.02.18.
//  Copyright © 2018 KSARC. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

var task = Task()
    @IBOutlet weak var completeTaskLabel: UILabel!
    
    var prevViewController = TaskViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if task.important {
            completeTaskLabel.text = "❗️ \(task.name)"
            
        } else {
            completeTaskLabel.text = task.name
        }
        
    }

    @IBAction func completeTapped(_ sender: Any) {
        prevViewController.tasks.remove(at: prevViewController.selectedIndex)
        prevViewController.tableViewCT.reloadData()
        navigationController?.popViewController(animated: true)
    
        
    }
}
