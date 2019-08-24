//
//  ViewController.swift
//  Concentration
//
//  Created by Nicolai Vatne on 23/08/2019.
//  Copyright © 2019 Nicolai Vatne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1 / 2) )
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in Card Buttons Array")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 0) :  #colorLiteral(red: 0.9689339995, green: 1, blue: 0.500233233, alpha: 1)
            }
        }
    }

    var emojiChoices = ["👻","🎃","🎃","🕸","👻","🕸"]
    
    var emoji =  Dictionary<Int,String>()

    func emoji (for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
            
        
        /*if emoji[card.identifier] != nil {
            return emoji[card.identifier]
        } else {
        return "?"*/
        
        // Den over og den under er helt like
        
        return emoji[card.identifier] ?? "?"

    }
    @IBAction func newGameButton(_ sender: UIButton) {
        var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1 / 2) )
    }
    
}

