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
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(User.self).flatMap({ (user) in
            return user.delete(on: req)
        }).transform(to: .ok)
    }
    
    func web(_ req: Request) throws -> Future<View> {
        return try req.view().render("users", userInfo: ["users": User.query(on: req).all()])
    }
}
