//
//  FriendView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI

struct FriendView: View {
    
    @State var friends = ["Hyobeom", "Seo", "Saga"]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Friends")
                        .font(.system(size: 35))
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: SearchFriendView(), label: {
                        Image(systemName: "person.badge.plus")
                            .font(.system(size: 30))
                            .padding(.trailing, 20.0)
                            .imageScale(.medium)
                    })
                }
                .padding(.top, 20.0)
                
                Divider()
                    .frame(height: 1)
                    .background(Color.blue)
                
                Spacer()
                
                ScrollView {
                    
                    ForEach(0..<friends.count, id: \.self) { friendname in
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .foregroundColor(Color.blue)
                                .font(.system(size:35))
                                .padding()
                            
                            Text(String(friends[friendname]))
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
                .frame(maxWidth: .infinity)
            }
            
                
            
        }
        
        
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}
