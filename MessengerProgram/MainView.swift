//
//  MainView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            
            FriendView().tabItem {
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
    static var previews: some View {
        MainView()
    }
}
