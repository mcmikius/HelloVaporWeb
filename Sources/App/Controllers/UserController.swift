//
//  UserController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 02.04.2020.
//

import Vapor

final class UserController {
    func index(_ req: Request) throws -> String {
        return "Hi!"
    }
}
