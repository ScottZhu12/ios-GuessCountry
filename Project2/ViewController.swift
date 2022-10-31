//
//  ViewController.swift
//  Project2
//
//  Created by Scott Zhu on 2022-10-29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var maxQuestions = 10
    var questionCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        var buttonOneImage:UIImage = UIImage(named: countries[0])!
        buttonOneImage = buttonOneImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        var buttonTwoImage:UIImage = UIImage(named: countries[1])!
        buttonTwoImage = buttonTwoImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        var buttonThreeImage:UIImage = UIImage(named: countries[2])!
        buttonThreeImage = buttonThreeImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        button1.setImage(buttonOneImage, for: .normal)
        button2.setImage(buttonTwoImage, for: .normal)
        button3.setImage(buttonThreeImage, for: .normal)
        correctAnswer = Int.random(in: 0...2)
        
        title = "Score: \(score) \(countries[correctAnswer].uppercased())"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        questionCounter += 1
        
        if questionCounter == maxQuestions {
            let ac = UIAlertController(title: "\(questionCounter) answered", message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            score = 0
            questionCounter = 0
        } else {
            if title == "Wrong" {
                let ac = UIAlertController(title: "Oh no", message: "That's the flag of \(countries[sender.tag].uppercased()).", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
            } else {
                askQuestion()
            }
        }
    }
    
}

