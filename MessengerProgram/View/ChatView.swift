//
//  ChatView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI
import SocketIO


struct ChatView: View {
    @Environment (\.managedObjectContext) var manageObjectContext
    @Environment (\.dismiss) var dismiss
    
    @State private var message = ""
    @State private var messages: [String] = []
    
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!)
    let socket: SocketIOClient
    
    init() {
        socket = manager.defaultSocket
    }
    
    var body: some View {
        VStack {
            Text("Chat")
                .font(.largeTitle)
            ScrollView {
                VStack {
                    ForEach(messages, id: \.self) {
                        message in Text(message)
                    }
                }
            }
            HStack {
                TextField("Message", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
            .padding()
            
        }
        .onAppear {
            self.socket.connect()
            self.socket.on("chat message") { data, ack in
                if let message = data.first as? String {
                    self.messages.append(message)
                }
            }
        }
        
    }
    
    func sendMessage() {
        socket.emit("chat message", message)
        message = ""
    }

}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
