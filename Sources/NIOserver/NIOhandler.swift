//
//  NIOhandler.swift
//  NIOserver
//
//  Created by csd on 8/15/18.
//

import Foundation
import NIO

class NIOhandler: ChannelInboundHandler{
    public typealias InboundIn = ByteBuffer
    public typealias OutboundOut = IOData
    
    func channelRegistered(ctx: ChannelHandlerContext) {
        print("Incoming connection registered")
        // do server stuff here
        
        print("Closing connection")
        ctx.close(promise: nil)
    }
    
    public func errorCaught(ctx: ChannelHandlerContext, error: Error) {
        print("error: ", error)
        ctx.close(promise: nil)
    }
    

}

