//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.

import CasePaths
import FavoritesFeature
import HomeFeature
import SwiftUI
import UIKit
import WordDefinitionFeature

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let delegate = UIApplication.shared.delegate as! AppDelegate

            let store = delegate.store.view(
                value: { v in HomeState(language: v.currentLanguage) },
                action: AppAction.home
            )
            let favoritesStore = delegate.store.view(
                value: { v in
                    FavoritesState(
                        language: v.currentLanguage,
                        favorites: v.favorites
                    )
                },
                action: AppAction.favorites
            )
            let wordStore = delegate.store.view(
                value: { v in WordState(word: nil, favorites: [:]) },
                action: AppAction.word
            )
            let rootView = HomeView(
                store: store,
                favoritesStore: favoritesStore,
                wordStore: wordStore
            )
            let hostingController = UIHostingController(rootView: rootView)
            window.rootViewController = hostingController
            window.makeKeyAndVisible()
            self.window = window
        }
    }
}
