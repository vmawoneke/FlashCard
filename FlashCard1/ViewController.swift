//
//  ViewController.swift
//  FlashCard1
//
//  Created by Vimbai Mawoneke on 11/25/18.
//  Copyright © 2018 Vimbai Mawoneke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Card: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        answerLabel.isHidden = true
        questionLabel.isHidden = false
        Card.layer.cornerRadius = 20.0
        Card.clipsToBounds = true
        Card.layer.shadowRadius = 5.0
        Card.layer.shadowColor = UIColor.black.cgColor
        Card.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
       
        Card.layer.shadowOpacity = 0.0
        questionLabel.clipsToBounds = true
       
       // btnOption1.layer.borderWidth = 5.0
       // btnOption1.layer.borderColor = #colorLiteral(red: 0.3741965294, green: 0.1810016334, blue: 1, alpha: 0.6)
        btnOption1.layer.cornerRadius = 15.0
        
      //  btnOption2.layer.borderWidth = 5.0
      //  btnOption2.layer.borderColor = #colorLiteral(red: 0.3741965294, green: 0.1810016334, blue: 1, alpha: 0.6)
        btnOption2.layer.cornerRadius = 15.0
      //  btnOption3.layer.borderWidth = 5.0
      //  btnOption3.layer.borderColor = #colorLiteral(red: 0.3741965294, green: 0.1810016334, blue: 1, alpha: 0.6)
        btnOption3.layer.cornerRadius = 15.0
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //The destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        //Navigation Controler only contains a creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        //Set the flashcardsController to self
        creationController.flashcardsController = self
    }

    @IBAction func didTapOnFlashCard(_ sender: UITapGestureRecognizer) {
        
       
        if(answerLabel.isHidden == true){
            questionLabel.isHidden = true
            answerLabel.isHidden = false
        }
        else if(answerLabel.isHidden == false) {
            answerLabel.isHidden = true
            questionLabel.isHidden = false
        }
    }
    
    @IBAction func didTapOption1(_ sender: UIButton) {
        if(Card.backgroundColor == #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)){
            Card.backgroundColor = #colorLiteral(red: 0.6837422848, green: 0.6814854741, blue: 0.7629011273, alpha: 1)
        }
        else if(Card.backgroundColor == #colorLiteral(red: 0.6837422848, green: 0.6814854741, blue: 0.7629011273, alpha: 1)){
            Card.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
    
    
    @IBAction func didTapOption2(_ sender: UIButton) {
        if(Card.backgroundColor == #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)){
        Card.backgroundColor = #colorLiteral(red: 0.6837422848, green: 0.6814854741, blue: 0.7629011273, alpha: 1)
        }
        else if(Card.backgroundColor == #colorLiteral(red: 0.6837422848, green: 0.6814854741, blue: 0.7629011273, alpha: 1)){
            Card.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
    
    
    @IBAction func didTapOption3(_ sender: UIButton) {
        if(answerLabel.isHidden == true){
            questionLabel.isHidden = true
            answerLabel.isHidden = false
        }
        else if(answerLabel.isHidden == false) {
            answerLabel.isHidden = true
            questionLabel.isHidden = false
        }
    }
    
    func updateFlashCard(question:String?,answer:String? ){
        questionLabel.text = question
        answerLabel.text = answer
        
    }

}

