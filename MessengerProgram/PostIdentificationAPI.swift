//
//  PostIdentificationAPI.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/01.
//

import Foundation

struct User: Codable {
    var id : String
    var pwd : String
    var nickname : String
    var email : String
}

func post(id: String, pwd: String, nickname: String, email:String ) {
    let components = URLComponents(string: "http://localhost:3000")
    
    guard let url = components?.url else {return}
    
    var request: URLRequest = URLRequest(url: url)
    
    request.httpMethod = "POST"
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    request.timeoutInterval = 5
    
    let bodyModel = User.init(id: id, pwd: pwd, nickname: nickname, email: email)
    
    request.httpBody = try? JSONEncoder().encode(bodyModel)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data,
              let str = String(data: data, encoding: .utf8) else {return}
        print(str)
    }
    
    task.resume()
    
}
