//
//  ContentView.swift
//  Perminator
//
//  Created by James Sodini on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    // Original Chmod Permissions
    @State private var chmodValue: String = ""
    
    // Original Owner Permissions
    @State private var ownerRead = false
    @State private var ownerWrite = false
    @State private var ownerExecute = false

    // Original Group Permissions
    @State private var groupRead = false
    @State private var groupWrite = false
    @State private var groupExecute = false

    // Original Others Permissions
    @State private var othersRead = false
    @State private var othersWrite = false
    @State private var othersExecute = false

    var body: some View {
        VStack {
            HStack {
                GroupBox(label: Text("Owner")) {
                    VStack(alignment: .leading) {
                        Toggle("Read", isOn: $ownerRead)
                        Toggle("Write", isOn: $ownerWrite)
                        Toggle("Execute", isOn: $ownerExecute)
                    }.padding()
                }
                GroupBox(label: Text("Group")) {
                    VStack(alignment: .leading) {
                        Toggle("Read", isOn: $groupRead)
                        Toggle("Write", isOn: $groupWrite)
                        Toggle("Execute", isOn: $groupExecute)
                    }.padding()
                }
                GroupBox(label: Text("Others")) {
                    VStack(alignment: .leading) {
                        Toggle("Read", isOn: $othersRead)
                        Toggle("Write", isOn: $othersWrite)
                        Toggle("Execute", isOn: $othersExecute)
                    }.padding()
                }
            }
            HStack {
                Button("Copy") {
                    // Copy to clipboard here.
                }
                Spacer().frame(width: 250)
                TextField("0000", text: $chmodValue).frame(width: 50)
            }
        }
        .padding()
    }
    
    func calculateOctet(read: Bool, write: Bool, execute: Bool) -> Int {
        (read ? 4 : 0) + (write ? 2 : 0) + (execute ? 1 : 0)
    }
}

#Preview {
    ContentView()
}
