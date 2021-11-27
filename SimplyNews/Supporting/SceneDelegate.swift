//
//  SceneDelegate.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/3/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let mainViewController = MainViewController()
        let navigation = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }

    
    func sceneDidDisconnect(_ scene: UIScene) {}

    
    func sceneDidBecomeActive(_ scene: UIScene) {}

    
    func sceneWillResignActive(_ scene: UIScene) {}

    
    func sceneWillEnterForeground(_ scene: UIScene) {}

    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

