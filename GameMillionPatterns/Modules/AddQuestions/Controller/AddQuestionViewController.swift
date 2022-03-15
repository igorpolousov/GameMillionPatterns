//
//  AddQuestionViewController.swift
//  GameMillionPatterns
//
//  Created by Igor Polousov on 15.03.2022.
//

import UIKit

final class AddQuestionViewController: UIViewController {
    
    private let addQuestionView = AddQuestionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = addQuestionView
        addQuestionView.viewDelegate = self
    }
    
}

extension AddQuestionViewController: AddQuestionViewDelegate {
    func didPressSave(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
