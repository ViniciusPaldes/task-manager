//
//  TaskListView.swift
//  TaskManager
//
//  Created by Vinicius Paldês on 18/01/24.
//

import SwiftUI

struct TaskListView: View {
    var body: some View {
        List {
            Text("Task 1")
            Text("Task 2")
            Text("Task 3")
        }.navigationTitle("Tasks")
    }
    
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
