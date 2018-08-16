
let server = NIOserver(host: "localhost", port: 1717)

do {
    try server.start()
}
    
catch let error {
    print("Error: \(error.localizedDescription)")
    server.stop()
}
