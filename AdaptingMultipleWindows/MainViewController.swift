//
//  MainViewController.swift
//  AdaptingMultipleWindows
//
//  Created by Vladimir Butko on 2022-01-16.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    private func configureViewController() {
        title = "Main View Controller"
        view.backgroundColor = .systemBackground
        addNavBarButtons()
    }
    
    private func addNavBarButtons() {
        let addNewWindowButton = UIBarButtonItem(image: UIImage(systemName: "macwindow.badge.plus"), primaryAction: UIAction(handler: { [unowned self] (_) in
            self.requestNewWindow()
        }))
        
        let addNewTaskButton = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { [unowned self] (_) in
            self.requestNewTaskWindow()
        }))
        
        navigationItem.rightBarButtonItems = [addNewTaskButton, addNewWindowButton]
    }
    
    private func requestNewWindow() {
        UIApplication.shared.requestSceneSessionActivation(nil, userActivity: nil, options: nil) { error in
            // handle errors
        }
    }

    private func requestNewTaskWindow() {
        let activity = NSUserActivity(activityType: "NewTaskWindow")
        
        UIApplication.shared.requestSceneSessionActivation(nil, userActivity: activity, options: nil) { (error) in
            // handle errors
        }
    }
}
