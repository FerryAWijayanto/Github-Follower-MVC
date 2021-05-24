//
//  FollowersListVC.swift
//  Github Follower MVC
//
//  Created by Ferry Adi Wijayanto on 02/05/21.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
