//
//  ExpansApp.swift
//  Expans
//
//  Created by Qerope31/01/21.
//

import SwiftUI
import CoreData

@main
struct ExpansApp: App {
    
    init() {
        self.setDefaultPreferences()
    }
    
    private func setDefaultPreferences() {
        let currency = UserDefaults.standard.string(forKey: UD_EXPENSE_CURRENCY)
        if currency == nil {
            UserDefaults.standard.set("$", forKey: UD_EXPENSE_CURRENCY)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: UD_USE_BIOMETRIC) {
                AuthenticateView()
                    .environment(\.managedObjectContext, persistentContainer.viewContext)
            } else {
                ExpenseView()
                    .environment(\.managedObjectContext, persistentContainer.viewContext)
            }
        }
    }
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Expans")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
