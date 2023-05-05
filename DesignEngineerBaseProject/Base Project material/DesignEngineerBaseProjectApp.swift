//
//  DesignEngineerBaseProjectApp.swift
//  DesignEngineerBaseProject
//
//  Created by John Nastos on 5/5/23.
//

import SwiftUI

@main
struct DesignEngineerBaseProjectApp: App {
    var body: some Scene {
        WindowGroup {
            SyntheticDesktop()
        }
        .windowResizabilityContentSize()
    }
}

extension Scene {
    func windowResizabilityContentSize() -> some Scene {
        if #available(macOS 13.0, *) {
            return windowResizability(.contentSize)
        } else {
            return self
        }
    }
}
