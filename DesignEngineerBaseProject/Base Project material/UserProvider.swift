//
//  UserProvider.swift
//  DesignEngineerBaseProject
//
//  Created by John Nastos on 5/5/23.
//

import Combine
import Foundation

final class UserProvider: ObservableObject {
    @Published var users: [User] = [User.zak, User.chantelle, User.alexander, User.sam, User.alice]
}
