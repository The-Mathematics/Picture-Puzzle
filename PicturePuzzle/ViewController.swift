//
//  ViewController.swift
//  PicturePuzzle
//
//  Created by Onuah Gift on 4/8/24.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet weak var imageViewOne: UIImageView!
    
    @IBOutlet weak var imageViewTwo: UIImageView!
    
    @IBOutlet weak var imageViewThree: UIImageView!
    
    @IBOutlet weak var imageViewFour: UIImageView!
    
    @IBOutlet weak var imageViewFive: UIImageView!
    
    @IBOutlet weak var imageViewSix: UIImageView!
    
    @IBOutlet weak var imageViewSeven: UIImageView!
    
    @IBOutlet weak var imageViewEight: UIImageView!
    
    @IBOutlet weak var imageViewNine: UIImageView!
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        var shufflePuzzledPieces = puzzlePieces.shuffled()
        
        imageViewOne.image = shufflePuzzledPieces.removeFirst()
        
        imageViewTwo.image = shufflePuzzledPieces.removeFirst()
        
        imageViewThree.image = shufflePuzzledPieces.removeFirst()
        
        imageViewFour.image = shufflePuzzledPieces.removeFirst()
        
        imageViewFive.image = shufflePuzzledPieces.removeFirst()
        
        imageViewSix.image = shufflePuzzledPieces.removeFirst()
        
        imageViewSeven.image = shufflePuzzledPieces.removeFirst()
        
        imageViewEight.image = shufflePuzzledPieces.removeFirst()
        
        imageViewNine.image = shufflePuzzledPieces.removeFirst()
        
    }
    
    var innerArray = [UIImageView]()
    var outerArray = [[UIImageView]]()
    var innerIndex = 0
    var outerIndex = 0
    var player: AVAudioPlayer!
    
    func playSound() {
        let url = Bundle.main.url(forResource: "scrollSoundOne", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    var puzzlePieces = [UIImage(named:"puzzlePieceOne.jpeg")!, UIImage(named:"puzzlePieceTwo.jpeg")!, UIImage(named:"puzzlePieceThree.jpeg")!, UIImage(named:"puzzlePieceFour.jpeg")!, UIImage(named:"puzzlePieceFive.jpeg")!, UIImage(named:"puzzlePieceSix.jpeg")!, UIImage(named:"PuzzlePieceSeven.jpeg")!, UIImage(named:"puzzlePieceEight.jpeg")!, UIImage(named:"puzzlePieceNine.jpeg")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do this after loading the view.
        start()
        addSwipeGestureToImageViews()
        imageViewOne.image = UIImage(named:"puzzlePieceOne.jpeg")!
        
        imageViewTwo.image = UIImage(named:"puzzlePieceTwo.jpeg")!
        
        imageViewThree.image = UIImage(named:"puzzlePieceThree.jpeg")!
        
        imageViewFour.image = UIImage(named:"puzzlePieceFour.jpeg")!
        
        imageViewFive.image = UIImage(named:"puzzlePieceFive.jpeg")!
        
        imageViewSix.image = UIImage(named:"puzzlePieceSix.jpeg")!
        
        imageViewSeven.image = UIImage(named:"PuzzlePieceSeven.jpeg")!
        
        imageViewEight.image = UIImage(named:"puzzlePieceEight.jpeg")!
        
        imageViewNine.image = UIImage(named:"puzzlePieceNine.jpeg")!
        
     
    }
   
    func createWorld(){
        for _ in 0..<3{
            outerArray.append([])
        }
        for i in 0..<3{
            var innerArray = [UIImageView]()
            for _ in 0..<3{
                innerArray.append(UIImageView())
            }
            outerArray[i] = innerArray
        }
    }
    func start(){
        createWorld();

        outerArray[0][0] = imageViewOne
        
        outerArray[0][1] = imageViewTwo
        
        outerArray[0][2] = imageViewThree
        
        outerArray[1][0] = imageViewFour
        
        outerArray[1][1] = imageViewFive
        
        outerArray[1][2] = imageViewSix
        
        outerArray[2][0] = imageViewSeven
        
        outerArray[2][1] = imageViewEight
        
        outerArray[2][2] = imageViewNine

        for i in 0..<3{
            print(outerArray[i])
        }
    }
    
    func addSwipeGestureToImageViews(){
        for i in 0..<outerArray.count{
            for j in 0..<outerArray[i].count{
                let gridView = outerArray[i][j]
                let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
                leftSwipeGesture.direction = .left
                gridView.addGestureRecognizer(leftSwipeGesture)
              
                let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
                upSwipeGesture.direction = .up
                gridView.addGestureRecognizer(upSwipeGesture)
                
                let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
                rightSwipeGesture.direction = .right
                gridView.addGestureRecognizer(rightSwipeGesture)
                
                let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
                downSwipeGesture.direction = .down
                gridView.addGestureRecognizer(downSwipeGesture)
                
                gridView.isUserInteractionEnabled = true
            }
        }
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        guard let gridView = gesture.view as? UIImageView else {
            return
        }
        playSound()
        for i in 0..<outerArray.count {
            if let index = outerArray[i].firstIndex(of: gridView) {
                outerIndex = i
                innerIndex = index
                break
            }
            print("\(outerIndex), \(innerIndex)")
        }
        
        switch gesture.direction {
        case .left:
            // Handle left swipe
            left()
            
            // You can access the gridView and perform any action you want
            // For example, change its image or perform any other operation
            break
        case .right:
            // Handle right swipe
            right()
            
            break
        case .up:
            // Handle up swipe
            up()
            
            break
        case .down:
            // Handle down swipe
            down()
            
            break
        default:
            break
        }
    }
    func left(){
        
        if innerIndex > 0 {
            let currentName = outerArray[outerIndex][innerIndex].image
            let newName = outerArray[outerIndex][innerIndex - 1].image
            let tempConstant = currentName
            
            outerArray[outerIndex][innerIndex].image = newName
            outerArray[outerIndex][innerIndex - 1].image = tempConstant
            print("Moved left")
            
        }else {
            print("Cannot move the value to the left.")
        }
    }
        
    
    func up(){
        
        if outerIndex > 0{
            let currentName = outerArray[outerIndex][innerIndex].image
            let newName = outerArray[outerIndex - 1][innerIndex].image
            let tempConstant = currentName
            
            outerArray[outerIndex][innerIndex].image = newName
            outerArray[outerIndex - 1][innerIndex].image = tempConstant
            print("Moved up")
           
        }else {
            print("Cannot move the value up.")
        }
    }
    func down(){
        
        if outerIndex == 0 || outerIndex + 1 < outerArray.count{
            let currentName = outerArray[outerIndex][innerIndex].image
            let newName = outerArray[outerIndex + 1][innerIndex].image
            let tempConstant = currentName
            
            outerArray[outerIndex][innerIndex].image = newName
            outerArray[outerIndex + 1][innerIndex].image = tempConstant
            print("Moved down")
           
        }else {
            print("Cannot move the value down.")
        }
    }
    func right(){
        
        if innerIndex == 0 || innerIndex + 1 < outerArray[outerIndex].count{
            let currentName = outerArray[outerIndex][innerIndex].image
            let newName = outerArray[outerIndex][innerIndex + 1].image
            let tempConstant = currentName
            
            outerArray[outerIndex][innerIndex].image = newName
            outerArray[outerIndex][innerIndex + 1].image = tempConstant
            print("Moved Right")
            
        }else {
            print("Cannot move the value to the right.")
        }
    }
    
}

