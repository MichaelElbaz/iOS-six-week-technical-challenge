//
//  ArrayController.swift
//  randomNameGen
//
//  Created by Michael Elbaz on 11/18/15.
//  Copyright © 2015 elboss-apps. All rights reserved.
//

import Foundation
class  PersonController  {
    
    static let sharedInstance = PersonController()
    private let kPeople = "people"
    
    var people: [ArrayView] = []
    
    init() {
        self.people = []
        self.loadFromPersistentStorage()
    }
    
    func randomizePairs() {
        let numPeople = self.people.count
        let numPairs = numPeople / 2
        
        self.people.MixIt()
        
        if numPeople % 2 == 0 {
            var index = 0
            for pair in 1...numPairs {
                let person1 = self.people[index]
                index++
                let person2 = self.people[index]
                index++
                
                person1.pairNumber = pair
                person2.pairNumber = pair
            }
        } else {
            var index = 0
            for pair in 1...numPairs {
                let person1 = self.people[index]
                index++
                let person2 = self.people[index]
                index++
                
                person1.pairNumber = pair
                person2.pairNumber = pair
            }
            let oddPerson = self.people[numPeople - 1]
            oddPerson.pairNumber = numPairs + 1
        }
    }
    func removePerson(person: ArrayView) {
        if let index = people.indexOf(person) {
            people.removeAtIndex(index)
        }
        self.saveToPersistentStorage()
    }
    func saveToPersistentStorage() {
        let peopleDictionary = people.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setValue(peopleDictionary, forKey: kPeople)
        
    }

    func addPerson(person: ArrayView) {
        people.append(person)
        self.saveToPersistentStorage()
    }
    
        
      
    func loadFromPersistentStorage() {
        let peopleDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kPeople) as? [Dictionary<String, AnyObject>]
        
        if let peopleDictionary = peopleDictionariesFromDefaults {
            self.people = peopleDictionary.flatMap({ArrayView(dictionary: $0)})
        }
    }
    
}

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func MixIt()
    {
        for _ in 0..<10
        {
            sortInPlace { (_,_) in arc4random() < arc4random() }
        }
    }
}