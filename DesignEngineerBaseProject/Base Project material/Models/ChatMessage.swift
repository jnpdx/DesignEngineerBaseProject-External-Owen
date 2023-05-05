//
//  ChatMessage.swift
//  DesignEngineerBaseProject
//
//  Created by John Nastos on 5/5/23.
//

import Foundation

struct ChatMessage: Identifiable, Equatable {
    let id: UUID
    let userID: Int
    var timestamp: Date
    let content: String
}
