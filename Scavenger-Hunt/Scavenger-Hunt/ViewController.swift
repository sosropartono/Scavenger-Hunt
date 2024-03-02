//
//  ViewController.swift
//  Scavenger-Hunt
//
//  Created by William Sosropartono on 3/1/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let hostingController = UIHostingController(rootView: TaskListView())
        hostingController.view.frame = UIScreen.main.bounds
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
