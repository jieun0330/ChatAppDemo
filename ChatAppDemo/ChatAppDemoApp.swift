//
//  ChatAppDemoApp.swift
//  ChatAppDemo
//
//  Created by 박지은 on 2023/07/15.
//

import SwiftUI
import Firebase

@main
struct ChatAppDemoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
