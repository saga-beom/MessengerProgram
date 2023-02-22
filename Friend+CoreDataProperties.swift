//
//  Friend+CoreDataProperties.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/15.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var friendID: String?
    @NSManaged public var friendIDNickname: String?
    @NSManaged public var logInID: String?

}
