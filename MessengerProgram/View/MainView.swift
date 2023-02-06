//
//  MainView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI

struct MainView: View {
    
    @Binding var isLogIn:Bool
    
    let myID:String
    
    var body: some View {
        TabView {
            
            FriendView(myID : myID, isLogIn: $isLogIn).tabItem {
                Image(systemName: "person")
                Text("Friends")
            }
            
            ChatView().tabItem {
                Image(systemName: "message")
                Text("Chat")
            }
        }
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    @State static var isLogin = true
    
    static var previews: some View {
        MainView(isLogIn: $isLogin , myID: "")
    }
}