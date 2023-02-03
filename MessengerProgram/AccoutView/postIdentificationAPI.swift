//
//  postIdentificationAPI.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/03.
//

import Foundation

struct User: Codable {
    var id : String
    var pwd : String
    var nickname : String
    var email : String
}

struct Error: Codable {
    var error: String
}




func post(id: String, pwd: String, nickname: String, email:String, errorType: @escaping (String) -> Void) {
            
    let components = URLComponents(string: "http://localhost:3000/setUpAccount")
    
    guard let url = components?.url else {return}
    
    var request: URLRequest = URLRequest(url: url)
    
    request.httpMethod = "POST"
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    request.timeoutInterval = 5
    
    let bodyModel = User.init(id: id, pwd: pwd, nickname: nickname, email: email)
    
    request.httpBody = try? JSONEncoder().encode(bodyModel)
    
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data else {return errorType("NotDefinedError")}
        
        let catchError = try? JSONDecoder().decode(Error.self, from: data)
        

        errorType(catchError?.error ?? "NotDefinedError")
        
        
    }
    
    task.resume()
    
    

}


//func checkOverlap() {
//
//    let components = URLComponents(string: "http://localhost:3000")
//
//    guard let url = components?.url else { return }
//
//    var request: URLRequest = URLRequest(url: url)
//
//
//    request.httpMethod = "GET"
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        guard let data,
//              let str = String(data: data, encoding: .utf8) else { return }
//        print(str)
//    }
//
//    task.resume()
//
//    return
//}
