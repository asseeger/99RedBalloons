//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Andreas Seeger @MBPR on 25.09.14.
//  Copyright (c) 2014 ASS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ivMyImageView: UIImageView!
    
    @IBOutlet weak var labelNumberOfBalloons: UILabel!
    
    var indexOfDisplay = 0
    
    var randomNumberOfLastIteration:Int = -1
    
    // Initiating the array
    var balloons:[Balloon] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func barButtonNextPressed(sender: UIBarButtonItem) {
        // Hooking image ImageView, displaying appropriate label
        var labelNumber = indexOfDisplay + 1
        if indexOfDisplay < 99 {
            ivMyImageView.image = balloons[indexOfDisplay].image
            if indexOfDisplay == 0 {
                labelNumberOfBalloons.text = "\(labelNumber) Balloon"
            } else {
                labelNumberOfBalloons.text = "\(labelNumber) Balloons"
            }
            println("Showing Balloon at array index \(indexOfDisplay).")
            // Enumerating to get next element when pressing Next again
            ++indexOfDisplay
        } else {
            ivMyImageView.image = UIImage(named: "BerlinTVTower.jpg")
            labelNumberOfBalloons.text = "0 Balloons"
            indexOfDisplay = 0
        }
    }

    func createBalloons() {
        // Looping 99 times, appending a balloon to the array each time
        for index in 1...99 {
            var randomPicture:String
            var randomNumber = Int(arc4random_uniform(UInt32(4)))
            while randomNumber == randomNumberOfLastIteration {
                randomNumber = Int(arc4random_uniform(UInt32(4)))
            }
            switch randomNumber {
            case 1:
                randomPicture = "RedBalloon1.jpg"
            case 2:
                randomPicture = "RedBalloon2.jpg"
            case 3:
                randomPicture = "RedBalloon3.jpg"
            default:
                randomPicture = "RedBalloon4.jpg"
            }
        

            let balloon = Balloon(number: index, image: UIImage(named: randomPicture))
            
            // Console testing
            print("Balloon \(index) created with picture number \(randomNumber). ")
            
            // Appending to array
            balloons.append(balloon)
            println("Number of elements in array: \(balloons.count).")
            
            // To prevent showing the same picture over and over keep info, which picture was shown at the last instance
            randomNumberOfLastIteration = randomNumber
        }
    }

}

