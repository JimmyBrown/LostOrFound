//
//  Item+Convenience.swift
//  LostOrFound
//
//  Created by Jimmy on 6/8/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    
    convenience init(itemName: String, itemDescription: String, latitude: Double, longitude: Double, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.itemName = itemName
        self.itemDescription = itemDescription
        self.latitude = latitude
        self.longitude = longitude
    }
}
