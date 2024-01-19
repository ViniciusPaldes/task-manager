//
//  SidebarView.swift
//  TaskManager
//
//  Created by Vinicius Paldês on 18/01/24.
//
import SwiftUI

struct SidebarView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: TaskListView()) {
                    Label("Tasks", systemImage: "list.bullet")
                }
                NavigationLink(destination: Text("Categories Screen")) {
                    Label("Categories", systemImage: "square.grid.2x2")
                }
                NavigationLink(destination: Text("Settings Screen")) {
                    Label("Settings", systemImage: "gear")
                }
            }
            .listStyle(SidebarListStyle())
        }.frame(width: 250)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}