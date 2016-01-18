//
//  MultiplikationViewController.swift
//  Mathematik for Kids
//
//  Created by Berkant Dursun on 17.01.16.
//  Copyright © 2016 Berkant Dursun. All rights reserved.
//

import Foundation
import UIKit

class MultiplikationViewController: UIViewController ,UIAlertViewDelegate {
    
    var ergebnisInLabel = 0
    var arraysInLabel = 0
    var ergebnis = 0
    var points = 0
    var timerCount = 60
    var timerRunning = false
    var timer = NSTimer()
    var highScoreMultiplikation = NSInteger()
    var prefs: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(__FUNCTION__)
        multiplicandLabel.text = "1"
        multiplierLabel.text = "1"
        resultLabelA.text = "1"
        resultLabelB.text = "2"
        resultLabelC.text = "3"
        resultLabelD.text = "4"
        resultLabelE.text = "5"
        timerLabel.text = "60"
        scoreLabel.text = "0"
        highScoreLabel.text = "0"
        buttonALabel.enabled = false
        buttonBLabel.enabled = false
        buttonCLabel.enabled = false
        buttonDLabel.enabled = false
        buttonELabel.enabled = false
        buttonStartLabel.enabled = true
        
        highScoreMultiplikation = prefs.integerForKey("SavedHighScoreMultiplikation")
        highScoreLabel.text = String("Highscore: \(highScoreMultiplikation)")
        // print("HighScore: \(highScoreAddition)")
        prefs.synchronize()
        
    }
    
    
    @IBOutlet weak var multiplicandLabel: UILabel!
    @IBOutlet weak var multiplierLabel: UILabel!
    @IBOutlet weak var resultLabelA: UILabel!
    @IBOutlet weak var resultLabelB: UILabel!
    @IBOutlet weak var resultLabelC: UILabel!
    @IBOutlet weak var resultLabelD: UILabel!
    @IBOutlet weak var resultLabelE: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    // Um auf die properties der UIButtons zuzugreifen
    @IBOutlet weak var buttonALabel: UIButton!
    @IBOutlet weak var buttonBLabel: UIButton!
    @IBOutlet weak var buttonCLabel: UIButton!
    @IBOutlet weak var buttonDLabel: UIButton!
    @IBOutlet weak var buttonELabel: UIButton!
    @IBOutlet weak var buttonStartLabel: UIButton!
    
    
    
    @IBAction func buttonStartPressed(sender: UIButton) {
        print(__FUNCTION__)
        buttonALabel.enabled = true
        buttonBLabel.enabled = true
        buttonCLabel.enabled = true
        buttonDLabel.enabled = true
        buttonELabel.enabled = true
        buttonStartLabel.enabled = false
        scoreLabel.text = "0"
        timerLabel.text = "60"
        points = 0
        timerCount = 60
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "counting", userInfo: nil, repeats: true)
            timerRunning = true
        }
        
        berechneMultiplikation()
    }
    
    
    @IBAction func buttonAPressed(sender: UIButton) {
        print(__FUNCTION__)
        if ergebnisInLabel == 0 {
            score()
            berechneMultiplikation()
        } else {
            berechneMultiplikation()
        }
        
        // print("Button A Pressed")
    }
    
    @IBAction func buttonBPressed(sender: UIButton) {
        print(__FUNCTION__)
        if ergebnisInLabel == 1 {
            score()
            berechneMultiplikation()
        } else {
            berechneMultiplikation()
        }
        
        // print("Button B Pressed")
    }
    
    @IBAction func buttonCPressed(sender: UIButton) {
        print(__FUNCTION__)
        if ergebnisInLabel == 2 {
            score()
            berechneMultiplikation()
        } else {
            berechneMultiplikation()
        }
        
        // print("Button C Pressed")
    }
    
    @IBAction func buttonDPressed(sender: UIButton) {
        print(__FUNCTION__)
        if ergebnisInLabel == 3 {
            score()
            berechneMultiplikation()
        } else {
            berechneMultiplikation()
        }
        
        // print("Button D Pressed")
    }
    
    @IBAction func buttonEPressed(sender: UIButton) {
        print(__FUNCTION__)
        if ergebnisInLabel == 4 {
            score()
            berechneMultiplikation()
        } else {
            berechneMultiplikation()
        }
        
        // print("Button E Pressed")
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        timer.invalidate()
        // print("viewWillDisappear")
    }
    
    func counting() {
        
        timerCount--
        timerLabel.text = String(timerCount)
        // print("Sekunde: \(timerCount)")
        
        if timerCount == 0 {
            timer.invalidate()
            alertView()
            timerRunning = false
            buttonALabel.enabled = false
            buttonBLabel.enabled = false
            buttonCLabel.enabled = false
            buttonDLabel.enabled = false
            buttonELabel.enabled = false
            buttonStartLabel.enabled = true
        }
        
    }
    
    func alertView() {
        if (points == 1) {
            let uiAlertController = UIAlertController(title: "Ergebnis:",
                message: "Du hast \(points) Punkt", preferredStyle: .Alert)
            
            //        let cancelAction = UIAlertAction(title: "Nochmal spielen!", style: .Cancel) {
            //            (action) in
            //            print("Nochmal spielen?")
            //        }
            //        uiAlertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
                // print("Ok-Button wurde betätigt")
            }
            uiAlertController.addAction(OKAction)
            
            // Die Methode presentViewController sorgt dafür, dass ein View modal angezeigt wird.
            self.presentViewController(uiAlertController, animated: true) {
                
            }
            
        } else {
            let uiAlertController = UIAlertController(title: "Ergebnis:",
                message: "Du hast \(points) Punkte", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
                // print("Ok-Button wurde betätigt")
            }
            uiAlertController.addAction(OKAction)
            
            // Die Methode presentViewController sorgt dafür, dass ein View modal angezeigt wird.
            self.presentViewController(uiAlertController, animated: true) {
                
            }
        }
        
    }
    
    func score() {
        print(__FUNCTION__)
        
        
        points += 1
        scoreLabel.text = String(points)
        
        if points > highScoreMultiplikation {
            highScoreMultiplikation = points
            prefs.setInteger(highScoreMultiplikation, forKey: "SavedHighScoreMultiplikation")
            highScoreLabel.text = String("Highscore: \(highScoreMultiplikation)")
            prefs.synchronize()
            print("Syncronisiere")
            
        }
    }
    
    
    // Erzeut eine neue Aufgabe
    func berechneMultiplikation() {
        print(__FUNCTION__)
        
        var multiplicand = 0
        var multiplier = 0
        
        
        multiplicand = Int(arc4random_uniform(10))
        multiplicandLabel.text = String(multiplicand)
        // print("Zahl 1 = \(addendOne)")
        
        multiplier = Int(arc4random_uniform(10))
        multiplierLabel.text = String(multiplier)
        // print("Zahl 2 = \(addendTwo)")
        
        
        
        ergebnis = multiplicand * multiplier
        // print("Ergebnis = \(ergebnis)")
        
        if ((ergebnis > 100) || (multiplicand == 0)) {
            berechneMultiplikation()
        }
        generator()
    }
    
    
    // Erzeugt 5 verschiedene Zufallszahlen
    func generator() {
        print(__FUNCTION__)
        
        // var zahlenSet = Set<Int>()
        var zahlenArray = [Int]()
        var zufallsZahl = 0
        
        
        repeat {
            
            zufallsZahl = (Int(arc4random_uniform(100))+1)
            
            if zufallsZahl != ergebnis {
                
                zahlenArray.append(zufallsZahl)
                // print(zufallsZahl)
                
            }
            
            // Doppelgänger im Array eliminieren
            for var i = 0; i < zahlenArray.count-1; i++ {
                for var j = zahlenArray.count-1; j > i; j-- {
                    if zahlenArray[i] == zahlenArray[j] {
                        zahlenArray.removeAtIndex(j)
                    }
                }
            }
            // print(zahlenArray)
            
        } while(zahlenArray.count<5)
        
        
        
        // Zufallszahlen werden in die Labels gesetzt
        resultLabelA.text = String(zahlenArray[0])
        // print(zahlenArray[0])
        
        resultLabelB.text = String(zahlenArray[1])
        // print(zahlenArray[1])
        
        resultLabelC.text = String(zahlenArray[2])
        // print(zahlenArray[2])
        
        resultLabelD.text = String(zahlenArray[3])
        // print(zahlenArray[3])
        
        resultLabelE.text = String(zahlenArray[4])
        // print(zahlenArray[4])
        
        
        // Das Ergebnis wird in ein zufälliges Label gesetzt
        
        ergebnisInLabel = Int(arc4random_uniform(5))
        
        switch ergebnisInLabel {
        case 0:
            // print("Case 0 = \(ergebnis)")
            resultLabelA.text = String(ergebnis)
        case 1:
            // print("Case 1 = \(ergebnis)")
            resultLabelB.text = String(ergebnis)
        case 2:
            // print("Case 2 = \(ergebnis)")
            resultLabelC.text = String(ergebnis)
        case 3:
            // print("Case 3 = \(ergebnis)")
            resultLabelD.text = String(ergebnis)
        case 4:
            // print("Case 4 = \(ergebnis)")
            resultLabelE.text = String(ergebnis)
        default: break
            // print("im Default resultField")
        }

    
}

}