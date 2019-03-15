//
//  DataController.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 15/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import UIKit
import CoreData
import Foundation


public class DataController: NSObject {
    
    public static var shared : DataController = DataController()
    
    private var container : NSPersistentContainer {
        let modelName = "BrowseMe"
        guard let modelUrl = Bundle(for: DataController.self).url(forResource: modelName, withExtension: "xcdatamodeld") else {
            fatalError("Error loading model from bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOf: modelUrl) else {
            fatalError("Error initializing managed object model from: \(modelUrl)")
        }
        
        let container = NSPersistentContainer(name: modelName, managedObjectModel: mom)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        
        return container;
    }
    
    private var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    
    public static var viewContext: NSManagedObjectContext {
        return DataController.shared.viewContext
    }
    
    public static func newBackgroundContext() -> NSManagedObjectContext {
        let backgroundContext = DataController.shared.container.newBackgroundContext()
        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        return backgroundContext
    }
}
