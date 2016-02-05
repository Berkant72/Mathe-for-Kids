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
        infoLabel.text = "Das ist die Version 1.2."
        
        
    }
   
    
    
}

