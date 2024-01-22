//
//  TaskListView.swift
//  TaskManager
//
//  Created by Vinicius Paldês on 18/01/24.
//

import SwiftUI

struct TaskListView: View {
    var tasks: [Task]
    var body: some View {
        List(tasks) { task in
            Text(task.name)
        }.navigationTitle("Tasks")
    }
    
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(tasks: [
            Task(name: "Task 1", deadline: Date()),
            Task(name: "Task 2", deadline: Date()),
            Task(name: "Task 4", deadline: Date())
        ])
    }
}
