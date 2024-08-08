//
//  TestTask1221App.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-07.
//

import SwiftUI

@main
struct TestTask1221App: App {
    
    init() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
            UserDefaults.standard.synchronize()
        }
    }
        
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
