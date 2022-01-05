//
//  NavigationViewController.swift
//  HidingNavigationBar
//
//  Created on 2022/1/5.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviBarStyle()
    }
    
    func naviBarStyle() {
        navigationBar.tintColor = UIColor.black
        navigationBar.topItem?.backButtonTitle = " "
    }
}
