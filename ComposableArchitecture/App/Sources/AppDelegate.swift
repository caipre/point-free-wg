//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

  let store = Store<AppState>(initialValue: AppState())
  func application(
    _: UIApplication,
    didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return true
  }

  // MARK: - UISceneSession Lifecycle

  func application(
    _: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options _: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
}
