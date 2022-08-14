//
//  SwiftuiMVVMApp.swift
//  SwiftuiMVVM
//
//  Created by Abduqaxxor on 13/8/22.
//

import SwiftUI

@main
struct SwiftuiMVVMApp: App {
    init(){
        UINavigationBar.appearance().backgroundColor = UIColor.gray
        UINavigationBar.appearance().barTintColor = UIColor.gray
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().isTranslucent = true
    }
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeViewScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
