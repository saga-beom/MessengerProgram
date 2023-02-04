//
//  Friends+CoreDataProperties.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/05.
//
//

import Foundation
import CoreData


extension Friends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friends> {
        return NSFetchRequest<Friends>(entityName: "Friends")
    }

    @NSManaged public var nickname: String?
    @NSManaged public var id: String?

}

extension Friends : Identifiable {

}
