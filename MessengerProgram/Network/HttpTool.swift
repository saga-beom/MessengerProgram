//
//  HttpTool.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

// 명명법 바꾸기
// 열거형 

import Foundation
import SwiftUI

struct User: Codable {
    var id : String
    var pwd : String
    var nickname : String
    var email : String
}

struct Error: Codable {
    var error: String
}

struct ReqPW: Codable {
    var id: String
}

struct ResPW: Codable {
    var pw: String
}

struct ResNickname: Codable {
    var nickname: String
}


func setUpAccount(id: String, pwd: String, nickname: String, email:String, errorType: @escaping (String) -> Void) {
            
    let components = URLComponents(string: "http://192.168.10.104:3000/setUpAccount")
    
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


func checkVaildLogIn(id: String, logIn: @escaping (String) -> Void) {
    
    var components = URLComponents(string: "http://192.168.10.104:3000/logIn/\(id)")
    
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

func getFriendProfile(myId: String, searchId:String, completionHandler: @escaping (String) -> Void) {
    
    var components = URLComponents(string: "http://192.168.10.104:3000/searchFriend/\(myId)&\(searchId)")
    
    guard let url = components?.url else { return }
    
    var request: URLRequest = URLRequest(url: url)
    
    request.httpMethod = "GET"
    
    request.timeoutInterval = 5
    
    let myIdQuery = URLQueryItem(name: "myId", value: myId)
    let seachIdQuery = URLQueryItem(name: "searchId", value: searchId)
        
    components?.queryItems?.append(myIdQuery)
    components?.queryItems?.append(seachIdQuery)
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data else { return completionHandler("Error")}
        
        let response = try? JSONDecoder().decode(ResNickname.self, from:data)
        
        completionHandler(response?.nickname ?? "Error")
    }
    
    task.resume()
}

func getFriendList(myId: String,  completionHandler: @escaping ([String]) -> Void) {
    
    var friendList = [String]()
        
    let components = URLComponents(string: "http://192.168.10.104:3000/getFriendList/\(myId)")
    
    guard let url = components?.url else {return}
    
    var request: URLRequest = URLRequest(url: url)
    
    request.httpMethod = "GET"
    
    request.timeoutInterval = 5
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
           if let error = error {
               print("Error: \(error.localizedDescription)")
               completionHandler([])
               return
           }
           
           guard let data = data else {
               print("No data returned from server")
               completionHandler([])
               return
           }

            if let responseString = String(data: data, encoding: .utf8) {
                let friendList = responseString
                    .trimmingCharacters(in: CharacterSet(charactersIn: "[]"))
                    .replacingOccurrences(of: "\\\"", with: "")
                    .components(separatedBy: ",")
                    .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                    .map { $0.replacingOccurrences(of: "\"", with: "") }
                completionHandler(friendList)
            } else {
                print("Could not convert data to string")
                completionHandler([])
        }
    }

    
    task.resume()
    
}


