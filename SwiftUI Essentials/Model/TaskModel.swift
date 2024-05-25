//
//  TaskModel.swift
//  SwiftUI Essentials
//
//  Created by Luka Gujejiani on 24.05.24.
//

import SwiftUI
//import Combine

let initialTasks: [Task] = [
    Task(description: "Mobile App Research", date: 14, isCompleted: true, color: Color(#colorLiteral(red: 0.9803921569, green: 0.7960784314, blue: 0.7294117647, alpha: 1))),
    Task(description: "Prepare Wireframe for Main Flow", date: 12, isCompleted: true, color: Color(#colorLiteral(red: 0.9803921569, green: 0.8509803922, blue: 1, alpha: 1))),
    Task(description: "Prepare Screens", date: 14, isCompleted: true, color: Color(#colorLiteral(red: 0.8431372549, green: 0.9411764706, blue: 1, alpha: 1))),
    Task(description: "Website Research", date: 14, isCompleted: false, color: Color(#colorLiteral(red: 0.9803921569, green: 0.7960784314, blue: 0.7294117647, alpha: 1))),
    Task(description: "Prepare Wireframe for Main Flow", date: 14, isCompleted: false, color: Color(#colorLiteral(red: 0.9803921569, green: 0.8509803922, blue: 1, alpha: 1))),
    Task(description: "Prepare Screens", date: 14, isCompleted: false, color: Color(#colorLiteral(red: 0.8431372549, green: 0.9411764706, blue: 1, alpha: 1))),
    Task(description: "Design Logo", date: 15, isCompleted: false, color: Color(#colorLiteral(red: 0.9803921569, green: 0.7960784314, blue: 0.7294117647, alpha: 1))),
    Task(description: "Create Marketing Plan", date: 15, isCompleted: false, color: Color(#colorLiteral(red: 0.9803921569, green: 0.8509803922, blue: 1, alpha: 1))),
    Task(description: "Research Competitors", date: 15, isCompleted: true, color: Color(#colorLiteral(red: 0.8431372549, green: 0.9411764706, blue: 1, alpha: 1))),
    Task(description: "Develop Landing Page", date: 14, isCompleted: false, color: Color(#colorLiteral(red: 0.9803921569, green: 0.7960784314, blue: 0.7294117647, alpha: 1))),
    Task(description: "Set Up Analytics", date: 15, isCompleted: false, color: Color(#colorLiteral(red: 0.9803921569, green: 0.8509803922, blue: 1, alpha: 1))),
    Task(description: "Plan Social Media Campaign", date: 15, isCompleted: false, color: Color(#colorLiteral(red: 0.8431372549, green: 0.9411764706, blue: 1, alpha: 1))),
    Task(description: "Write Blog Post", date: 15, isCompleted: false, color: Color(#colorLiteral(red: 0.9803921569, green: 0.7960784314, blue: 0.7294117647, alpha: 1))),
    Task(description: "Update Privacy Policy", date: 15, isCompleted: false, color: Color(#colorLiteral(red: 0.9803921569, green: 0.8509803922, blue: 1, alpha: 1))),
    Task(description: "Refactor Codebase", date: 15, isCompleted: true, color: Color(#colorLiteral(red: 0.8431372549, green: 0.9411764706, blue: 1, alpha: 1))),
    Task(description: "Optimize Database", date: 15, isCompleted: false, color: Color(#colorLiteral(red: 0.9803921569, green: 0.7960784314, blue: 0.7294117647, alpha: 1)))
]

class TaskData: ObservableObject {
    @Published var tasks: [Task] = initialTasks
}

struct Task: Identifiable {
    var id = UUID()
    var description: String
    var date: Int
    var isCompleted: Bool
    var color: Color
}
