//
//  User.swift
//  DesignEngineerBaseProject
//
//  Created by John Nastos on 5/5/23.
//

import AppKit
import Foundation

struct User: Identifiable, Equatable {
    let id: Int
    let displayName: String
    let avatar: NSImage
}


extension User {
    static var zak = User(id: 1, displayName: "Zak", avatar: NSImage(named: "Zak")!)
    static var chantelle = User(id: 2, displayName: "Chantelle", avatar: NSImage(named: "Chantelle")!)
    static var alexander = User(id: 3, displayName: "Alexander", avatar: NSImage(named: "Alexander")!)
    static var sam = User(id: 4, displayName: "Sam", avatar: NSImage(named: "Sam")!)
    static var alice = User(id: 5, displayName: "Alice", avatar: NSImage(named: "Alice")!)
}
