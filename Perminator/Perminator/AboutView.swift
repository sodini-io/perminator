//
//  AboutView.swift
//  Perminator
//
//  Created by James Sodini on 7/18/25.
//

import SwiftUI

struct AboutView: View {
    private var appVersionAndBuild: String {
        let version = Bundle.main
            .infoDictionary?["CFBundleShortVersionString"] as? String ?? "N/A"
        let build = Bundle.main
            .infoDictionary?["CFBundleVersion"] as? String ?? "N/A"
        return "Version \(version) (\(build))"
    }
    
    private var copyright: String {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        return "© \(year) Sodini Systems LLC"
    }

    var body: some View {
        VStack(spacing: 14) {
            Image(nsImage: NSApplication.shared.applicationIconImage)
                .resizable().scaledToFit()
                .frame(width: 80)
            Text("Perminator")
                .font(.title)
            VStack(spacing: 6) {
                Text(appVersionAndBuild)
                Text(copyright)
            }
            .font(.callout)
            VStack{
                Link(
                    "https://paginator.sodini.io",
                    destination: URL(string: "https://paginator.sodini.io/")!
                )
                Link(
                    "james@sodini.io",
                    destination: URL(string: "mailto:james@sodini.io")!)
            }

        }
        .padding()
        .frame(minWidth: 400, minHeight: 260)
    }
}
