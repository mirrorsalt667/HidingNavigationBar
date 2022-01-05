//
//  SecondPageViewController.swift
//  HidingNavigationBar
//
//  Created on 2022/1/5.
//

import UIKit

class SecondPageViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var downLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var redView: UIView!
    
    var startNum: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        startNum = scrollView.contentOffset.y
        naviStyle()
        itemLayout()
    }
    
    @IBAction func backButton(_ sender: Any) {
        //pop回前頁
        navigationController?.popViewController(animated: true)
    }
    
    func itemLayout() {
        
        let height = UIScreen.main.bounds.height
        let naviHeight = navigationController!.navigationBar.frame.height - CGFloat(5)
        let naviTop = navigationController!.navigationBar.frame.minY + CGFloat(2)
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        scrollView.contentLayoutGuide.owningView!.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.contentLayoutGuide.heightAnchor.constraint(equalToConstant: height + 300).isActive = true
        
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        topView.backgroundColor = UIColor.darkGray
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: naviTop).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: naviHeight).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: naviHeight - CGFloat(2)).isActive = true
        backButton.setImage(UIImage(named: "icons8-back-24.png"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.tintColor = UIColor.black
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 15).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor, constant: 15).isActive = true
        labelStyle(label: topLabel, text: "果思設計")
        topLabel.font = UIFont.boldSystemFont(ofSize: 20)

        downLabel.translatesAutoresizingMaskIntoConstraints = false
        downLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10).isActive = true
        downLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor).isActive = true
        labelStyle(label: downLabel, text: "iOS APP")
        
        dogImageView.translatesAutoresizingMaskIntoConstraints = false
        dogImageView.topAnchor.constraint(equalTo: topView.topAnchor,constant: -naviTop).isActive = true
        dogImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        dogImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
        dogImageView.heightAnchor.constraint(equalToConstant: 300+naviTop).isActive = true
        dogImageView.image = UIImage(named: "dog.jpeg")
        dogImageView.contentMode = .scaleAspectFill
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -50).isActive = true
        redView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        redViewStyle()
//        redView.backgroundColor = UIColor.red
//        redView.layer.cornerRadius = 45
//        redView.layer.maskedCorners = [.layerMaxXMinYCorner]
    }
    
    func naviStyle() {
        self.navigationItem.title = "果思設計"
        navigationController?.navigationBar.alpha = 0
    }
    func labelStyle(label: UILabel, text: String) {
        label.text = text
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20)
    }
    func redViewStyle() {
        redView.backgroundColor = UIColor.red
        redView.layer.cornerRadius = 45
        redView.layer.maskedCorners = [.layerMaxXMinYCorner]
    }
}

extension SecondPageViewController: UIScrollViewDelegate {
    //捲動時改變透明度
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        let nowOffset = scrollView.contentOffset.y
        let heightPrecent = CGFloat(250)/CGFloat(100)
        let reduceNum = nowOffset - startNum
        let whiteAlphaNum = reduceNum/heightPrecent/100
        let blackAlphaNum = CGFloat(1) - whiteAlphaNum
        navigationController?.navigationBar.alpha = whiteAlphaNum
        topView.alpha = blackAlphaNum
    }
}
