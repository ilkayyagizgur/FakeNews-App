//
//  FakeNewsApp.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI

@main
struct FakeNewsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
