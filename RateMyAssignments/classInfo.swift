//
//  classInfo.swift
//  RateMyAssignments
//
//  Created by Keith Ecker on 2/15/19.
//  Copyright © 2019 Keith Ecker. All rights reserved.
//

import Foundation
//This is the model file for classes

struct classInfo {
    var className: String
    var teacherName: String
    var grade: String
    var assignments: [Assignment]
    
    func calculateGPA() -> Double{
        var gradePointTotal = 0.0
        for assignment in assignments{
            var gradePoint = 0.0
            switch assignment.assignmentGrade{
            case "A":
                gradePoint = 4.0
            case "A-":
                gradePoint = 3.75
            case "B+":
                gradePoint = 3.25
            case "B":
                gradePoint = 3.0
            case "B-":
                gradePoint = 2.75
            case "C":
                gradePoint = 2.0
            case "D":
                gradePoint = 1.0
            case "F":
                gradePoint = 0.0
            default:
                //TODO: throw error, not grade
                break
            }
            gradePointTotal += gradePoint
        }
        return gradePointTotal / Double(assignments.count)
    }
    static func loadClasses()->[classInfo]{
        let assignment1 = Assignment(assignmentName: "HW1", assignmentGrade: "B")
        let assignment2 = Assignment(assignmentName: "Exercise 1", assignmentGrade: "B+")
        let assignment3 = Assignment(assignmentName: "Reading 1", assignmentGrade: "C")
        let assignment4 = Assignment(assignmentName: "Paper1", assignmentGrade: "F")
        
        let class1 = classInfo(className: "Linear Algebra", teacherName: "James Ungaretti", grade: "-", assignments: [assignment1])
        let class2 = classInfo(className: "Software Engineering", teacherName: "John Jacobson", grade: "-", assignments: [assignment2])
        let class3 = classInfo(className: "Literature", teacherName: "Jimmy John", grade: "-", assignments: [assignment3, assignment4])
        
        return [class1, class2, class3]
    
    }
}

