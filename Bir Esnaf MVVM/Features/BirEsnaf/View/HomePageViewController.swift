//
//  HomePageViewController.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 15.04.2024.
//

import UIKit
import SnapKit

class HomePageViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()

        self.tabBar.tintColor = UIColor(named: "customColor")
        self.navigationItem.titleView?.tintColor = UIColor(named: "customColor2") // olmadı
    }
    
    
    private func setupTabs() {
        
        let productTableVC = self.createNavigationVC(with: "Product", and: UIImage(systemName: "square.3.layers.3d.down.left"), vc: ProductViewController())
        let companyTableVC = self.createNavigationVC(with: "Company", and: UIImage(systemName: "person.line.dotted.person"), vc: CompanyViewController())
        let shopVC = self.createNavigationVC(with: "Shop", and: UIImage(systemName: "cart.fill"), vc: ShopViewController())
        let settingVC = self.createNavigationVC(with: "Setting", and: UIImage(systemName: "gearshape"), vc: SettingViewController())
        
        self.setViewControllers([productTableVC, companyTableVC, shopVC, settingVC], animated: true)
    }
    
    private func createNavigationVC(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        nav.viewControllers.first?.navigationItem.title = title
        nav.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "customColor2")!]
        return nav
    }

}
