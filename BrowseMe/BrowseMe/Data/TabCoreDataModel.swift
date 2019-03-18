//
//  TabCoreDataModel.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 15/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class TabCoreDataModel: NSManagedObject {

    
  class func saveBrowseTabToCoreModel() {
        
        let context = DataController.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "TabModel", in: context)
        let newEntry = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntry.setValue("URL_vikas", forKey: "url")
        newEntry.setValue("title_vikas", forKey: "title")
        
        do {
            try context.save()
        } catch  {
            print("Fail to save")
        }
    
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TabModel")
    //request.predicate = NSPredicate(format: "age = %@", "12")
    request.returnsObjectsAsFaults = false
    
    do {
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {
            print(data.value(forKey: "url") as! String)
        }
        
    } catch {
        
        print("Failed")
    }
    
    
    
    
    
    
    }
    
}
