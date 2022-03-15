//
//  GameViewController.swift
//  GameMillionPatterns
//
//  Created by Igor Polousov on 15.03.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    let gameView = GameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = gameView
        gameView.viewDelegate = self
        gameView.hintsControl.gameViewController = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Game.shared.startGame()
        gameView.setupLabels(for: Game.shared.questions[Game.shared.level])
        gameView.hintsControl.rebuildButtons()
        Game.shared.gameSession?.level.addObserver(self, options: [.new, .initial], closure: { [weak self] (level, _) in
            self?.gameView.progress.setProgress((Float(level) / Float(Game.shared.questions.count)), animated: true)
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            Game.shared.holdGame()
        }
    }
    
    // MARK: - Private methods
    
    private func endGame() {
        let ac = UIAlertController(title: "Игра Окончена", message: "Это был неправлиьный ответ, попробуйте еще раз ", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: showStartView))
        present(ac, animated: true)
    }
    
     private func showStartView(action: UIAlertAction) {
        Game.shared.endGame()
        navigationController?.popViewController(animated: true)
    }
    
    private func nextQuestion() {
        Game.shared.nextQuestion()
        gameView.setupLabels(for: Game.shared.questions[Game.shared.level])
    }

}

extension GameViewController: GameViewDelegate {
    func didPressAnswer(_ sender: AnswerButton) {
        Game.shared.checkUserAnswer(buttonPressedIndex: sender.index) && !Game.shared.isLastQuestion() ? nextQuestion() : endGame()
    }
}
