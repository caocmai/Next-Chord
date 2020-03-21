//
//  SecondChordVC.swift
//  next-chord
//
//  Created by Cao Mai on 3/20/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class SecondChordVC: UIViewController {
    
    var secondChordsArray : [String]?
    

    @IBOutlet weak var secondChordCV: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(secondChordsArray!)
        
        secondChordCV.register(UINib(nibName: "SecondChordCell", bundle: .main), forCellWithReuseIdentifier: "secondChordCell")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func dismissViewTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SecondChordVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return secondChordsArray!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = secondChordCV.dequeueReusableCell(withReuseIdentifier: "secondChordCell", for: indexPath) as! SecondChordCell
        cell.layer.cornerRadius = 7
        cell.secondChordButtonLabel.setTitle(secondChordsArray![indexPath.row], for: .normal)
        
        cell.backgroundColor = .cyan
        
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
