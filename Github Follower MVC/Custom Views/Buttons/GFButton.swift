//
//  GFButton.swift
//  Github Follower MVC
//
//  Created by Ferry Adi Wijayanto on 02/05/21.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor    = backgroundColor
        
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius      = 10
        titleLabel?.textColor   = .white
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
    }
    
}
