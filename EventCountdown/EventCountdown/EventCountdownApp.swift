//
//  EventCountdownApp.swift
//  EventCountdown
//
//  Created by Lucy Huang on 31/05/2025.
//

import SwiftUI

@main
struct CountdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TimerLogic())
        }
        .modelContainer(for: Item.self, inMemory: false)
    }
}
