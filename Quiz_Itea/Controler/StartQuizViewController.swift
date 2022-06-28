//
//  ViewController.swift
//  Quiz_Itea
//
//  Created by Anastasia Bilous on 2022-06-13.
//

import UIKit
import Foundation

class StartQuizViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var ratingButton: UIButton!
    
    var nameParticipantTextField: UITextField?
    var sendName = String()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func showPopUp() {
        let alertVC = UIAlertController(title: "Please enter your name",
                                        message: "",
                                        preferredStyle: .alert)
        let cancelAction = UIAlertAction (title: "Cancel",
                                          style: .cancel) { UIAlertAction in
            self.dismiss(animated: true,
                         completion: nil
            )}
        let startAction = UIAlertAction (title: "Start",
                                         style: .default) { [self]
            (action) -> Void in
            
            if nameParticipantTextField?.text?.isEmpty == true {
                Alert.showBasic(title: "Please enter required information!",
                                message: "",
                                vc: self)
            } else {
                sendName = self.nameParticipantTextField?.text ?? ""
                
                let quizViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController
                
                quizViewController?.nameFromStart = sendName
                self.navigationController?.pushViewController(quizViewController!, animated: true)
            }
        }
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(startAction)
        alertVC.preferredAction = startAction
        
        alertVC.addTextField {
            (nameTextField) -> Void in
            self.nameParticipantTextField = nameTextField
            self.nameParticipantTextField!.placeholder = "Name participant"
           
        }
        present(alertVC, animated: true, completion: nil)
        alertVC.removeFromParent()
    }
    
    @IBAction func startQuizButton(_ sender: Any) {
        showPopUp()
    }
    
    @IBAction func ratingQuizButton(_ sender: Any) {
        let ratingViewController = self.storyboard?.instantiateViewController(withIdentifier: "RatingViewController") as? RatingViewController
        self.navigationController?.pushViewController(ratingViewController!,
                                                      animated: true)
    }   
}

