//
//  SwiftUI_EssentialsApp.swift
//  SwiftUI Essentials
//
//  Created by Luka Gujejiani on 23.05.24.
//

import SwiftUI

@main
struct SwiftUIEssentialsApp: App {
    @StateObject private var taskData = TaskData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskData)
        }
    }
}
