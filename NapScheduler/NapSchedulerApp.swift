//
//  NapSchedulerApp.swift
//  NapScheduler
//
//  Created by Borche Antovski on 9/18/22.
//

import SwiftUI
import Firebase
@main
struct NapSchedulerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            let viewModel: AppViewModel = AppViewModel()
            ContentView().environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
