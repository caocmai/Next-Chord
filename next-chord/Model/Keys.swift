//
//  Keys.swift
//  next-chord
//
//  Created by Cao Mai on 3/17/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import Foundation

struct KeySignature {
    
    //    var I : String
    //    var ii : String
    //    var iii : String
    //    var IV : String
    //    var V : String
    //    var vi : String
    //    var viio : String
    var keySignatureName : String?
    var chord1 : String?
    var chord2 : String?
    var chord3 : String?
    var chord4 : String?
    var chord5 : String?
    
    var allChords = [String:String]()
    
    mutating func getProgessiveChords(input1: String, input2: String, input3: String, input4: String?=nil, input5: String?=nil) {
        
        self.chord1 = allChords[input1]
        self.chord2 = allChords[input2]
        self.chord3 = allChords[input3]
//        self.chord4 = allChords[input4]
        
        if let d = input4 {
            self.chord4 = allChords[d]
        } else {}
        
        if let e = input5 {
            self.chord5 = allChords[e]
        } else {}
    }
}

struct SetLabel {
    var firstLabel : String
    var secondLabel : String
    var thirdLabel : String
    var fourthLabel : String?
    var fithLabel : String?
}
