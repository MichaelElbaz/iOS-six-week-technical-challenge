//
//  ArrayView.swift
//  randomNameGen
//
//  Created by Michael Elbaz on 11/18/15.
//  Copyright © 2015 elboss-apps. All rights reserved.
//

import Foundation

class  ArrayView: Equatable {
    
    let nameKey = "name"
    let pairNumberKey = "pair"
    
    var name: String
    var pairNumber: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[nameKey] as? String,
            let pairNumber = dictionary[pairNumberKey] as? Int
            else {
                self.name = ""
                self.pairNumber = 1
                
                return nil
        }
        
        self.pairNumber = pairNumber
        self.name = name
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        let dictionary: [String: AnyObject] = [
            nameKey: name,
            pairNumberKey: pairNumber
        ]
        return dictionary
    }
    
    
}


func ==(lhs: ArrayView, rhs: ArrayView) -> Bool {
    return lhs.name == rhs.name
}