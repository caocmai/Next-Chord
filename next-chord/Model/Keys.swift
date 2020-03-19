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
        
//        if let a = input1 {
//            self.chord1 = allChords[a]
//        }else {}
//
//        if let b = input2 {
//            self.chord2 = allChords[b]
//        }else {}
//
//        if let c = input3 { c
//            self.chord3 = allChords[c]
//        } else {}
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
    
    
    func getProgessiveChords22 (input1: String?, input2: String?, input3: String?=nil, input4: String?=nil) -> [String] {
        
        var array : [String] = []
        
        if let a = input1 {
            array.append(allChords[a]!)
        }
        
        if let b = input2 {
            array.append(allChords[b]!)
        }else {
        }
        
        if let c = input3 {
            array.append(allChords[c]!)
        }else {
        }
        
        if let d = input4 {
            array.append(allChords[d]!)
        }else {
        }
        
        return array
        
    }
    
}

struct SetLabel {
    var firstLabel : String
    var secondLabel : String
    var thirdLabel : String
    var fourthLabel : String?
    var fithLabel : String?
}


struct MinorKeys {
    
}

//let e = MajorKeys(I: "E", ii: "F#m", iii: "G#m", IV: "A", V: "B", vi: "C#m", viio: "D#o")


//var e = MajorKeys(allChords: ["I":"E", "ii": "F#m", "iii": "G#m", "IV": "A", "V": "B", "vi": "C#m", "viio": "D#o"])
//
//e.getProgessiveChords2(input1: "I", input2: "ii")
//print(e.chord1)
//print(e.chord2)
//
//let newArray = [["V", "ii"], ["ii", "V"]]
//var obj = [MajorKeys]()
//for i in 0..<newArray.count {
//
//    var new = MajorKeys(allChords: ["I":"E", "ii": "F#m", "iii": "G#m", "IV": "A", "V": "B", "vi": "C#m", "viio": "D#o"])
//    new.getProgessiveChords2(input1: newArray[0][i], input2: newArray[1][i])
//    obj.append(new)
//
//
//}
//
//print(obj[0])
