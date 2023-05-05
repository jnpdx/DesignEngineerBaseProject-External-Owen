//
//  SyntheticDesktop.swift
//  DesignEngineerBaseProject
//
//  Created by John Nastos on 5/5/23.
//

import Combine
import Foundation
import SwiftUI

/*
 
 This is the base file for the code you'll be working in.
 
 There's a very basic structure laid out for you including a couple of views and data source objects.
 
 - SyntheticDesktop
    The root view for the app -- it also holds references to the data source objects
 - UserProvider
    Has a list of users in the conversation. This list is actually static and doesn't change during the lifetime of the
    sample project
 - ChatAPIManager
    This is where you'll interface with the ChatAPI object. If you'd rather use your own construct to interface with ChatAPI, feel
    free to use a different structure
 - MessagesView
    A list of messages to display
 - MessageView
    A single message to display
 
 Although you should only *need to* interact in the Interview Code directory, feel free to modify anything in the project -- this is just a template to get you started.
 
 */

struct SyntheticDesktop: View {
    /// The current users that are in the conversation
    @StateObject private var userProvider = UserProvider()
    /// The interface to the Chat API
    @StateObject private var apiManager = ChatAPIManager()
    
    var body: some View {
        ZStack {
            Image("Desktop")
                .resizable()
                .interpolation(.high)
                .frame(width: 1200, height: 800)
            
            MessagesView(messages: apiManager.messages)
        }
    }
}

final class ChatAPIManager: ObservableObject {
    @Published var messages: [ChatMessage] = []
    private let chatAPI = ChatAPI()
    
    init() {
        /*
         Here, you should call `subscribe()` (or `getMessageStream`) on the ChatAPI object. `subscribe()` delivers messages with Combine
         and `getMessageStream` uses an AsyncStream. Feel free to use whichever you prefer.
         
         Instead of just ignoring the output like the current code,
         you should deal with the Publisher output that `subscribe` or `getMessageStream` provides.
         
         You'll see in the console that `chatAPI` starts receiving messages automatically when the app starts up
         */
        // let publisher: AnyPublisher<ChatMessage, Never> = chatAPI.subscribe()
        // let stream = chatAPI.getMessageStream()
    }
}
