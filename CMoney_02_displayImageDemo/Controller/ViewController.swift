//
//  ViewController.swift
//  CMoney_02_displayImageDemo
//
//  Created by 張彩虹 on 2020/8/6.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "JSON Placeholder"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var requestButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Request API", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(requestButtonPressed(_:)) , for: .touchUpInside)
        return button
    }()
    
    let viewModel = ViewControllerViewModel()
    
    //MARK: - UI - Action
    @objc func requestButtonPressed(_ sender: UIButton){
        let photosViewController = PhotosViewController()
        self.navigationController?.pushViewController(photosViewController, animated: true)
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(requestButton)
        
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 150).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        requestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        requestButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
}

