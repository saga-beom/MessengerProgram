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
    @State private var messages: [[String: String]] = [[:]]
    let myId:String
    let friendId:String
    
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!)
    let socket: SocketIOClient
    
    init(logInId: String, opponentId: String) {
        socket = manager.defaultSocket
        myId = logInId.lowercased()
        friendId = opponentId
    }
    
    var body: some View {
        VStack {
            Text("Chat")
                .font(.largeTitle)
            ScrollView {
                VStack {
                    ForEach(messages, id: \.self) { messageDict in
                        ForEach(messageDict.sorted(by: <), id: \.key) { sender, message in
                            if sender == myId {
                                HStack{
                                    Spacer()
                                    ZStack {
                                        Text(message)
                                            .font(.system(size: 27))
                                            .padding(10)
                                            .foregroundColor(Color.white)
                                    }
                                    .background(RoundedRectangle(cornerRadius: 7)
                                        .foregroundColor(.blue))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                                }
                                .padding(.trailing, 25.0)
                            } else {
                                HStack{
                                    ZStack {
                                        Text(message)
                                            .font(.system(size: 27))
                                            .padding(10)
                                    }
                                    .background(RoundedRectangle(cornerRadius: 7)
                                        .foregroundColor(.gray))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7)
                                            .stroke(Color.gray, lineWidth: 2)
                                    )
                                    Spacer()
                                }
                                .padding(.leading, 25.0)
                            }
                        }
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
            self.socket.on(clientEvent: .connect) { data, ack in
                self.socket.emit("register", self.myId)
            }
            self.socket.on("chat message") { data, ack in
                if let messageData = data.first as? [String: Any],
                   let message = messageData["msg"] as? String,
                   let sender = messageData["sender"] as? String
                {
                    self.messages.append([sender:message])
                }
            }
            
            self.socket.connect()
        }
        
    }
    
    func sendMessage() {
        
        let data: [String: Any] = [
            "sender": myId,
            "receiver": friendId,
            "msg": self.message
        ]
        
        if self.message != "" {
            socket.emit("chat message", data)
        }
        message = ""
    }

}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(logInId: "shb0217", opponentId: "shb0216")
    }
}
