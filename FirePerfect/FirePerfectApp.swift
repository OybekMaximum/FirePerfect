//
//  FirePerfectApp.swift
//  FirePerfect
//
//  Created by Oybek To’laboyev on 16/10/21.
//

import SwiftUI
import Firebase
@main

struct FirePerfectApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StarterScreen()
                .environmentObject(SessionStore())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
