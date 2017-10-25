//
//  ForeCastCoordinator.swift
//  WeatherLondon
//
//  Created by Pablo Roca Rozas on 25/9/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit

final class ForeCastCoordinator: Coordinator {
    
    fileprivate let navigationController:UINavigationController
    fileprivate let myViewController:ForeCastViewController
    
    fileprivate var isaccountsViewController:Bool {
        guard let _ = navigationController.topViewController?.isKind(of: ForeCastViewController.self) else { return false }
        return true
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let viewModel = ForeCastViewModel()
        self.myViewController = ForeCastViewController(viewModel: viewModel)
    }
    
    deinit {
        print("deallocing \(self)")
    }
    
    func start() {
        
        guard let topViewController = navigationController.topViewController else {
            return navigationController.setViewControllers([myViewController], animated: false)
        }
        
        //simple animation function
        myViewController.view.frame = topViewController.view.frame
        UIView.transition(from:topViewController.view , to: myViewController.view, duration: 0.50, options: .transitionCrossDissolve) {[unowned self] (finished) in
            self.navigationController.setViewControllers([self.myViewController], animated: false)
        }
        
    }
    
//    fileprivate func showXXXViewController() {
//        let viewModel = XXXViewModel()
//        let viewController = XXXViewController(viewModel: viewModel)
//        navigationController.show(viewController, sender: self)
//    }
    
}
