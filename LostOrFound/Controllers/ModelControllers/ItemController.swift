//
//  ItemController.swift
//  LostOrFound
//
//  Created by Jimmy on 6/8/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import Foundation
import CoreData

class ItemController {
    
    // MARK: - Shared Instance
    static let sharedInstance = ItemController()
    
    var fetchedResultsController: NSFetchedResultsController<Item>
    
    init() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(key: "itemName", ascending: false)]
        
        let resultsController: NSFetchedResultsController<Item> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error performing the fetch")
        }
    }
    
    // MARK: - CRUD
    
    func createItem(withItemName: String, withItemDescription: String, withLatitude: Double, withLongitude: Double) {
        let _ = Item(itemName: withItemName, itemDescription: withItemDescription, latitude: withLatitude, longitude: withLongitude)
        
        saveToPersistence()
    }
    
    func updateItem(item: Item, newItemName: String, newItemDescription: String, newLatitude: Double, newLongitude: Double) {
        item.itemName = newItemName
        item.itemDescription = newItemDescription
        item.latitude = newLatitude
        item.longitude = newLongitude
        
        saveToPersistence()
    }
    
    func deleteItem(item: Item) {
        item.managedObjectContext?.delete(item)
        
        saveToPersistence()
    }
    
    func saveToPersistence() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving Managed Object. Items not saved!! \(#function) : \(error.localizedDescription)")
        }
    }
}
