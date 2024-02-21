//
//  ViewController.swift
//  TicTacToe
//
//  Created by SaiManasa on 10/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    var game = TicTacToe()
    var turn = 0
    var xTurn = true
    var done = false
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet var restart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (game.getBoardState(index: sender.tag) == -1) {
            done = game.updateBoard(index: sender.tag, xOrO: turn)
            if (xTurn == true) {
                sender.titleLabel?.font = UIFont.systemFont(ofSize: 90, weight: .semibold)
                sender.tintColor = UIColor.red
                sender.setTitle("X", for: .normal)
                turn = 1
                xTurn = false
            } else {
                sender.titleLabel?.font = UIFont.systemFont(ofSize: 90, weight: .semibold)
                sender.tintColor = UIColor.blue
                sender.setTitle("O", for: .normal)
                turn = 0
                xTurn = true
            }
        }
        if (done == true) {
            resetGame()
        }
    }
    
    func resetGame() {
        game.resetBoard()
        restart.isHidden = false
        for button in Buttons {
            button.isEnabled = false
        }
    }
    
    @IBAction func restartingGame(_ sender: Any) {
        for button in Buttons {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
        turn = 0
        xTurn = true
        done = false
        restart.isHidden = true
    }
}

