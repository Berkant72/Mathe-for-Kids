//
//  InfoViewController.swift
//  Mathematik for Kids
//
//  Created by Berkant Dursun on 18.01.16.
//  Copyright © 2016 Berkant Dursun. All rights reserved.
//

import Foundation
import UIKit


class InfoViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UITextView!
    
    override func viewDidLoad () {
        
        infoLabel.text = "Ziel ist es in einer Minute so viele Punkte wie möglich zu erzielen. Zuerst mußt du eine Grundrechenart (+,-,x,/) auswählen und im nächsten Schritt mit dem Start-Button die Übung starten. \nDu bekommst eine Rechenaufgabe und fünf möglichen antworten, wovon nur eine richtig ist. Dies wird dir auch mit richtig oder falsch angezeigt."
        
        
    }
   
    
    
}

