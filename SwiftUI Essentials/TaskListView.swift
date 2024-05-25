//
//  TaskListView.swift
//  SwiftUI Essentials
//
//  Created by Luka Gujejiani on 24.05.24.
//
import SwiftUI

// MARK: - Sections
struct TaskListView: View {
    @EnvironmentObject var taskData: TaskData
    @State private var animateChange = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Completed Tasks")
                    .font(.headline)
                    .padding(.leading)

                LazyVStack(spacing: 10) {
                    ForEach(completedTasks) { task in
                        TaskRow(task: binding(for: task), animateChange: $animateChange)
                            .padding(.horizontal)
                    }
                }

                Text("Incomplete Tasks")
                    .font(.headline)
                    .padding(.leading)
                    .padding(.top)

                LazyVStack(spacing: 10) {
                    ForEach(incompleteTasks) { task in
                        TaskRow(task: binding(for: task), animateChange: $animateChange)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
        }
    }

    private var completedTasks: [Task] {
        taskData.tasks.filter { $0.isCompleted }
    }

    private var incompleteTasks: [Task] {
        taskData.tasks.filter { !$0.isCompleted }
    }

    private func binding(for task: Task) -> Binding<Task> {
        guard let index = taskData.tasks.firstIndex(where: { $0.id == task.id }) else {
            fatalError("Task not found")
        }
        return $taskData.tasks[index]
    }
}

// MARK: - Rows
struct TaskRow: View {
    @Binding var task: Task
    @Binding var animateChange: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.description)
                    .font(.headline)

                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(Color(UIColor.label))
                    Text("\(task.date) Oct")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.leading)

            Spacer()

            Button {
                withAnimation {
                    task.isCompleted.toggle()
                    animateChange.toggle()
                }
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 26, height: 26)
            }
            .padding(.trailing)
        }
        .frame(height: 80)
        .background(Color(UIColor.secondarySystemBackground))
        .overlay(
            RoundedRectangle(cornerRadius: 10).fill(task.color).mask(
                HStack {
                    Rectangle().frame(width: 10)
                    Spacer()
                }
            )
            .allowsHitTesting(false))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    TaskListView()
        .environmentObject(TaskData())
}
