//
//  RatingViewController.swift
//  Quiz_Itea
//
//  Created by Anastasia Bilous on 2022-06-13.
//

import UIKit

class RatingViewController: UIViewController {
    
    @IBOutlet weak var ratingTableView: UITableView!
    
    var ratingParticipant = [Rating]()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        ratingParticipant = UserDefaultsManager.shared.getValueForRating() ?? [Rating]()
        ratingTableView.delegate = self
        ratingTableView.dataSource = self
    }
    
    @IBAction func backToStart(_ sender: Any) {
        let startQuizViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartQuizViewController") as? StartQuizViewController
        self.navigationController?.pushViewController(startQuizViewController!,
                                                      animated: true)
    }
}

extension RatingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            ratingParticipant.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaultsManager.shared.setValueForRating(value: ratingParticipant)
            tableView.endUpdates()
        }
    }
}

extension RatingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratingParticipant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingQuizTableViewCell", for: indexPath) as? RatingQuizTableViewCell
        
        cell?.nameParticipantLabel.text = ratingParticipant[indexPath.row].name
        cell?.scoreParticipantLabel.text = ratingParticipant[indexPath.row].score + "%"   
        return cell ?? UITableViewCell()
    }
}
