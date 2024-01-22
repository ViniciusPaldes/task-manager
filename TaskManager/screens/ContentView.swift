//
//  ContentView.swift
//  TaskManager
//
//  Created by Vinicius Paldês on 18/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSidebar: Bool = false
    @State private var dragOffset: CGFloat = 0
    @State private var showingTaskForm: Bool = false
    @State private var tasks: [Task] = [ Task(name: "Task 1", deadline: Date()),
                                         Task(name: "Task 2", deadline: Date()),
                                         Task(name: "Task 4", deadline: Date())]
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView() {
                    TaskListView(tasks: tasks)
                        .tabItem {
                            Label("Tasks", systemImage: "list.dash")
                        }
                    CategoriesView()
                        .tabItem {
                            Label("Categories", systemImage: "square.grid.2x2")
                        }
                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
                }
                if showSidebar || dragOffset > 0 {
                    Color.black.opacity(0.4).edgesIgnoringSafeArea(.all).onTapGesture {
                        withAnimation {
                            showSidebar = false
                        }
                    }
                }
                
                SidebarView(tasks: tasks)
                    .frame(width: 250)
                    .offset(x: showSidebar ? -75 : -295)
                    .offset(x: dragOffset)
                    .offset(y: 90)
                    .edgesIgnoringSafeArea(.all)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                if gesture.translation.width > 0 {
                                   self.dragOffset = min(gesture.translation.width, 220)
                                }
                            }
                            .onEnded { gesture in
                                if gesture.translation.width > 100 {
                                    self.showSidebar = true
                                } else {
                                    withAnimation {
                                        self.showSidebar = false
                                    }
                                }
                                self.dragOffset = 0
                            }
                    )
            }
            .navigationBarTitle("Task Manager", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    showSidebar.toggle()
                }
                }) {
                    Image(systemName: showSidebar || dragOffset > 0 ? "xmark.circle.fill" : "line.horizontal.3")
                    .imageScale(.large)
                })
            .navigationBarItems(trailing: Button(action: {
                showingTaskForm = true
                })
                {
                    Image(systemName: "plus.app")
                }).sheet(isPresented: $showingTaskForm) {
                    TaskFormView(isPresented: $showingTaskForm, addTask: { newTask in
                        tasks.append(newTask)
                    })
                }
        }
        .modifier(NavigationBarModifier(backgroundColor: UIColor.systemBackground))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
