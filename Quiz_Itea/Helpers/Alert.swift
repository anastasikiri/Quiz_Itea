//
//  Alert.swift
//  Quiz_Itea
//
//  Created by Anastasia  Bilous on 2022-06-20.
//

import Foundation
import UIKit

class Alert {
    
  static func showBasic(title: String, message:String, vc: UIViewController){
        let alert = UIAlertController (title: title, message: message,preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert,animated: true)
    }
}
