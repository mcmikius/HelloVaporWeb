//
//  User.swift
//  App
//
//  Created by Mykhailo Bondarenko on 06.04.2020.
//

import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class User: SQLiteModel {
    
    typealias Database = SQLiteDatabase
    /// The unique identifier for this `User`.
    var id: Int?

    /// A title describing what this `User` entails.
    var name: String
    
    var age: Int

    /// Creates a new `User`.
    init(id: Int? = nil, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}

/// Allows `User` to be used as a dynamic migration.
extension User: Migration { }

/// Allows `User` to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows `User` to be used as a dynamic parameter in route definitions.
extension User: Parameter { }
