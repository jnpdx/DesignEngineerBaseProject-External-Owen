//
//  ChatAPI.swift
//  DesignEngineerBaseProject
//
//  Created by John Nastos on 5/5/23.
//

import Combine
import Foundation

final class ChatAPI {
    private var messagePassthrough = PassthroughSubject<ChatMessage, Never>()
    private var randomMessagesTask: Task<Void, Never>?
}

/// The interface that the sample app should interact with
extension ChatAPI {
    /// Returns a Combine publisher of messages coming through the mock API
    func subscribe() -> AnyPublisher<ChatMessage, Never> {
        startRandomMessagePipeline()
        return messagePassthrough.eraseToAnyPublisher()
    }
    
    func getMessageStream() -> AsyncStream<ChatMessage> {
        AsyncStream { continuation in
            let cancellable: AnyCancellable = messagePassthrough.sink { message in
                continuation.yield(message)
            }
            
            continuation.onTermination = { _ in
                // We just retain the cancellable from here. Once this is cancelled, we release it.
                let _: AnyCancellable = cancellable
            }
        }
    }
    
    /// Feel free to use this to send test messages during the debug/test phase of building
    func sendTestMessage(message: ChatMessage) {
        print("Sending test message:", message)
        messagePassthrough.send(message)
    }
}

/// Remotion code -- you should not have to (but can) interact with this code
private extension ChatAPI {
    enum ChatScenario: CaseIterable {
        case one, two, three
    }
    
    private func sendMessageWithLog(_ message: ChatMessage, secondsToWait: Int) async {
        print("Sending message: ", message.content)
        messagePassthrough.send(message)
        try? await Task.sleep(nanoseconds: NSEC_PER_SEC * UInt64(secondsToWait))
    }
    
    func startRandomMessagePipeline() {
        randomMessagesTask = Task.detached { [weak self] in
            try? await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
            while true {
                guard !Task.isCancelled else {
                    return
                }
                await self?.runScenario(ChatScenario.allCases.randomElement()!)
            }
        }
    }
    
    func runScenario(_ scenario: ChatScenario) async {
        print("Run scenario ", scenario)
        switch scenario {
        case .one:
            await sendMessageWithLog(Self.message2, secondsToWait: 10)
        case .two:
            await sendMessageWithLog(Self.message2, secondsToWait: 1)
            await sendMessageWithLog(Self.message3, secondsToWait: 1)
            await sendMessageWithLog(Self.message4, secondsToWait: 1)
            await sendMessageWithLog(Self.message5, secondsToWait: 15)
        case .three:
            await sendMessageWithLog(Self.message6, secondsToWait: 5)
            await sendMessageWithLog(Self.message7, secondsToWait: 10)
        }
    }
}

extension ChatAPI {
    static var message1: ChatMessage {
        ChatMessage(id: UUID(), userID: 2, timestamp: Date(), content: "Link to the issue https://linear.app/remotion/issue/RM-8996/resizing-corners-should-show-correct-mouse-indicator")
    }
    
    static var message2: ChatMessage {
        ChatMessage(id: UUID(), userID: 3, timestamp: Date(), content: "In case you wanted to play with the prototype yourself, here's a link to the branch https://github.com/Remotionco/macOS/tree/call-prototype. Curious to hear what you think!")
    }
    
    static var message3: ChatMessage {
        ChatMessage(id: UUID(), userID: 2, timestamp: Date(), content: "So cool!")
    }
    
    static var message4: ChatMessage {
        ChatMessage(id: UUID(), userID: 4, timestamp: Date(), content: "🔥🔥🔥")
    }
    
    static var message5: ChatMessage {
        ChatMessage(id: UUID(), userID: 1, timestamp: Date(), content: "Can't wait to try it out. So many great ideas")
    }
    
    static var message6: ChatMessage {
        ChatMessage(id: UUID(), userID: 5, timestamp: Date(), content: "Welcome back! Loved your scuba pics!")
    }
    
    static var message7: ChatMessage {
        ChatMessage(id: UUID(), userID: 2, timestamp: Date(), content: "👋")
    }
}

