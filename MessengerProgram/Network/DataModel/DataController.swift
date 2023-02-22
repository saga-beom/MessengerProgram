//
//  DataController.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/05.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "MessengerModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!!")
        } catch {
            print("We could not save the data...")
        }
    }
    
    func addFriend(myID: String, friendID: String, friendNickname: String, context: NSManagedObjectContext ) {
        
        let friend = Friend(context: context)
        friend.logInID = myID
        friend.friendID = myID
        friend.friendIDNickname = friendNickname
        
        save(context: context)
    }
    
    func editFriend(friend: Friend, myID: String, friendID: String, friendNickname: String, context: NSManagedObjectContext) {
        friend.logInID = myID
        friend.friendID = friendID
        friend.friendIDNickname = friendNickname
        
        save(context: context)
    }
}
