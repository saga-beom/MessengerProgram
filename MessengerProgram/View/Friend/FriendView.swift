//
//  FriendView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI

//add log-out alert

struct FriendView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    let myId: String
    @Binding var isLogIn:Bool
    @State var islogOut = false
    @State private var friends: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Friends")
                        .font(.system(size: 35))
                        .padding()
                    
                    Spacer()
                        .onAppear {
                            getFriendList(myId: myId, completionHandler: {
                                (res:[String]?) -> Void in
                                friends = res ?? []
                            })
                        }
                    
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
                    if friends != [""] {
                        ForEach(friends, id : \.self) { friend in
                            HStack {
                                Image(systemName: "person.crop.circle.fill")
                                    .foregroundColor(Color.blue)
                                    .font(.system(size:35))
                                    .padding()
                                
                                Text(friend)
                                    .font(.system(size:25))
                                    .padding()
                                
                                Spacer()
                                
                                NavigationLink(destination: Text("test")) {
                                    Image(systemName: "message.fill")
                                        .font(.system(size:25))
                                        .padding()
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
            
                
            
        }
        
        
    }
}

struct FriendView_Previews: PreviewProvider {
    @State static var isLogin = true
    
    static var previews: some View {
        FriendView(myId: "", isLogIn: $isLogin)
    }
}
