//
//  NIOServer.swift
//  NIOserver
//
//  Created by csd on 8/15/18.
//

import Foundation
import NIO

public class NIOserver {
    private var host: String?
    private var port: Int?

    init(host: String, port: Int) {
    self.host = host
    self.port = port
    }

    private let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    
    private var serverBootstrap: ServerBootstrap {
        return ServerBootstrap(group: group)
            .serverChannelOption(ChannelOptions.backlog, value: 256)
            .serverChannelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
    }
    
    func start() throws {
        guard let host = host else {
            //throw QOTDError.invalidHost
            return print("invalid Host")
        }
        guard let port = port else {
            //throw QOTDError.invalidPort
            return print("invalid port")
        }
        do {
            let channel = try serverBootstrap.bind(host: host, port: port).wait()
            print("\(channel.localAddress!) started")
            try channel.closeFuture.wait()
        } catch let error {
            throw error
        }
    }
    
    func stop() {
        do {
        try group.syncShutdownGracefully()
        }
        catch let error {
        print("\(error.localizedDescription)")
        exit(0)
        }
        print("stopped")
    }
}

