//
//  SearchVC.swift
//  Github Follower MVC
//
//  Created by Ferry Adi Wijayanto on 02/05/21.
//

import UIKit

class SearchVC: UIViewController {
    
    let iconImageView = UIImageView()
    let searchTextField = GFTextField()
    let calloutBtn = GFButton(backgroundColor: .systemGreen, title: "Get followers")
    
    var isUsernameEntered: Bool { return !searchTextField.text!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setupImageView()
        setupTextfield()
        setupCalloutBtn()
        dismissTextfieldWithTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc func pushFollowersListVC() {
        guard isUsernameEntered else {
            print("No username")
            presentGFAlertOnMainThread(title: "Empty username", message: "Please enter a username. We need to know who to look for", buttonTitle: "Dismiss")
            return
        }
        
        let followerListVC      = FollowersListVC()
        followerListVC.username = searchTextField.text
        followerListVC.title    = searchTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    private func dismissTextfieldWithTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func setupImageView() {
        view.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = #imageLiteral(resourceName: "gh-logo-dark")
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 200),
            iconImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupTextfield() {
        view.addSubview(searchTextField)
        searchTextField.delegate = self
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 48),
            searchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 52),
            searchTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -52),
            searchTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private func setupCalloutBtn() {
        view.addSubview(calloutBtn)
        calloutBtn.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            calloutBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            calloutBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 52),
            calloutBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -52),
            calloutBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}
