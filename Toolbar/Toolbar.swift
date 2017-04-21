//
//  Toolbar.swift
//  Toolbar
//
//  Created by 1amageek on 2017/04/20.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import UIKit

class Toolbar: UIView {
    
    static let defaultHeight: CGFloat = 44
    
    private(set) var items: [ToolbarItem] = []

    convenience init() {
        let frame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Toolbar.defaultHeight)
        self.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(stackView)
        self.backgroundColor = .green
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 
    
    func setItems(_ items: [UIView], animated: Bool) {
        self.stackView.arrangedSubviews.forEach { (view) in
            self.stackView.removeArrangedSubview(view)
        }
        items.forEach { (view) in
            self.stackView.addArrangedSubview(view)
        }
    }
    
    // MARK: -
    
    private(set) lazy var stackView: UIStackView = {
        let view: UIStackView = UIStackView(frame: self.bounds)
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillProportionally
        view.alignment = .bottom
        view.spacing = 0
        return view
    }()

}