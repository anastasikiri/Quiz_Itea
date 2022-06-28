//
//  AnswersViewController.swift
//  Quiz_Itea
//
//  Created by Anastasia Bilous on 2022-06-13.
//

import UIKit

class AnswersViewController: UIViewController {
    
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var yourSavedAnswers = [String]()
    var yourScore = Int()
    var name = String()
    var percentageScore = Float()
    var participant = Rating()
    var ratingParticipant = [Rating]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        answersTableView.delegate = self
        answersTableView.dataSource = self
        scoreLabel.text = "Your score: \(percentageScoreQuiz())%"
        ratingParticipant = UserDefaultsManager.shared.getValueForRating() ?? [Rating]()
    }
    
    @IBAction func finisheSaveButton(_ sender: Any) {
        let ratingViewController = self.storyboard?.instantiateViewController(withIdentifier: "RatingViewController") as? RatingViewController
        
        participant = Rating(name: name, score: percentageScoreQuiz())
        ratingParticipant.append(participant)
        UserDefaultsManager.shared.setValueForRating(value: ratingParticipant)
        self.navigationController?.pushViewController(ratingViewController!,
                                                      animated: true)
    }
    
    @IBAction func tryAgainQuizButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func percentageScoreQuiz() -> String {
        percentageScore = Float(yourScore) / Float(yourSavedAnswers.count) * 100
        return String(format: "%.0f", percentageScore)
    }
}

extension AnswersViewController: UITableViewDelegate {
    
}

extension AnswersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuizBrain.shared.quiz.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersVerificationTableViewCell", for: indexPath) as? AnswersVerificationTableViewCell
        
        cell?.questionLabel.text = "\(indexPath.row + 1). " + QuizBrain.shared.quiz[indexPath.row].question
        
        cell?.correctAnswerLabel.text = "Correct answer: " + QuizBrain.shared.quiz[indexPath.row].correctAnswer
        
        cell?.yourAnswerLabel.text = "Your answer: " + yourSavedAnswers[indexPath.row]
        
        if QuizBrain.shared.quiz[indexPath.row].correctAnswer == yourSavedAnswers[indexPath.row] {
            cell?.yourAnswerLabel.backgroundColor = .systemTeal
        } else {
            cell?.yourAnswerLabel.backgroundColor = .systemPurple
        }
        return cell ?? UITableViewCell()
    }
}

