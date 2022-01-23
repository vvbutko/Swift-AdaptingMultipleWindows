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
        configureMacWindowSize()
        configureToolbar()
        #endif
    }
    
    #if targetEnvironment(macCatalyst)
    
    private func configureMacWindowSize() {
        guard let window = window else { return }
        
        let fixedSize = CGSize(width: 400, height: 250)
        window.windowScene?.sizeRestrictions?.minimumSize = fixedSize
        window.windowScene?.sizeRestrictions?.maximumSize = fixedSize
    }
    
    private func configureToolbar() {
        let toolbar = NSToolbar()
        toolbar.showsBaselineSeparator = false
        
        if let titlebar = window?.windowScene?.titlebar {
            titlebar.toolbar = toolbar
            titlebar.toolbarStyle = .automatic
            titlebar.titleVisibility = .visible
        }
    }
    #endif
}
