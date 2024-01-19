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
    var body: some View {
        NavigationView {
            ZStack {
                TabView() {
                    TaskListView()
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
                
                SidebarView()
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
        }
        .modifier(NavigationBarModifier(backgroundColor: UIColor.systemBackground))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
