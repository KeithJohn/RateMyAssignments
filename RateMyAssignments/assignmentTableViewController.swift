//
//  assignmentTableViewController.swift
//  RateMyAssignments
//
//  Created by Keith Ecker on 2/15/19.
//  Copyright © 2019 Keith Ecker. All rights reserved.
//

import Foundation
import UIKit
var testAssignment = Assignment(assignmentName: "Test Assignment", assignmentGrade: "A")
class assignmentTableViewController: UITableViewController {
    
    var assignments:[Assignment] = [testAssignment]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AssignmentCell") as? assignmentTableViewCell else{
            fatalError("Could not dequeue a cell")
        }
        let assignment = assignments[indexPath.row]
        cell.assignmentName.text = assignment.assignmentName
        cell.gradeLabel.text = assignment .assignmentGrade
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAssignmentDetails"{
            let AssignmentDetailTableViewController = segue.destination as! AssignmentDetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedAssignment = assignments[indexPath.row]
            AssignmentDetailTableViewController.assignment = selectedAssignment
        }
    }
}
