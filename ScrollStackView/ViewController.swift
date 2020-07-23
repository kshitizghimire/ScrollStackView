//
//  ViewController.swift
//  ScrollStackView
//
//  Created by Kshitiz Ghimire on 23/7/20.
//  Copyright © 2020 Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func loadView() {
          let contentView = ScrollStackView()
        contentView.backgroundColor = .red
        self.view = contentView
      }
    
}



class ScrollStackView: UIView {
    
    init() {
        super.init(frame: .zero)
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        ])
        
        self.contentStackView.setArrangedSubviews(
            [self.lable])
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
}


extension UIStackView {
    
    func setArrangedSubviews(_ views: [UIView]) {
        
        self.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
