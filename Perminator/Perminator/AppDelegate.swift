//
//  AppDelegate.swift
//  Perminator
//
//  Created by James Sodini on 7/22/25.
//

import AppKit


class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        if let mainMenu = NSApp.mainMenu,
           let helpMenu = mainMenu.items.first(where: { $0.title == "Help" })?.submenu,
           let helpItem = helpMenu.items.first(where: { $0.title.contains("Perminator Help") }) {
            helpItem.target = self
            helpItem.action = #selector(openHelpSite)
        }
    }

    @objc func openHelpSite() {
        if let url = URL(string: "https://perminator.sodini.io") {
            NSWorkspace.shared.open(url)
        }
    }
}
