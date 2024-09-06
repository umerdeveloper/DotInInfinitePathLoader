//
//  ViewController.swift
//  DotInInfinitePathLoader
//
//  Created by Umer Personal on 06.09.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let customLoader = DotInfinitePathLoader(frame: .init(x: 0, y: 0, width: 256, height: 256))
        view.addSubview(customLoader)
    }
}

