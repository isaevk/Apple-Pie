//
//  Game.swift
//  Apple Pie
//
//  Created by Kirill Dev on 05.08.2022.
//


struct Game{
    var word: String
    var incorrectMovesRemaining: Int
    fileprivate var guessedLetters = [Character]()
    
    var guessedWord: String {
        var wordToShow = ""
        for letter in word {
            if guessedLetters.contains(Character(letter.lowercased())){
                wordToShow += String(letter)
            } else {
                wordToShow += "_"
            }
        }
        return wordToShow
    }
    
    init(word: String, incorrectMovesRemaining: Int){
        self.incorrectMovesRemaining = incorrectMovesRemaining
        self.word = word
    }
    
    mutating func playerGuessed(letter: Character){
        let lowercasedLetter = Character(letter.lowercased())
        guessedLetters.append(lowercasedLetter)
        if !word.lowercased().contains(lowercasedLetter){
            incorrectMovesRemaining -= 1
        }
    }
}
