//
//  CompleteTaskViewController.swift
//  DoIT
//
//  Created by Kevin Schwarz on 25.02.18.
//  Copyright © 2018 KSARC. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var completeTaskLabel: UILabel!
     var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if task!.important {
            completeTaskLabel.text = "❗️ \(task!.name!)"
        } else {
            completeTaskLabel.text = task!.name!
        }
        
    }
    
    @IBAction func completeTapped(_ sender: Any) {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
       
    }
}
