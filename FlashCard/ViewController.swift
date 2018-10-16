//
//  ViewController.swift
//  FlashCard
//
//  Created by Vimbai Mawoneke on 10/13/18.
//  Copyright © 2018 Vimbai Mawoneke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textAnswerLabel: UILabel!
    
    @IBOutlet weak var textQuestionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textAnswerLabel.isHidden = true
    }
    
   
    @IBAction func didTapOnFlashCard(_ sender: UITapGestureRecognizer) {
        textQuestionLabel.isHidden = true
        textAnswerLabel.isHidden = false
    }
}
    





    


