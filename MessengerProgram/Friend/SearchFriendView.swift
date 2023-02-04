//
//  SearchFriendView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/05.
//

import SwiftUI

// send log-in ID to this View
// register MyId, searchID, nickname to database
// search friend's nickname in corebase, in case, key is MyID

struct SearchFriendView: View {
    @State var searchId: String = ""
    @State var vaildSearch: Bool = false
    @State var errorOcurred: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Search friend for ID")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .padding(.top, 50)
                
            }
            .padding()
            
            Spacer()
            
            VStack {
                Image(systemName: "person.icloud.fill")
                    .foregroundColor(Color(.blue))
                    .font(.system(size: 200))
                    .padding(.bottom, 50)
                TextField("ID", text: $searchId )
                    .padding()
                    .background(Color(uiColor: . secondarySystemBackground))
                    .cornerRadius(15)
                Button {
                    getFriendProfile(id: searchId, completionHandler: {
                        (res:String) -> Void in
                        if (res == "Error") {
                            errorOcurred = true
                        } else {
                            print(res)
                        }
                        
                    })
                }
                label: {
                    Text("Search")
                        .frame(maxWidth: .infinity, maxHeight: 40)
                }
                .frame(maxWidth: .infinity
                       , maxHeight: 45)
                .buttonStyle(.borderedProminent)
                .cornerRadius(15)
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            
            Spacer()
            
        }
    }
}

struct SearchFriendView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFriendView()
    }
}
