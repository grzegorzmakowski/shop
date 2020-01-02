//
//  SceneDelegate.swift
//  Shop
//
//  Created by Grzegorz Makowski on 28/12/2019.
//  Copyright © 2019 Grzegorz Makowski. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let appCoordinator: AppCoordinator = AppCoordinator(window: window, application: Application())
        appCoordinator.start()
        self.window = window
        self.appCoordinator = appCoordinator
    }
}
