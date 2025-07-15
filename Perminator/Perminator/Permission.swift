//
//  Permission.swift
//  Perminator
//
//  Created by James Sodini on 7/15/25.
//

import Foundation

protocol OctalRepresentable {
    var octal: Int { get }
}

struct Permission: OctalRepresentable {
    var read: Bool
    var write: Bool
    var execute: Bool

    init(octal: Int) {
        self.read = (octal & 4) != 0
        self.write = (octal & 2) != 0
        self.execute = (octal & 1) != 0
    }

    init(read: Bool, write: Bool, execute: Bool) {
        self.read = read
        self.write = write
        self.execute = execute
    }
    
    var octal: Int {
        (read ? 4 : 0) + (write ? 2 : 0) + (execute ? 1 : 0)
    }
}

struct Special: OctalRepresentable {
    var stickyBit: Bool
    var setGid: Bool
    var setUid: Bool
    
    init(octal: Int) {
        self.setUid = (octal & 4) != 0
        self.setGid = (octal & 2) != 0
        self.stickyBit = (octal & 1) != 0
    }

    init(setUid: Bool, setGid: Bool, stickyBit: Bool) {
        self.stickyBit = stickyBit
        self.setGid = setGid
        self.setUid = setUid
    }

    var octal: Int {
        (setUid ? 4 : 0) + (setGid ? 2 : 0) + (stickyBit ? 1 : 0)
    }
}

class Metadata: OctalRepresentable, ObservableObject {
    @Published var special: Special
    @Published var owner: Permission
    @Published var group: Permission
    @Published var others: Permission
    
    init(octal: Int) {
        (special, owner, group, others) = Metadata.parse(octal)
    }
    
    func update(octal: Int) {
        (special, owner, group, others) = Metadata.parse(octal)
    }

    var octal: Int {
        (special.octal * 1000) +
        (owner.octal * 100) +
        (group.octal * 10) +
        others.octal
    }

    private static func parse(_ octal: Int) -> (Special, Permission, Permission, Permission) {
        let special = Special(octal: (octal / 1000) % 10)
        let owner = Permission(octal: (octal / 100) % 10)
        let group = Permission(octal: (octal / 10) % 10)
        let others = Permission(octal: octal % 10)

        return (special, owner, group, others)
    }
}
