//
//  ResultsCell.swift
//  GameMillionPatterns
//
//  Created by Igor Polousov on 15.03.2022.
//

import UIKit

final class ResultsCell: UITableViewCell {
    var scoreLabel = TitleLabel(color: .lightYellow, size: 18)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            scoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            scoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            scoreLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
