import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let userController = UserController()
    router.get("hello", String.parameter, use: userController.index)

}
