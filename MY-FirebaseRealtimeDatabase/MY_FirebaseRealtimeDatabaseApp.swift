//
//  MY_FirebaseRealtimeDatabaseApp.swift
//  MY-FirebaseRealtimeDatabase
//
//  Created by Zaid Neurothrone on 2022-10-18.
//

import FirebaseCore
import Firebase
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct MY_FirebaseRealtimeDatabaseApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
