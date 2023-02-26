//
//  FriendView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI
import SocketIO


struct FriendView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    let myId: String
    let socket: SocketIOClient
    @Binding var isLogIn: Bool
    @State var islogOut = false
    @State private var friends: [String:String] = [:]
    @State private var reqChat: [String: Bool] = [:]
    

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Friends")
                        .font(.system(size: 35))
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: SearchFriendView(myId: myId), label: {
                        Image(systemName: "person.badge.plus")
                            .font(.system(size: 30))
                            .padding(.trailing, 20.0)
                            .imageScale(.medium)
                    })
                    
                    Button(action: {
                        islogOut = true
                    }, label: {
                        Image(systemName: "power")
                            .font(.system(size: 30))
                            .padding(.trailing, 20.0)
                            .imageScale(.medium)
                            .foregroundColor(.red)
                    })
                }
                .padding(.top, 20.0)
                .alert("Are you sure you want to log out", isPresented: $islogOut) {
                    Button("Log out", role: .destructive) {
                        islogOut = false
                        isLogIn = false
                    }
                }
                Divider()
                    .frame(height: 1)
                    .background(Color.blue)
                
                Spacer()
                
                ScrollView {
                    if !friends.isEmpty {
                        ForEach(friends.sorted(by: { $0.key < $1.key }), id: \.key) { id, nickname in
                            HStack {
                                Image(systemName: "person.crop.circle.fill")
                                    .foregroundColor(Color.blue)
                                    .font(.system(size:35))
                                    .padding()
                                
                                Text(nickname)
                                    .font(.system(size:25))
                                    .padding()
                                
                                Spacer()
                                
                                if checkRequest(id: id) {
                                    NavigationLink(destination: ChatView(logInId: myId, opponentId: id, revsocket: socket, opponentNickname: nickname)) {
                                        Image(systemName: "message.fill")
                                            .font(.system(size:25))
                                            .padding()
                                            .foregroundColor(.red)
                                    }
                                } else {
                                    NavigationLink(destination: ChatView(logInId: myId, opponentId: id, revsocket: socket, opponentNickname: nickname)) {
                                        Image(systemName: "message.fill")
                                            .font(.system(size:25))
                                            .padding()
                                    }

                                }
                            }
                            .frame(height:65.0)
                            
                            Divider()
                                .background(Color.gray)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }.onAppear {
            getFriendList(myId: myId) { friends in
                DispatchQueue.main.async {
                    self.friends = friends ?? [:]
                }
            }
//            socket.on("chat request") { data, ack in
//                DispatchQueue.main.async {
//                    if let request = data.first as? String {
//                        reqChat[request] = true
//                    }
//                }
//
//            } Maybe coredata handle this problem
        }
    }
    func checkRequest(id:String) -> Bool {
        print(reqChat)
        if(reqChat[id] == true) {
            return true
        }
        return false
    }
}

//struct FriendView_Previews: PreviewProvider {
//    @State static var isLogin = true
//
//    static var previews: some View {
////        FriendView(myId: "",socket: , isLogIn: $isLogin)
//    }
//}
