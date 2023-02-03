//
//  checkLogIn.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/03.
//

import Foundation

struct ReqPW: Codable {
    var id: String
}

struct ResPW: Codable {
    var pw: String
}

func checkVaildLogIn(id: String, logIn: @escaping (String) -> Void) {
    
    var components = URLComponents(string: "http://localhost:3000/logIn/\(id)")
    
    guard let url = components?.url else { return }
    
    var request: URLRequest = URLRequest(url: url)
    
    request.httpMethod = "GET"
    
    request.timeoutInterval = 5
    
    let myQuery = URLQueryItem(name: "id", value: id)
    
    components?.queryItems?.append(myQuery)
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data else { return logIn("Error")}
        
        let resPw = try? JSONDecoder().decode(ResPW.self, from:data)
        
        logIn(resPw?.pw ?? "Error")
    }
    
    task.resume()
}


