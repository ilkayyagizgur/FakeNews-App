//
//  FakeNewsApp.swift
//  FakeNews
//
//  Created by Ada Yagiz Gur on 24.05.2023.
//

import SwiftUI
//import Firebase
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

    var body: some Scene {
        WindowGroup {
            LoginPageView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                .onAppear {
//                #if DEBUG
//                                    UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
//                #endif
//                                }
        }
    }
}
