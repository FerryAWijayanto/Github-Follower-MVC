//
//  GFBodyLabel.swift
//  Github Follower MVC
//
//  Created by Ferry Adi Wijayanto on 02/05/21.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment  = textAlignment
        configure()
    }
    
    private func configure() {
        textColor                                   = .secondaryLabel
        font                                        = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth                   = true
        minimumScaleFactor                          = 0.75
        lineBreakMode                               = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints   = false
    }
}
