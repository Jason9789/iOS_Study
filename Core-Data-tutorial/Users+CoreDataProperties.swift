//
//  Users+CoreDataProperties.swift
//  Core-Data-tutorial
//
//  Created by 전판근 on 2021/01/09.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var signupDate: Date?
    @NSManaged public var name: String?
    @NSManaged public var devices: [String]?
    @NSManaged public var id: Int64
    @NSManaged public var age: Int64

}

extension Users : Identifiable {

}
