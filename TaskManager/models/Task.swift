//
//  Task.swift
//  TaskManager
//
//  Created by Vinicius Paldês on 19/01/24.
//
import Foundation

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var deadline: Date
}
