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

    var body: some View {
        Spacer()
        VStack {
            HStack {
                GroupBox(label: Text(LocalizedStringKey("section.special"))) {
                    VStack(alignment: .leading) {
                        Toggle(LocalizedStringKey("toggle.setuid"), isOn: $metadata.special.setUid)
                            .help(LocalizedStringKey("help.setuid"))
                            .onChange(of: metadata.special.setUid) { _, _ in calculate() }
                        Toggle(LocalizedStringKey("toggle.setgid"), isOn: $metadata.special.setGid)
                            .help(LocalizedStringKey("help.setgid"))
                            .onChange(of: metadata.special.setGid) { _, _ in calculate() }
                        Toggle(LocalizedStringKey("toggle.sticky"), isOn: $metadata.special.stickyBit)
                            .help(LocalizedStringKey("help.stickybit"))
                            .onChange(of: metadata.special.stickyBit) { _, _ in calculate() }
                    }.padding()
                }.padding(.trailing)
                GroupBox(label: Text(LocalizedStringKey("section.owner"))) {
                    VStack(alignment: .leading) {
                        Toggle(LocalizedStringKey("permission.read"), isOn: $metadata.owner.read)
                            .onChange(of: metadata.owner.read) { _, _ in calculate() }
                        Toggle(LocalizedStringKey("permission.write"), isOn: $metadata.owner.write)
                            .onChange(of: metadata.owner.write) { _, _ in calculate() }
                        Toggle(LocalizedStringKey("permission.execute"), isOn: $metadata.owner.execute)
                            .onChange(of: metadata.owner.execute) { _, _ in calculate() }
                    }.padding()
                }.padding(.trailing)
                GroupBox(label: Text(LocalizedStringKey("section.group"))) {
                    VStack(alignment: .leading) {
                        Toggle(LocalizedStringKey("permission.read"), isOn: $metadata.group.read)
                            .onChange(of: metadata.group.read) { _, _ in calculate() }
                        Toggle(LocalizedStringKey("permission.write"), isOn: $metadata.group.write)
                            .onChange(of: metadata.group.write) { _, _ in calculate() }
                        Toggle(LocalizedStringKey("permission.execute"), isOn: $metadata.group.execute)
                            .onChange(of: metadata.group.execute) { _, _ in calculate() }
                    }.padding()
                }.padding(.trailing)
                GroupBox(label: Text(LocalizedStringKey("section.others"))) {
                    VStack(alignment: .leading) {
                        Toggle(LocalizedStringKey("permission.read"), isOn: $metadata.others.read)
                            .onChange(of: metadata.others.read) { _, _ in calculate() }
                        Toggle(LocalizedStringKey("permission.write"), isOn: $metadata.others.write)
                            .onChange(of: metadata.others.write) { _, _ in calculate() }
                        Toggle(LocalizedStringKey("permission.execute"), isOn: $metadata.others.execute)
                            .onChange(of: metadata.others.execute) { _, _ in calculate() }
                    }.padding()
                }.padding(.trailing)
            }
            HStack {
                Button(LocalizedStringKey("button.copy")) {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(chmodValue, forType: .string)
                }
                Spacer()
                Spacer()
                TextField("0000", text: $chmodValue)
                    .frame(width: 50)
                    .multilineTextAlignment(.trailing)
                    .onSubmit {
                        if let octalInt = Int(chmodValue) {
                            metadata.update(octal: octalInt)
                        } else {
                            print("Bad chmod value")
                        }
                    }
                    .padding(.trailing)
            }.padding()
        }
    }
    
    func calculate() -> Void {
        chmodValue = String(format: "%04d", metadata.octal)
    }
    
}

#Preview {
    ContentView()
}
