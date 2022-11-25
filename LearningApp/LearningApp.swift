//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Eric Chandonnet on 2022-11-25.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
