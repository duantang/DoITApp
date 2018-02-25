//
//  TaskViewController.swift
//  DoIT
//
//  Created by Kevin Schwarz on 18.02.18.
//  Copyright © 2018 KSARC. All rights reserved...
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewCT: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableViewCT.delegate = self
        tableViewCT.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️WICHTIG❗️ \(task.name)"
        
        } else {
            cell.textLabel?.text = task.name
        }
    
          return cell
    }
      
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Kim küssen"
        task1.important = true
        let task2 = Task()
        task2.name = "Kim knuddeln"
        task2.important = true
        let task3 = Task()
        task3.name = "Kim knutschen"
        task3.important = true
        return [task1, task2, task3]
    }
    @IBAction func addItem(_ sender: Any) {
        performSegue(withIdentifier: "newTaskSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! CreateTaskViewController
        nextViewController.prevViewController = self
    }
    
}

