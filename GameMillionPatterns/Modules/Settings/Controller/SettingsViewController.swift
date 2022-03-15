//
//  SettingsViewController.swift
//  GameMillionPatterns
//
//  Created by Igor Polousov on 15.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let settingsView = SettingsView()

    override func viewDidLoad() {
        super .viewDidLoad()
        view = settingsView
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            Game.shared.gameStrategy = settingsView.selectedStrategy ?? Regular()
        }
    }
}
