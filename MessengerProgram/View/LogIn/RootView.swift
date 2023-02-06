//
//  RootView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI

struct RootView: View {
    @State var naviLinkActive = false
    @State var isLogIn = false
    @State var invaildID = false
    @State var logInError = false
    
    @State var ID: String = ""
    @State var password:String = ""
    
    var body: some View {
        if (isLogIn == false) {
            NavigationView {
                VStack {
                    Image(systemName: "paperplane")
                        .font(.system(size :150))
                        .frame(width: 350, height: 280)
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    
                    VStack() {
                        TextField("Enter your ID", text : $ID)
                            .padding()
                            .background(Color(uiColor: . secondarySystemBackground))
                            .cornerRadius(15)
                        SecureField("Enter your Password", text : $password)
                            .padding()
                            .background(Color(uiColor: . secondarySystemBackground))
                            .cornerRadius(15)
                    }.frame(maxWidth: .infinity, maxHeight:160)
                    
                    Button {
                        checkVaildLogIn(id: ID, logIn: {(res:String) -> Void in
                            
                            if (res == password) {
                                isLogIn = true
                            } else if (res == "invaildID") {
                                invaildID = true
                            } else {
                                logInError = true
                            }
                            
                        })
                    } label : {
                        Text("Sign In")
                            .frame(maxWidth: .infinity, maxHeight: 35)
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .cornerRadius(15)
                    .alert("invaild ID", isPresented: $invaildID) {
                        Button("Ok") { invaildID = false }
                    } message: {
                        Text("ID does not exist")
                    }
                    .alert("Error occured", isPresented: $logInError) {
                        Button("Ok") { logInError = false }
                    } message: {
                        Text("unexpected error has occurred, please try again")
                    }
                    
                    HStack {
                        Text("creat a new account")
                        NavigationLink {
                            MakeAccountView()
                        } label: {
                            Text("Here")
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    
                }
                .padding()
            }
        } else {
            MainView(isLogIn: $isLogIn, myID: ID)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
