//
//  StackScrollView.swift
//  ScrollStackView
//
//  Created by Tiz on 23/7/20.
//  Copyright © 2020 Software. All rights reserved.
//

import UIKit

final class ScrollStackView: UIView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.layoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        self.addSubview(scrollView)
        
        let bottomStackView = UIStackView(frame: .zero)
        bottomStackView.axis = .vertical
        bottomStackView.distribution = .fill
        bottomStackView.addArrangedSubview(bottomLable)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor)
        ])
        
        let heightConstraintBottomStackView = bottomStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
              heightConstraintBottomStackView.priority = .defaultLow
        NSLayoutConstraint.activate([
            bottomStackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            heightConstraintBottomStackView
            
        ])
        
        
        self.contentStackView.addArrangedSubview(self.lable)
        
        self.containerStackView.addArrangedSubview(self.contentStackView)
        scrollView.addSubview(self.containerStackView)
        
        let heightConstraint = self.containerStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([self.containerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     self.containerStackView.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor),
                                     self.containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     self.containerStackView.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor),
                                     heightConstraint])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var lable: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label Label"
        return label
    }()
    
    private lazy var bottomLable: UILabel = {
           let label = UILabel(frame: .zero)
           label.textAlignment = .center
           label.adjustsFontForContentSizeCategory = true
           label.numberOfLines = 0
           label.font = UIFont.preferredFont(forTextStyle: .title1)
           label.setContentCompressionResistancePriority(.required, for: .vertical)
           label.text = "Bottom Label"
           return label
       }()
}
