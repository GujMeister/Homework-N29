//
//  ProgressBar.swift
//  SwiftUI Essentials
//
//  Created by Luka Gujejiani on 24.05.24.
//

import SwiftUI

struct ProgressBar: View {
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
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Daily Task")
                    .font(.headline)
                    .padding(.bottom, 2)

                Text("\(completedTasks)/\(totalTasks) Tasks Completed")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack {
                    Text("Keep working")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)

                    Spacer()

                    Text("\(Int(progress * 100))%")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 2)

                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color(UIColor.tertiarySystemBackground))
                        .frame(width: 320, height: 20)

                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.blue, .cyan]),
                            startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: progress * 320, height: 20)
                }
                .padding(.top, 5)
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(15)
            .shadow(radius: 5)
            .frame(width: geometry.size.width * 0.91, height: 139)
            .padding(.horizontal, geometry.size.width * 0.045)
            .padding(.vertical)
        }
    }
}

#Preview {
    ProgressBar()
        .environmentObject(TaskData())
}
