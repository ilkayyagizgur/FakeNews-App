//
//  FakeNewsApp.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI
import Firebase
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct FakeNewsApp: App {
    let persistenceController = PersistenceController.shared
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var userData = UserData()

    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser != nil {
                MainView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(userData)
            } else {
                LoginPageView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(userData)
            }
            
        }
    }
}
