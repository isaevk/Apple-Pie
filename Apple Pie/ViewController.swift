//
//  ViewController.swift
//  Apple Pie
//
//  Created by Kirill Dev on 03.08.2022.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - IB Outlets
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - Properties
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    var listOfWords = [
        "Tokyo",
        "Delhi",
        "Shanghai",
        "São Paulo",
        "Mexico City",
        "Cairo",
        "Mumbai",
        "Beijing",
        "Dhaka",
        "Osaka",
        "New York",
        "Karachi",
        "Buenos Aires",
        "Chongqing",
        "Istanbul",
        "Calcutta",
        "Manila",
        "Lagos",
        "Rio de Janeiro",
        "Tianjin",
        "Kinshasa",
        "Guangzhou",
        "Los Angeles",
        "Moscow",
        "Shenzhen",
        "Lahore",
        "Bangalore",
        "Paris",
        "Bogota",
        "Jakarta",
        "Chennai",
        "Lima",
        "Bangkok",
        "Seoul",
        "Nagoya",
        "Hyderabad",
        "London",
        "Tehran",
        "Chicago",
        "Chengdu",
        "Nanjing",
        "Wuhan",
        "Ho Chi Minh City",
        "Luanda",
        "Ahmedabad",
        "Kuala Lumpur",
        "Xi'an",
        "Hong Kong",
        "Dongguan",
        "Hangzhou",
        "Foshan",
        "Shenyang",
        "Riyadh",
        "Baghdad",
        "Santiago",
        "Surat",
        "Madrid",
        "Suzhou",
        "Pune",
        "Harbin",
        "Houston",
        "Dallas",
        "Toronto",
        "Dar es Salaam",
        "Miami",
        "Belo Horizonte",
        "Singapore",
        "Philadelphia",
        "Atlanta",
        "Fukuoka",
        "Khartoum",
        "Barcelona",
        "Johannesburg",
        "St. Petersburg",
        "Qingdao",
        "Dalian",
        "Washington",
        "Yangon",
        "Alexandria",
        "Jinan",
    ]
    let totalwins =  0
    let totalLosses = 0
    // MARK: - Mathods
    func newRound(){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateCorrectWordName(){
        var displayWord = [String]()
        for letter in currentGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: " ")
    }
    
    
    func updateUI(){
        let movesRemaining = currentGame.incorrectMovesRemaining
        // let imageNumber = (movesRemaining + 64) % 8
        let image = "Tree\(movesRemaining < 0 ? 0 : movesRemaining < 8 ? movesRemaining: 7)"
        treeImageView.image = UIImage(named: image)
        updateCorrectWordName()
        scoreLabel.text = "Выигрыши:\(totalwins), проигыши:\(totalLosses)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    // MARK: - IB Actions

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateUI()
    }
}

