
//let server = NIOserver(host: "localhost", port: 1717)

let ls_host: String
let li_port: Int
let ls_port: String

if CommandLine.argc < 2 {
    print("No host, port args...")
    print("Defaulting to: localhost, 1717")
    ls_host="localhost"
    li_port=1717
} else {
    let arguments = CommandLine.arguments
    ls_host = arguments[1]
    ls_port = arguments[2]
    li_port = Int(ls_port)!
//    print("host="./ls_host)
}

let server = NIOserver(host: ls_host, port: li_port)

do {
    try server.start()
}
    
catch let error {
    print("Error: \(error.localizedDescription)")
    server.stop()
}
