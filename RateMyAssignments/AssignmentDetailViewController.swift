//
//  AssignmentDetailViewController.swift
//  RateMyAssignments
//
//  Created by Keith Ecker on 2/18/19.
//  Copyright © 2019 Keith Ecker. All rights reserved.
//

import Foundation
import UIKit

class AssignmentDetailViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var assignmentNameLabel: UILabel!
    @IBOutlet weak var assignmentGradePicker: UIPickerView!
    
    var assignment:Assignment = Assignment(assignmentName:"test", assignmentGrade:"A")
    var pickerData = ["A", "A-", "B+", "B", "B-", "C", "D", "F"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignmentGradePicker.delegate = self
        assignmentGradePicker.dataSource = self
        var grade:Int
        switch assignment.assignmentGrade{
        case "A":
            grade = 0
        case "A-":
            grade = 1
        case "B+":
            grade = 2
        case "B":
            grade = 3
        case "B-":
            grade = 4
        case "C":
            grade = 5
        case "D":
            grade = 6
        case "F":
            grade = 7
        default:
            grade = 0
        }
        assignmentGradePicker.selectRow(grade, inComponent: 0, animated: true)
        assignmentNameLabel.text = assignment.assignmentName
        //assignmentGradePicker.
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    @IBAction func saveAndDismiss(_ sender: Any) {
        //TODO: update on database
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
}
