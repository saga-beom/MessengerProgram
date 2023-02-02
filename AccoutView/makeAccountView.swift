//
//  makeAccountView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/01/30.
//

import SwiftUI

struct makeAccountView: View {
    @Environment(\.presentationMode) var presentation
    
    @State var errorType: String = ""
    @State var invaildID: Bool = false
    @State var notMatchPassword:Bool = false
    @State var invaildPassword: Bool = false
    @State var invaildNickname: Bool = false
    @State var invaildEmail:Bool = false
    @State var occuredError:Bool = false
    @State var createAccount:Bool = false
    
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
                    HStack {
                        Text("ID")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                    // add keyboard to TextField
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
                    
                    Text("Password confirmation")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    SecureField("", text: $checkPassword)
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
                    
                    // already exist account
                    
                    //if identification is not matched in format program pop up alert
                    if (id.count < 4 || id.count > 10) {
                        invaildID = true
                        
                    } else if (password.count < 6 || password.count > 12){
                        invaildPassword = true
                        
                    } else if (password != checkPassword) {
                        notMatchPassword = true
                        
                    } else if (nickname.count > 10 || nickname.count == 0) {
                        invaildNickname = true
                        
                    } else if (!isValidEmail(email: email)) {
                        invaildEmail = true
                    } else {
                        
                        post(id: id, pwd: password, nickname: nickname, email: email, errorType: { (res:String) -> Void in
                            
                            if (res == "overlap") {
                                errorType = "This ID is already in use"
                                occuredError = true
                                
                            }else if(res == "NotDefinedError") {
                                errorType = "An unexpected error has occurred, please try again"
                                occuredError = true
                            } else if(res == "None") {
                                errorType = "None"
                                createAccount = true
                                print("account success")
                            }
                            
                        })
                        
                        
                        
                    }
                    
                    
                } label : {
                    Text("Create")
                        .frame(maxWidth: .infinity, maxHeight: 40)
                    
                }
                .frame(height: 100, alignment: .top)
                .buttonStyle(.borderedProminent)
                .cornerRadius(15)
                .padding()
                .alert("invaild ID", isPresented: $invaildID) {
                    Button("Ok") { invaildID = false }
                } message: {
                    Text("ID must be between 4 and 10 characters long")
                }
                .alert("Password Error", isPresented: $invaildPassword) {
                    Button("Ok") { invaildPassword = false}
                } message: {
                    Text("Password must be between 6 and 12 characters long")
                }
                .alert("Password Error", isPresented: $notMatchPassword) {
                    Button("Ok") { notMatchPassword = false}
                } message: {
                    Text("Password and Password confirmation does not match")
                }
                .alert("invaild Nickname", isPresented: $invaildNickname) {
                    Button("Ok") { invaildNickname = false }
                } message: {
                    Text("Nickname must be between 1 and 10 characters long")
                }
                .alert("invaild Email", isPresented: $invaildEmail) {
                    Button("Ok") { invaildEmail = false }
                }
                                            
            }
        
        // It was divided into VStack and Button to handle a large number of alerts
        }
        .alert("occured Error", isPresented: $occuredError) {
            Button("Ok") {occuredError = false}
        }
        message: {
            Text(errorType)
        }
        .alert("Your account is set up", isPresented:$createAccount) {
            Button("Ok") { presentation.wrappedValue.dismiss() }
        }
        
    }
}

struct makeAccountView_Previews: PreviewProvider {
    static var previews: some View {
        makeAccountView()
    }
}

