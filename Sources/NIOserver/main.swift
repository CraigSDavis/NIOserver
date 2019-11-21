//
// main.swift
//
// Created by Craig Davis July 2018

let ls_host: String
let li_port: Int

if CommandLine.argc < 2 {
    print("No arguments passed...")
    print("Defaulting to:")
    ls_host = "localhost"
    li_port = 1717
} else {
    let arguments = CommandLine.arguments
    ls_host = arguments[1]
    li_port = Int(arguments[2])!
}

print("host:" + ls_host)
print("port:" + String(li_port))

let server = NIOserver(host: ls_host, port: li_port)

do {
    try server.start()
}
    
catch let error {
    print("Error: \(error.localizedDescription)")
    server.stop()
}
