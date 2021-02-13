//
//  PersonData.swift
//  customTableView
//
//  Created by 전판근 on 2021/02/13.
//

import Foundation
import UIKit

class PersonData {
    var personImage: UIImage!
    var personName: String!
    var personAge: Int!
    
    init(personImage: UIImage, personName: String, personAge: Int) {
        self.personImage = personImage
        self.personName = personName
        self.personAge = personAge
    }
}
