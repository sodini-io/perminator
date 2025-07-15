//
//  ContentView.swift
//  Perminator
//
//  Created by James Sodini on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    // Original Chmod Permissions
    @StateObject var metadata = Metadata(octal: 0)
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
                GroupBox(label: Text("Special")) {
                    VStack(alignment: .leading) {
                        Toggle("setuid", isOn: $metadata.special.setUid)
                            .onChange(of: metadata.special.setUid) { _, _ in calculate() }
                        Toggle("setgid", isOn: $metadata.special.setGid)
                            .onChange(of: metadata.special.setGid) { _, _ in calculate() }
                        Toggle("Sticky", isOn: $metadata.special.stickyBit)
                            .onChange(of: metadata.special.stickyBit) { _, _ in calculate() }
                    }.padding()
                }
                GroupBox(label: Text("Owner")) {
                    VStack(alignment: .leading) {
                        Toggle("Read", isOn: $metadata.owner.read)
                            .onChange(of: metadata.owner.read) { _, _ in calculate() }
                        Toggle("Write", isOn: $metadata.owner.write)
                            .onChange(of: metadata.owner.write) { _, _ in calculate() }
                        Toggle("Execute", isOn: $metadata.owner.execute)
                            .onChange(of: metadata.owner.execute) { _, _ in calculate() }
                    }.padding()
                }
                GroupBox(label: Text("Group")) {
                    VStack(alignment: .leading) {
                        Toggle("Read", isOn: $metadata.group.read)
                            .onChange(of: metadata.group.read) { _, _ in calculate() }
                        Toggle("Write", isOn: $metadata.group.write)
                            .onChange(of: metadata.group.write) { _, _ in calculate() }
                        Toggle("Execute", isOn: $metadata.group.execute)
                            .onChange(of: metadata.group.execute) { _, _ in calculate() }
                    }.padding()
                }
                GroupBox(label: Text("Others")) {
                    VStack(alignment: .leading) {
                        Toggle("Read", isOn: $metadata.others.read)
                            .onChange(of: metadata.others.read) { _, _ in calculate() }
                        Toggle("Write", isOn: $metadata.others.write)
                            .onChange(of: metadata.others.write) { _, _ in calculate() }
                        Toggle("Execute", isOn: $metadata.others.execute)
                            .onChange(of: metadata.others.execute) { _, _ in calculate() }
                    }.padding()
                }
            }
            HStack {
                Button("Copy") {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(chmodValue, forType: .string)
                }
                Spacer().frame(width: 350)
                TextField("0000", text: $chmodValue).frame(width: 50).multilineTextAlignment(.trailing)
            }.padding(.horizontal, 20)
        }
    }
    
    func calculate() -> Void {
        chmodValue = String(format: "%04d", metadata.octal)
    }
    
}

#Preview {
    ContentView()
}
