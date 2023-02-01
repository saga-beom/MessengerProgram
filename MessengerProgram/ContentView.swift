//
//  ContentView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/01/29.
//

import SwiftUI

//to add login waring when login is failed

//keyboard

struct logInView: View {
    @State var ID: String = ""
    @State var Password:String = ""
    
    var body: some View {
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
                    SecureField("Enter your Password", text : $Password)
                        .padding()
                        .background(Color(uiColor: . secondarySystemBackground))
                        .cornerRadius(15)
                }.frame(maxWidth: .infinity, maxHeight:160)
                
                Button {
                    
                } label : {
                    Text("Sign In")
                        .frame(maxWidth: .infinity, maxHeight: 35)
                    
                }
                .buttonStyle(.borderedProminent)
                .cornerRadius(15)
                
                HStack {
                    Text("creat a new account")
                    NavigationLink {
                        makeAccountView()
                    } label: {
                        Text("Here")
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        logInView()
    }
}
