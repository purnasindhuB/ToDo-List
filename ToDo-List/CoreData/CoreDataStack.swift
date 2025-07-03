//
//  CoreDataStack.swift
//  ToDo-List
//
//  Created by Purnasindhu-749 on 01/07/25.
//

import Foundation
import CoreData

class CoreDataStack {
    private let modelName : String
    /// Provides the main context used to interact with Core Data
    lazy var managedContext : NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    /// Initializes CoreDataStack with the specified model name
    init(modelName:String) {
        self.modelName = modelName
    }
    
    /// Sets up the NSPersistentContainer which loads the Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
              
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

///Responsible for handling changes in manageContext happens with NSPersistenceCoordinator
    /// Saves changes in the managedContext if there are any unsaved changes
    func saveContext () {
        if managedContext.hasChanges {
            do {
                try managedContext.save()
            } catch {
              
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
