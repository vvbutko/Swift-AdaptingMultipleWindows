//
//  NewTaskSceneDelegate.swift
//  AdaptingMultipleWindows
//
//  Created by Vladimir Butko on 2022-01-16.
//

import UIKit
import SwiftUI

class NewTaskSceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let newTaskScreen = NewTaskScreen()
        let hostingController = UIHostingController(rootView: newTaskScreen)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = hostingController
        window.windowScene?.title = "New Task"
        window.makeKeyAndVisible()
        
        self.window = window
        
        #if targetEnvironment(macCatalyst)
        configureMacWindowsSize(scene)
        #endif
    }
    
    #if targetEnvironment(macCatalyst)
    private func configureMacWindowsSize(_ scene: UIScene) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let fixedSize = CGSize(width: 400, height: 250)
        windowScene.sizeRestrictions?.minimumSize = fixedSize
        windowScene.sizeRestrictions?.maximumSize = fixedSize
    }
    #endif
}
