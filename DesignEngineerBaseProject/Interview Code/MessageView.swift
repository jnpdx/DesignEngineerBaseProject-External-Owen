//
//  MessageViews.swift
//  DesignEngineerBaseProject
//
//  Created by John Nastos on 5/5/23.
//

import Foundation
import SwiftUI

/*
 
 Feel free to use these components to build on or build your own structures
 
 */

/// A list of messages to display
struct MessagesView: View {
    var messages: [ChatMessage]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(messages) { message in
                MessageView(message: message)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/// A single message View
struct MessageView: View {
    var message: ChatMessage
    
    var body: some View {
        Text(message.content)
            .foregroundColor(.white)
    }
}

struct MessageViews_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: ChatAPI.message1)
            .frame(width: 400)
            .background(Color.black)
        
        MessageView(message: ChatAPI.message2)
            .frame(width: 400)
            .background(Color.black)
        
        MessageView(message: ChatAPI.message3)
            .frame(width: 400)
            .background(Color.black)
        
        MessagesView(messages: [ChatAPI.message1, ChatAPI.message2, ChatAPI.message3, ChatAPI.message4])
                    .frame(width: 400)
                    .background(Color.black)
    }
}
