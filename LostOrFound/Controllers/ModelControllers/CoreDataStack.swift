//
//  CoreDataStack.swift
//  LostOrFound
//
//  Created by Jimmy on 6/8/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {

    static let container: NSPersistentContainer = {
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        let container = NSPersistentContainer(name: appName)
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error{
                fatalError("Failed to load from Persistent Store \(error) \(error.localizedDescription)")
            }
        })
        return container
    }()

    // direct touchpoint to the context/"sandbox"/larger Source of Truth
    static var context: NSManagedObjectContext { return container.viewContext }
}
