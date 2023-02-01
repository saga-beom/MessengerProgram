//
//  makeAccountView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/01/30.
//

import SwiftUI

struct makeAccountView: View {
    @State var catchError: String = ""
    
    @State var id: String = ""
    @State var password: String = ""
    @State var checkPassword: String = ""
    @State var nickname: String = ""
    @State var email: String = ""
    
    var body: some View {
        ScrollView() {
            VStack {
                Text("Create a new account")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                    .padding(.bottom, 20)
                    .padding(.top, 30)
                
                VStack {
                    Text("ID") // add hidden incorrect warning
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    TextField("", text: $id)
                        .padding()
                        .background(Color(uiColor: . secondarySystemBackground))
                        .cornerRadius(15)
                    
                    Text("Password")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    SecureField("", text: $password)
                        .padding()
                        .background(Color(uiColor: . secondarySystemBackground))
                        .cornerRadius(15)
                    
                    Text("Password confirmation") // add hidden incorrect warning
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    SecureField("", text: $checkPassword)
                        .padding()
                        .background(Color(uiColor: . secondarySystemBackground))
                        .cornerRadius(15)
                    
                    Text("Nickname") // add hidden overlap warning
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    TextField("", text: $nickname)
                        .padding()
                        .background(Color(uiColor: . secondarySystemBackground))
                        .cornerRadius(15)
                    
                    Text("E-mail") // search email-form + add not necessary
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    TextField("", text: $email)
                        .padding()
                        .background(Color(uiColor: . secondarySystemBackground))
                        .cornerRadius(15)
                    
                }.padding()
                
                Button {
                    // id is 4~10
                    // wrong password
                    // already exist account
                    post(id: id, pwd: password, nickname: nickname, email: email, errorType: { (res:String) -> Void in
                        
                        if (res == "overlap") {
                            catchError = "overlap"
                        }else if(res == "NotDefinedError") {
                            catchError = "NotDefinedError"
                        }else {
                            catchError = "None"
                        }
                        
                        if (catchError == "NotDefinedError") {
                            print("NotDefinedError")
                        } else if(catchError == "overlap") {
                            print("overlap")
                        } else {
                            print("POST")
                        }
                        
                    })
                    
                    
                } label : {
                    Text("Create")
                        .frame(maxWidth: .infinity, maxHeight: 40)
                    
                }
                .frame(height: 100, alignment: .top)
                .buttonStyle(.borderedProminent)
                .cornerRadius(15)
                .padding()
            }
        }
    }
}

struct makeAccountView_Previews: PreviewProvider {
    static var previews: some View {
        makeAccountView()
    }
}
