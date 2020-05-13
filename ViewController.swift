//
//  ViewController.swift
//  Guess That Animal
//
//  Created by msohaib on 10/25/18.
//  Copyright © 2018 msohaib. All rights reserved.
/*
 This App is developed as an educational project. Any copyrighted materials are included in accordance to the multimedia fair use guidelines, a notice should be added and states that
 “certain materials are included under the fair use exemption of the U.S. Copyright Law and have been
 prepared according to the multimedia fair use guidelines and are restricted from further use".
*/
import UIKit
import AVFoundation

class ViewController: UIViewController {
    var catSound: AVAudioPlayer = AVAudioPlayer()
    var cowSound: AVAudioPlayer = AVAudioPlayer()
    var duckSound: AVAudioPlayer = AVAudioPlayer()
    var elephantSound: AVAudioPlayer = AVAudioPlayer()
    var horseSound: AVAudioPlayer = AVAudioPlayer()
    var lionSound: AVAudioPlayer = AVAudioPlayer()
    
    var animalArray = ["cat","cat2.jpg","cow","cow2","duck","duck2.jpg"
        ,"elephant","elephant2.jpg","horse","horse2","lion","lion2.jpg"]
    var i = 0
    //
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var imgAnimal: UIImageView!
    @IBOutlet weak var imgRandom: UIImageView!
    
    
    //When link button is touched
    @IBAction func linkBTN(_ sender: Any) {
        let app = UIApplication.shared
        let urlAddress = "https://nationalzoo.si.edu/animals/scbi-animals"
        let urlw = URL(string:urlAddress)
        app.openURL(urlw!)
    } //end of link button
    

    // animal sound effects function
    func setSound(){
        if(i == 1){
            catSound.play()
        }else if(i == 3){
            cowSound.play()
        }else if(i == 5){
            duckSound.play()
        }else if(i == 7){
           elephantSound.play()
        }else if(i == 9){
            horseSound.play()
        }else if(i == 11){
            lionSound.play()
        }
    } // end of animal sound fucntion
    
    // Animal Name Function
    func setName(){
        if(i == 0){
            appName.text = "Guess That Animal"
        }else if(i == 1){
            appName.text = "Cat"
        }else if(i == 2){
            appName.text = "Guess That Animal"
        }else if(i == 3){
            appName.text = "Cow"
        }else if(i == 4){
            appName.text = "Guess That Animal"
        }else if(i == 5){
            appName.text = "Duck"
        }else if(i == 6){
            appName.text = "Guess That Animal"
        }else if(i == 7){
            appName.text = "Elephant"
        }else if(i == 8){
            appName.text = "Guess That Animal"
        }else if(i == 9){
            appName.text = "Horse"
        }else if(i == 10){
            appName.text = "Guess That Animal"
        }else{
            appName.text = "Lion"
        }
    }//End of Animal Name Fucntion
    
    //when start buttion is touched
    @IBAction func startBTN(_ sender: Any) {
        //background.isHidden = true
        imgAnimal.isHidden = false
        imgRandom.isHidden = true
        background.image = UIImage(named: "greyBckgrd.jpg")
        if( i < 12){
            let randomNumber = animalArray[i]
            imgAnimal.image = UIImage(named: randomNumber)
            setName()
            setSound()
            i = i + 1
        }else{
            i = 0
        }
    } // end of startBtn
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let soundFile = Bundle.main.path(forResource: "catSound", ofType: ".mp3")
        do {
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        }catch {
            print(error)
        }
        let soundFile2 = Bundle.main.path(forResource: "cowSound", ofType: ".mp3")
        do{
            try cowSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile2!))
        }catch{
            print(error)
        }
        let soundFile3 = Bundle.main.path(forResource: "duckSound", ofType: ".mp3")
        do{
            try duckSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile3!))
        }catch{
            print(error)
        }
        let soundFile4 = Bundle.main.path(forResource: "elephantsound", ofType: ".mp3")
        do{
            try elephantSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile4!))
        }catch{
            print(error)
        }
        let soundFile5 = Bundle.main.path(forResource: "horseSound", ofType: ".mp3")
        do{
            try horseSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile5!))
        }catch{
            print(error)
        }
        let soundFile6 = Bundle.main.path(forResource: "lionsound", ofType: ".mp3")
        do{
            try lionSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile6!))
        }catch{
            print(error)
        }
    } // end view did load
    
    // start of randomBtn
    @IBAction func randomBTN(_ sender: Any) {
        imgAnimal.isHidden = true
        imgRandom.isHidden = false
        var animalArray2 = ["cat2.jpg","cow2","duck2.jpg","elephant2.jpg","horse2","lion2.jpg"]
        let i = Int(arc4random_uniform(6))
        appName.text = " "
        background.image = UIImage(named: "greyBckgrd.jpg")
        imgRandom.image = UIImage(named:animalArray2[i])
        //add sound
        if(i == 0){
            catSound.play()
        }else if(i == 1){
            cowSound.play()
        }else if(i == 2){
            duckSound.play()
        }else if(i == 3){
            elephantSound.play()
        }else if(i == 4){
            horseSound.play()
        }else if(i == 5){
            lionSound.play()
        }
     }//end randomBtn 
    
} //end of view controller

