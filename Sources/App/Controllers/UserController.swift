//
//  UserController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 02.04.2020.
//

import Vapor

final class UserController {
    
    func index(_ req: Request) throws -> String {
        let name = try req.parameters.next(String.self)
        return "Hello \(name)!!!"
    }
    
    func create(_ req: Request) throws -> Future<User> {
        return try req.content.decode(User.self).flatMap({ (user) in
            return user.create(on: req)
        })
    }
    
    func users(_ req: Request) throws -> Future<[User]> {
        return User.query(on: req).all()
    }
}
