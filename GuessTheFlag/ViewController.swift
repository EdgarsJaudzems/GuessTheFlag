//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Edgars Jaudzems on 28/02/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
   
        if sender.tag == correctAnswer {
            title = "Correct"
            message = "Your score is \(score)"
            score += 1
            questionCount += 1
            
            if questionCount == 10 {
                title = "Final score"
                message = "After 10 games, your score is \(score)"
            }
        } else {
            title = "Wrong"
            message = "That’s the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            questionCount += 1
            
            if questionCount == 10 {
                title = "Final score"
                message = "After 10 games, your score is \(score)"
            }
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
        
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) | Your score: \(score)"
    }
    
    @objc func showScore() {
        let alert = UIAlertController(title: "Score", message: "Your score is: \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: .none))
        present(alert, animated: true)
    }
}

