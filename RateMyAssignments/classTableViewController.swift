//
//  classTableViewController.swift
//  RateMyAssignments
//
//  Created by Keith Ecker on 2/15/19.
//  Copyright © 2019 Keith Ecker. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class classTableViewController: UITableViewController{
    var classes = [classInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        classes = classInfo.loadClasses()
//        var class1 = classInfo(
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell") as? classTableViewCell else{
            fatalError("Could not dqueue a cell")
        }
        let classInfo = classes[indexPath.row]
        cell.gradeLabel.text = String(classInfo.calculateGPA())
        cell.classNameLabel.text = classInfo.className
        cell.teacherNameLabel.text = classInfo.teacherName
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAssignments"{
            let assignmentTableViewController = segue.destination as! assignmentTableViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedClass = classes[indexPath.row]
            assignmentTableViewController.assignments = selectedClass.assignments
        }
}
    @IBAction func logoutButtonTapped(_ sender: Any) {
        try! Auth.auth().signOut()
            self.performSegue(withIdentifier: "returnToMenu", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}
