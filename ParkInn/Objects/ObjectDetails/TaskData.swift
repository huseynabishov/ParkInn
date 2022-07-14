//
//  TaskData.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.07.2022.
//

import SwiftUI

struct TaskData: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// Total Task Meta View...
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [TaskData]
    var taskDate: Date
}

// sample Date for Testing...
func getSampleDate(offset: Int)->Date{
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks: [TaskMetaData] = [

    TaskMetaData(task: [
        
        TaskData(title: "something")
    ], taskDate: getSampleDate(offset: -8)),
]

