//
//  TabBarController.swift
//  ScrollTextFieldsUp
//
//  Created by eric yu on 5/14/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let nc1: UINavigationController = {
            
            let nc = UINavigationController(rootViewController: ScrollViewController())
            
            nc.tabBarItem.image = #imageLiteral(resourceName: "eye")
            return nc
        }()
      

        tabBar.tintColor = .black
        viewControllers = [nc1]
        
    }
 

}
