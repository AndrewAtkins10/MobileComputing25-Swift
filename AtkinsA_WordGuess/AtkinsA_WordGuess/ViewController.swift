//
//  ViewController.swift
//  AtkinsA_WordGuess
//
//  Created by Andrew Atkins on 3/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordGuessedLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var totalWordsLabel: UILabel!
    @IBOutlet weak var userGuessLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var guessLetterButtonPressed: UIButton!
    @IBOutlet weak var playAgainButtonPressed: UIButton!
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var guessLetterField: UITextField!
    let maxNumOfWrongGuesses = 10
    var words = ["SWIFT", "IOS", "APPLE", "XCODE", "MAC"]
    var hints = ["Language","Apples framework", "Iphone", "Swift","Apple Laptop"]
    var currentWordIndex = 0
    var currentWord = ""
    var guessedLetters: [Character] = []
    var wrongGuesses = 0
    var wordsGuessed = 0
    var wordsRemaining = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }
    func setupGame() {
        wordsRemaining = words.count
        totalWordsLabel.text = "Total number of words in game: \(words.count)"
        wordsRemainingLabel.text = "Total number of words remaining in game: \(wordsRemaining)"
        wordGuessedLabel.text = "Total number of words guessed succesfully:  \(wordsGuessed)"
        
        startNewWord()
    }
    
    func startNewWord() {
        guard currentWordIndex < words.count else {
            statusLabel.text = "Congratulations! You’ve completed the game. Press Play Again to restart."
            playAgainButtonPressed.isEnabled = true
            playAgainButtonPressed.isHidden = false
            return
        }
        
        currentWord = words[currentWordIndex]
        guessedLetters = Array(repeating: "_", count: currentWord.count)
        wrongGuesses = 0
        hintLabel.text = "Hint: \(hints[currentWordIndex])"
        displayImage.image = UIImage(named: "")
        playAgainButtonPressed.isEnabled = true
        playAgainButtonPressed.isHidden = false
        updateUI()
    }
    
    func updateUI() {
        userGuessLabel.text = String(guessedLetters)
        guessCountLabel.text = "You have Made \(wrongGuesses) Guesses"
        hintLabel.text = "Hint: \(hints[wordsGuessed]) "
        wordsRemainingLabel.text = "Total number of words remaining in game: \(wordsRemaining)"
        wordGuessedLabel.text = "Total number of words guessed succesfully: \(wordsGuessed)"
        
        if guessedLetters == Array(currentWord) || wrongGuesses >= maxNumOfWrongGuesses {
            playAgainButtonPressed.isEnabled = true
            playAgainButtonPressed.isHidden = false
            }
    }
    func moveToNextWord() {
        if wordsGuessed == words.count {
            restartGame()
        }
        else {
            currentWordIndex += 1
            startNewWord()
            playAgainButtonPressed.isEnabled = true
            playAgainButtonPressed.isHidden = false
        }
    }
    func restartGame() {
        currentWordIndex = 0
        wordsGuessed = 0
        wordsRemaining = words.count
        wrongGuesses = 0
        guessedLetters = []
        
        statusLabel.text = "Game restarted! Try guessing a new word."
        displayImage.image = UIImage(named: "")
        playAgainButtonPressed.isEnabled = false
        playAgainButtonPressed.isHidden = true
        
        setupGame()
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        if let text = sender.text, !text.isEmpty {
            guessLetterButtonPressed.isEnabled = true
            sender.text = String(text.last!)
        }
        else {
            guessLetterButtonPressed.isEnabled = false
        }
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guard let letter = guessLetterField.text?.last
        else {
            return }
        
        var correctGuess = false
        for (index, char) in currentWord.enumerated() {
            if char == letter {
                guessedLetters[index] = char
                correctGuess = true
            }
        }
        
        if !correctGuess {
            wrongGuesses += 1
            statusLabel.text = "Wrong guess. Try again."
        }
        else {
            statusLabel.text = "Good guess! Keep going."
        }
        
        if guessedLetters == Array(currentWord) {
            wordsGuessed += 1
            wordsRemaining -= 1
            statusLabel.text = "You've guessed it correctly! '\(currentWord)' 🎉"
            displayImage.image = UIImage(named: currentWord.lowercased()) //
            playAgainButtonPressed.isEnabled = true
            playAgainButtonPressed.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {             self.moveToNextWord()
            }
        }
        
        if wrongGuesses >= maxNumOfWrongGuesses {
            statusLabel.text = "You have used all the available guesses, Please play again"
            playAgainButtonPressed.isEnabled = true
            playAgainButtonPressed.isHidden = false
        }
        
        updateUI()
        guessLetterField.text = ""
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        restartGame()
    }
}
