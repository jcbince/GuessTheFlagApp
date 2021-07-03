//
//  ViewController.swift
//  GuessTheFlagApp
//
//  Created by user198555 on 7/3/21.
//

import UIKit

class ViewController: UIViewController {
    //Mark: IBOutlet
    
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var myScore: UILabel!
    
    var countries = [String]()
    var score = 0
    
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        
        
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.red.cgColor
        button3.layer.borderColor = UIColor.blue.cgColor
        
        
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
       
        
        
    }
    
    //Mark: IBOActions
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer
        {
            title = "Correct"
            score += 1
            myScore.text = "\(score)"
            if (score > 9) {
                let ac = UIAlertController(title: title, message: "CONGRATZ YOUR SCORE IS:  \(score).", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
            }
        } else {
        
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    
    
    
    
    


}

