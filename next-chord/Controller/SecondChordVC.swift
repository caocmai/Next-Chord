//
//  SecondChordVC.swift
//  next-chord
//
//  Created by Cao Mai on 3/20/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit
import AVFoundation

protocol SecondChordSelectionDelegate {
    func didTapChord(button: String)
}


class SecondChordVC: UIViewController {
    
    var player : AVAudioPlayer?
    var secondChordsArray : [String]?
    var chordLabel : String?
    
    var chordSelectionDelegate : SecondChordSelectionDelegate?

    
    @IBOutlet weak var nextChordLabel: UILabel!
    @IBOutlet weak var secondChordCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toUpdateHeader()
        secondChordCV.register(UINib(nibName: "SecondChordCell", bundle: .main), forCellWithReuseIdentifier: "secondChordCell")
    }
    
    @IBAction func dismissViewTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chordButtonTapped(sender: UIButton) -> Void {
        //        playSound(soundName: sender.currentTitle!)
        //            nextChordsArray = getNextChord(starting: sender.currentTitle!)
        
        // To play sound enable this line
        //            playSound(soundName: sender.currentTitle!)
        
        chordSelectionDelegate?.didTapChord(button: sender.currentTitle!)
        self.dismiss(animated: true, completion: nil)
    }
    
    func toUpdateHeader() {
        if secondChordsArray! == [] {
            nextChordLabel.text = "No Next Chord to Show"
        } else {
            nextChordLabel.text = "Next Chord For \(String(describing: chordLabel!))"
        }
        
    }
    
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


extension SecondChordVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return secondChordsArray!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = secondChordCV.dequeueReusableCell(withReuseIdentifier: "secondChordCell", for: indexPath) as! SecondChordCell
        cell.layer.cornerRadius = 7
        cell.secondChordButtonLabel.setTitle(secondChordsArray![indexPath.row], for: .normal)
        cell.secondChordButtonLabel.addTarget(self, action: #selector(chordButtonTapped), for: .touchUpInside)
        
        cell.backgroundColor = #colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
}


