//
//  FirstPageViewController.swift
//  HidingNavigationBar
//
//  Created on 2022/1/5.
//

import UIKit

class FirstPageViewController: UIViewController {

    
    @IBOutlet weak var nextPageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLayout(nextPageButton)
        buttonStyle(nextPageButton)
    }
    
    

    @IBAction func nextPageButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SecondPageViewController")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    func buttonLayout(_ button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func buttonStyle(_ button: UIButton) {
        button.layer.backgroundColor = UIColor.black.cgColor
        button.setTitle("下一頁", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
    }
}
