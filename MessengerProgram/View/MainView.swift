//
//  MainView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI
import SocketIO

struct MainView: View {
    
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!)
    var socket: SocketIOClient
    
    @Binding var isLogIn:Bool
    let myId:String
    
    init(isLogIn: Binding<Bool>, myId: String) {
        self._isLogIn = isLogIn
        self.myId = myId.lowercased()
        self.socket = manager.defaultSocket
    }
    
    var body: some View {
        TabView {
            
            FriendView(myId : myId, socket: socket, isLogIn: $isLogIn).tabItem {
                Image(systemName: "person")
                Text("Friends")
            }
            
//            ChatView(logInId: myId, opponentId: "", revsocket: socket).tabItem {
//                Image(systemName: "message")
//                Text("Chat")
//            }
        }
        .onAppear {
            socket.on(clientEvent: .connect) { data, ack in
                self.socket.emit("register", self.myId)
            }
            
            
            self.socket.connect()
        }
        
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    @State static var isLogin = true
    
    static var previews: some View {
        MainView(isLogIn: $isLogin , myId: "")
    }
}
