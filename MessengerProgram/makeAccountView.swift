//
//  makeAccountView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/01/30.
//

import SwiftUI

struct makeAccountView: View {
    @State var ID: String = ""
    @State var Password: String = ""
    @State var checkPassword: String = ""
    @State var nickname: String = ""
    @State var email: String = ""
    
    var body: some View {
        VStack {
            Text("Create a new account")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding(.bottom, 40)
                .padding(.top, 30)
                
            VStack {
                Text("ID")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                TextField("", text: $ID)
                    .padding()
                    .background(Color(uiColor: . secondarySystemBackground))
                    .cornerRadius(15)
                
                Text("Password")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                TextField("", text: $Password)
                    .padding()
                    .background(Color(uiColor: . secondarySystemBackground))
                    .cornerRadius(15)
                
                Text("Password confirmation")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                TextField("", text: $checkPassword)
                    .padding()
                    .background(Color(uiColor: . secondarySystemBackground))
                    .cornerRadius(15)
                
                Text("Nickname")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                TextField("", text: $nickname)
                    .padding()
                    .background(Color(uiColor: . secondarySystemBackground))
                    .cornerRadius(15)
                
                Text("E-mail")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                TextField("", text: $email)
                    .padding()
                    .background(Color(uiColor: . secondarySystemBackground))
                    .cornerRadius(15)
                
            }.padding()
            
            Button {
                
            } label : {
                Text("Create")
                    .frame(maxWidth: .infinity, maxHeight: 35)
                
            }.buttonStyle(.borderedProminent)
             .cornerRadius(15)
             .padding()
            
            Spacer()
            
        }
    }
}

struct makeAccountView_Previews: PreviewProvider {
    static var previews: some View {
        makeAccountView()
    }
}
