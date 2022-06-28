//
//  QuizViewController.swift
//  Quiz_Itea
//
//  Created by Anastasia Bilous on 2022-06-13.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
        
    var questionCount = 0
    var nameFromStart = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if questionCount < QuizBrain.shared.quiz.count {
            let userAnswer = sender.currentTitle!
            QuizBrain.shared.saveYoursAnswer(userAnswer: userAnswer)
            QuizBrain.shared.checkAnswer(userAnswer: userAnswer)
            sender.alpha = 0.75
            questionCount += 1
            
            if QuizBrain.shared.questionNumber + 1 < QuizBrain.shared.quiz.count {
                QuizBrain.shared.nextQuestion()
                Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            } else {
                Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
                return
            }
        } else {
            Alert.showBasic(title: "Please tap Submit",
                            message: "",
                            vc: self)
        }
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let answersViewController = self.storyboard?.instantiateViewController(withIdentifier: "AnswersViewController") as? AnswersViewController
        answersViewController?.yourSavedAnswers = QuizBrain.shared.yourAnswers
        answersViewController?.yourScore = QuizBrain.shared.score
        answersViewController?.name = nameFromStart
        self.navigationController?.pushViewController(answersViewController!,
                                                      animated: true)
        
        questionCount = 0
        QuizBrain.shared.questionNumber = 0
        QuizBrain.shared.score = 0
        QuizBrain.shared.yourAnswers = ["No answer", "No answer", "No answer", "No answer", "No answer", "No answer", "No answer", "No answer", "No answer", "No answer"]
        updateUI()
    }
    
    @objc func updateUI() {
        questionLabel.text = QuizBrain.shared.getQuestionText()
        
        let answerChoices = QuizBrain.shared.getAnswers()
        
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        choice4.setTitle(answerChoices[3], for: .normal)
        
        questionNumberLabel.text = QuizBrain.shared.getProgress()
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        choice4.backgroundColor = UIColor.clear
        
        choice1.alpha = 1
        choice2.alpha = 1
        choice3.alpha = 1
        choice4.alpha = 1
    }
}
