//
//  FriendView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI

struct FriendView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Friends")
                        .font(.system(size: 35))
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {}, label: {
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
                    VStack {
//                        List {
//                            ForEach() { item in
//                                NavigationLink
//                            }
//                        }
                        
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
