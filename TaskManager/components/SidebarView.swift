//
//  SidebarView.swift
//  TaskManager
//
//  Created by Vinicius Paldês on 18/01/24.
//
import SwiftUI

struct SidebarView: View {
    var tasks: [Task]
    var body: some View {
        List {
            NavigationLink(destination: TaskListView(tasks: tasks)) {
                Label("Tasks", systemImage: "list.bullet")
            }
            NavigationLink(destination: CategoriesView()) {
                Label("Categories", systemImage: "square.grid.2x2")
            }
            NavigationLink(destination: SettingsView()) {
                Label("Settings", systemImage: "gear")
            }
        }
        .listStyle(SidebarListStyle())
        .frame(width: 250)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(tasks: [
            Task(name: "Task 1", deadline: Date()),
            Task(name: "Task 2", deadline: Date()),
            Task(name: "Task 3", deadline: Date())
        ])
    }
}
