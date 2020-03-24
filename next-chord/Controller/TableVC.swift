//
//  TableVC.swift
//  next-chord
//
//  Created by Cao Mai on 3/17/20.
//  Copyright © 2020 Make School. All rights reserved.
//
import AVFoundation
import UIKit

class TableVC: UIViewController {
    
    var player : AVAudioPlayer?
    var theKey : KeySignature?
    var minorKey : KeySignature?
    var progessiveChords = [KeySignature]()
    var allLabels = [SetLabel]()
    
    @IBOutlet weak var newTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newTableView.layer.cornerRadius = 7
        newTableView.delegate = self
        newTableView.dataSource = self
        updateHeader()
    }
    
    func updateHeader() {
        if theKey != nil {
            getMajorChords()
            navigationItem.title = (theKey?.keySignatureName!)! + " (Major)"
        } else {
            getMinorChords()
            navigationItem.title = (minorKey?.keySignatureName!)! + " (Minor)"
        }
    }
    
    func getMajorChords() {
        let threeChords = [["I", "IV", "V"],
                           ["ii", "V", "I"],
                           ["V", "IV", "I"],
        ]
        
        for i in 0..<threeChords.count {
            let labelOne = SetLabel(firstLabel: threeChords[i][0], secondLabel: threeChords[i][1], thirdLabel: threeChords[i][2])
            allLabels.append(labelOne)
            
            var new = theKey!
            new.getProgessiveChords(input1: threeChords[i][0], input2: threeChords[i][1], input3: threeChords[i][2])
            progessiveChords.append(new)
            
        }
        
        let fourChords = [["I", "vi", "IV", "V"],
                          ["I", "vi", "ii", "V"],
                          ["I", "V", "vi", "IV"],
                          ["I", "IV", "vi", "V"],
                          ["I", "iii", "IV", "V"],
                          ["I", "IV", "I", "V"],
                          ["I", "IV", "ii", "V"],
                          ["vi", "ii", "V", "I"],
                          ["I", "IV", "V", "I"]
        ]
        
        for i in 0..<fourChords.count {
            let labelOne = SetLabel(firstLabel: fourChords[i][0], secondLabel: fourChords[i][1], thirdLabel: fourChords[i][2], fourthLabel: fourChords[i][3])
            allLabels.append(labelOne)
            
            var new = theKey!
            new.getProgessiveChords(input1: fourChords[i][0], input2: fourChords[i][1], input3: fourChords[i][2], input4: fourChords[i][3])
            progessiveChords.append(new)
            
        }
        
        let fiveChords = [["I", "V", "vi", "iii", "IV"],
                          ["IV", "ii", "I", "V", "I"],
        ]
        
        for i in 0..<fiveChords.count {
            let labelOne = SetLabel(firstLabel: fiveChords[i][0], secondLabel: fiveChords[i][1], thirdLabel: fiveChords[i][2], fourthLabel: fiveChords[i][3], fithLabel: fiveChords[i][4])
            allLabels.append(labelOne)
            
            var new = theKey!
            new.getProgessiveChords(input1: fiveChords[i][0], input2: fiveChords[i][1], input3: fiveChords[i][2], input4: fiveChords[i][3], input5: fiveChords[i][4])
            progessiveChords.append(new)
        }
    }
    
    func getMinorChords() {
        let threeChords = [["i", "VI", "VII"],
                           ["i", "iv", "VII"],
                           ["i", "iv", "v"],
                           ["iio", "v", "i"],
                           ["i", "iv", "i"]
        ]
        
        for i in 0..<threeChords.count {
            let labelOne = SetLabel(firstLabel: threeChords[i][0], secondLabel: threeChords[i][1], thirdLabel: threeChords[i][2])
            allLabels.append(labelOne)
            
            var new = minorKey!
            new.getProgessiveChords(input1: threeChords[i][0], input2: threeChords[i][1], input3: threeChords[i][2])
            progessiveChords.append(new)
        }
        
        let fourChords = [["i", "VI", "III", "VII"],
                          ["VI", "VII", "i", "i"],
                          ["i", "VII", "VI", "VII"]
        ]
        
        for i in 0..<fourChords.count {
            let labelOne = SetLabel(firstLabel: fourChords[i][0], secondLabel: fourChords[i][1], thirdLabel: fourChords[i][2], fourthLabel: fourChords[i][3])
            allLabels.append(labelOne)
            
            var new = minorKey!
            new.getProgessiveChords(input1: fourChords[i][0], input2: fourChords[i][1], input3: fourChords[i][2], input4: fourChords[i][3])
            progessiveChords.append(new)
        }
    }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progessiveChords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewTableViewCell
        //        cell?.textLabel?.text = "\(indexPath.row) \(balloonArray[indexPath.row])"
        //        cell?.labelName.text = sampleData[indexPath.row]
        cell?.cellDelegate = self
        //        cell?.index = indexPath
        cell?.setLabels(with: allLabels[indexPath.row])
        cell?.setChord(with: progessiveChords[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        }
    }
}

extension TableVC: TableViewSound {
    func onTap(playChord: String) {
//        print("\(playChord) is Clicked")
        playSound(soundName: playChord)
    }
    
    /* Code found on stackoverflow
     https://stackoverflow.com/questions/32036146/how-to-play-a-sound-using-swift */
    func playSound(soundName: String) {
        //        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        //        player = try! AVAudioPlayer(contentsOf: url!)
        //        player?.play()
        
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
