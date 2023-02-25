//
//  SearchFriendView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/05.
//

import SwiftUI


struct SearchFriendView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss // back Navigation view
 
    
    @State var searchId: String = ""
    @State var vaildSearch: Bool = false
    @State var errorOcurred: Bool = false
    
    let myId:String
    
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
                    getFriendProfile(myId: myId, searchId: searchId, completionHandler: {
                        (res:String) -> Void in
                        if (res == "Error" || res == "invaildID" || res == "overlap") {
                            errorOcurred = true
                            return
                        } else {
                            vaildSearch = true
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
                .alert("Adding friend", isPresented: $vaildSearch) {
                    Button("Ok") {
                        vaildSearch = false
                        dismiss()
                    }
                }
                .alert("Failed to add friend", isPresented: $errorOcurred) {
                    Button("Ok") { errorOcurred = false }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            
            Spacer()
            
        }
    }
}

struct SearchFriendView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFriendView(myId: "")
    }
}
