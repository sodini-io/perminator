//
//  PerminatorApp.swift
//  Perminator
//
//  Created by James Sodini on 7/15/25.
//

import SwiftUI

@main
struct PerminatorApp: App {
    @Environment(\.openWindow) private var openWindow

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentSize)
        .commands {
            CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                Button {
                    openWindow(id: "about")
                } label: {
                    Text(LocalizedStringKey("About Perminator"))
                }
            }
        }
        
        Window(LocalizedStringKey("About Perminator"), id: "about") {
            AboutView()
                .containerBackground(.regularMaterial, for: .window)
                .toolbar(removing: .title)
                .toolbarBackground(.hidden, for: .windowToolbar)
                .windowMinimizeBehavior(.disabled)
        }
        .windowBackgroundDragBehavior(.enabled)
        .windowResizability(.contentSize)
    }
}
