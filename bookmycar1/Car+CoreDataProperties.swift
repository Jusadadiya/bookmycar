//
//  Car+CoreDataProperties.swift
//  bookmycar1
//
//  Created by Student on 2020-04-17.
//  Copyright © 2020 Jay. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var maker: String?
    @NSManaged public var model: String?

}
