//
//  PermissionTests.swift
//  Perminator
//
//  Created by James Sodini on 7/15/25.
//


import Testing
@testable import Perminator

//
// Permission
//

struct PermissionInitFromOctalTests {

    @Test func initFromOctalSeven() throws {
        let permission = Permission(octal: 7)
        #expect(permission.read == true)
        #expect(permission.write == true)
        #expect(permission.execute == true)
        #expect(permission.octal == 7)
    }

    @Test func initFromOctalSix() throws {
        let permission = Permission(octal: 6)
        #expect(permission.read == true)
        #expect(permission.write == true)
        #expect(permission.execute == false)
        #expect(permission.octal == 6)
    }

    @Test func initFromOctalFive() throws {
        let permission = Permission(octal: 5)
        #expect(permission.read == true)
        #expect(permission.write == false)
        #expect(permission.execute == true)
        #expect(permission.octal == 5)
    }

    @Test func initFromOctalFour() throws {
        let permission = Permission(octal: 4)
        #expect(permission.read == true)
        #expect(permission.write == false)
        #expect(permission.execute == false)
        #expect(permission.octal == 4)
    }
    
    @Test func initFromOctalThree() throws {
        let permission = Permission(octal: 3)
        #expect(permission.read == false)
        #expect(permission.write == true)
        #expect(permission.execute == true)
        #expect(permission.octal == 3)
    }

    @Test func initFromOctalTwo() throws {
        let permission = Permission(octal: 2)
        #expect(permission.read == false)
        #expect(permission.write == true)
        #expect(permission.execute == false)
        #expect(permission.octal == 2)
    }

    @Test func initFromOctalOne() throws {
        let permission = Permission(octal: 1)
        #expect(permission.read == false)
        #expect(permission.write == false)
        #expect(permission.execute == true)
        #expect(permission.octal == 1)
    }

    @Test func initFromOctalZero() throws {
        let permission = Permission(octal: 0)
        #expect(permission.read == false)
        #expect(permission.write == false)
        #expect(permission.execute == false)
        #expect(permission.octal == 0)
    }
}

struct PermissionInitFromPermsTests {

    @Test func initFromBoolsRWX() throws {
        let permission = Permission(read: true, write: true, execute: true)
        #expect(permission.read == true)
        #expect(permission.write == true)
        #expect(permission.execute == true)
    }

    @Test func initFromBoolsRead() throws {
        let permission = Permission(read: true, write: false, execute: false)
        #expect(permission.read == true)
        #expect(permission.write == false)
        #expect(permission.execute == false)
    }

    @Test func initFromBoolsWrite() throws {
        let permission = Permission(read: false, write: true, execute: false)
        #expect(permission.read == false)
        #expect(permission.write == true)
        #expect(permission.execute == false)
    }

    @Test func initFromBoolsExecute() throws {
        let permission = Permission(read: false, write: false, execute: true)
        #expect(permission.read == false)
        #expect(permission.write == false)
        #expect(permission.execute == true)
    }

}

//
// Special
//

struct SpecialInitFromOctalTests {
    
    @Test func initFromOctalSeven() throws {
        let special = Special(octal: 7)
        #expect(special.setUid == true)
        #expect(special.setGid == true)
        #expect(special.stickyBit == true)
        #expect(special.octal == 7)
    }

    @Test func initFromOctalSix() throws {
        let special = Special(octal: 6)
        #expect(special.setUid == true)
        #expect(special.setGid == true)
        #expect(special.stickyBit == false)
        #expect(special.octal == 6)
    }

    @Test func initFromOctalFive() throws {
        let special = Special(octal: 5)
        #expect(special.setUid == true)
        #expect(special.setGid == false)
        #expect(special.stickyBit == true)
        #expect(special.octal == 5)
    }

    @Test func initFromOctalFour() throws {
        let special = Special(octal: 4)
        #expect(special.setUid == true)
        #expect(special.setGid == false)
        #expect(special.stickyBit == false)
        #expect(special.octal == 4)
    }
    
    @Test func initFromOctalThree() throws {
        let special = Special(octal: 3)
        #expect(special.setUid == false)
        #expect(special.setGid == true)
        #expect(special.stickyBit == true)
        #expect(special.octal == 3)
    }

    @Test func initFromOctalTwo() throws {
        let special = Special(octal: 2)
        #expect(special.setUid == false)
        #expect(special.setGid == true)
        #expect(special.stickyBit == false)
        #expect(special.octal == 2)
    }

    @Test func initFromOctalOne() throws {
        let special = Special(octal: 1)
        #expect(special.setUid == false)
        #expect(special.setGid == false)
        #expect(special.stickyBit == true)
        #expect(special.octal == 1)
    }

    @Test func initFromOctalZero() throws {
        let special = Special(octal: 0)
        #expect(special.setUid == false)
        #expect(special.setGid == false)
        #expect(special.stickyBit == false)
        #expect(special.octal == 0)
    }
    
}

struct SpecialInitFromPermsTests {

    @Test func initFromBoolsRWX() throws {
        let special = Special(setUid: true, setGid: true, stickyBit: true)
        #expect(special.setUid == true)
        #expect(special.setGid == true)
        #expect(special.stickyBit == true)
    }

    @Test func initFromBoolsRead() throws {
        let special = Special(setUid: true, setGid: false, stickyBit: false)
        #expect(special.setUid == true)
        #expect(special.setGid == false)
        #expect(special.stickyBit == false)
    }

    @Test func initFromBoolsWrite() throws {
        let special = Special(setUid: false, setGid: true, stickyBit: false)
        #expect(special.setUid == false)
        #expect(special.setGid == true)
        #expect(special.stickyBit == false)
    }

    @Test func initFromBoolsExecute() throws {
        let special = Special(setUid: false, setGid: false, stickyBit: true)
        #expect(special.setUid == false)
        #expect(special.setGid == false)
        #expect(special.stickyBit == true)
    }

}

//
// Metadata
//


struct MetadataInitFromOctalTests {
 
    @Test func initFromOctalZero() throws {
        let metadata = Metadata(octal: 0)
        #expect(metadata.octal == 0)
        #expect(metadata.special.octal == 0)
        #expect(metadata.owner.octal == 0)
        #expect(metadata.group.octal == 0)
        #expect(metadata.others.octal == 0)
    }

    @Test func initFromOctal() throws {
        let metadata = Metadata(octal: 1754)
        #expect(metadata.octal == 1754)
        #expect(metadata.special.octal == 1)
        #expect(metadata.owner.octal == 7)
        #expect(metadata.group.octal == 5)
        #expect(metadata.others.octal == 4)
    }
    
}
