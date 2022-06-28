//
//  UserDefaultsManager.swift
//  Quiz_Itea
//
//  Created by Anastasia  Bilous on 2022-06-19.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
  
    func setValueForRating(value: [Rating]?) {        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: "SaveRating")
    }
    
    func getValueForRating() -> [Rating]? {
        var rating = [Rating]()
        if let data = UserDefaults.standard.value(forKey:"SaveRating") as? Data {
            rating = try! PropertyListDecoder().decode(Array<Rating>.self, from: data)
        }
        return rating
    }
}
