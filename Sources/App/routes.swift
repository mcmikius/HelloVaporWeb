import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    let userController = UserController()
    router.get("hello", String.parameter, use: userController.index)
    router.post("users", use: userController.create)
    router.get("users", use: userController.users)
    router.delete("users", User.parameter, use: userController.delete)
    router.get("web", use: userController.web)
}
