//
//  ContentView.swift
//  SwiftUI Essentials
//
//  Created by Luka Gujejiani on 23.05.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var taskData: TaskData
    
    private var totalTasks: Int {
        taskData.tasks.count
    }
    
    private var completedTasks: Int {
        taskData.tasks.filter { $0.isCompleted }.count
    }
    
    private var progress: Double {
        totalTasks == 0 ? 0 : Double(completedTasks) / Double(totalTasks)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("You have \(totalTasks - completedTasks)\ntasks to complete")
                    .font(.system(size: 25))
                    .bold()
                    .frame(width: 300, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.leading)
                
                Spacer()
                
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                        .background(Circle().fill(Color.blue))
                        .overlay(
                            Circle().stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [.blue, .purple, .pink]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                        )

                    if totalTasks - completedTasks > 0 {
                        Text("\(totalTasks - completedTasks)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.orange)
                            .clipShape(Circle())
                            .offset(x: 0, y: 35)
                    }
                }
                .padding(.trailing)
            }
            .padding(.top, 10)
            
            Button("Complete All") {
                taskData.tasks.indices.forEach { index in
                    taskData.tasks[index].isCompleted = true
                }
            }
            .foregroundColor(.white)
            .font(.system(size: 18))
            .bold()
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .cyan]),
                    startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(10)
            .padding(.horizontal)
            
            ScrollView {
                ProgressBar()
                    .environmentObject(taskData)
                    .frame(height: 139)
                
                TaskListView()
                    .padding(.top)
            }
        }
    }
}



#Preview {
    ContentView()
        .environmentObject(TaskData())
}
