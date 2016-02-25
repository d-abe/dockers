import KituraRouter
import KituraNet
import KituraSys

let router = Router()

router.get("/") {
request, response, next in

    response.status(HttpStatusCode.OK).send("Hello, World.")

    next()
}

let server = HttpServer.listen(8090, delegate: router)
Server.run()
