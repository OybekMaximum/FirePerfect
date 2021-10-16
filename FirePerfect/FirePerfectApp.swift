//
//  FirePerfectApp.swift
//  FirePerfect
//
//  Created by Oybek To’laboyev on 16/10/21.
//

import SwiftUI

@main
struct FirePerfectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
