//
//  ViewController.swift
//  ScrollStackView
//
//  Created by Kshitiz Ghimire on 23/7/20.
//  Copyright © 2020 Software. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    override func loadView() {
        let contentView = ScrollStackView()
        contentView.backgroundColor = .red
        self.view = contentView
    }
}
