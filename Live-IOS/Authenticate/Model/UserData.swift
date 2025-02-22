//
//  UserData.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import Foundation
import SwiftData

///User Data
final class User {
    @Attribute(.unique) var id: UUID = UUID()
    @Attribute(.unique) var email: String = ""
    var first_name: String = ""
    var last_name: String = ""
    var password: String = ""
    var created_at: Date = Date()
    var last_active_at: Date = Date()
}
