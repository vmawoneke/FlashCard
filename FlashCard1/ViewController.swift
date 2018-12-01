//
//  ViewController.swift
//  FlashCard1
//
//  Created by Vimbai Mawoneke on 11/25/18.
//  Copyright © 2018 Vimbai Mawoneke. All rights reserved.
//

import UIKit

struct Flashcard{
    var question: String?
    var answer: String?
}
class ViewController: UIViewController {
    
    
    @IBOutlet weak var Card: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //This is an array to hold the flashcards
    var flashcards = [Flashcard]()
    
    //Current flashcard index
    var currentIndex = 0
    
    //Variable to identify when we tap on prevButton
    //Set it to false because when app starts there is no prev to tap on
    var prevTapBool: Bool = false
    
    //x Variable for translation
    var xTranslation = 300.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Read saved flashcards
        readSavedFlashcards()
        
        //Adding our initial flashcard if needed
        if flashcards.count == 0{
        updateFlashCard(question:"What is the capital of Brazil?", answer:"Brasilia")
        }
        else{
            updateLabels()
            updateNextPrevButtons()
            
        }
        
        answerLabel.isHidden = true
        questionLabel.isHidden = false
        
        //Styling the card
        Card.layer.cornerRadius = 20.0
        Card.clipsToBounds = true
        Card.layer.shadowRadius = 5.0
        Card.layer.shadowColor = UIColor.black.cgColor
        Card.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
       
        Card.layer.shadowOpacity = 0.0
        questionLabel.clipsToBounds = true
       
        //Styling the multiple choice answers
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

    flipFlashcard()
//        if(answerLabel.isHidden == true){
//            questionLabel.isHidden = true
//            answerLabel.isHidden = false
//        }
//        else if(answerLabel.isHidden == false) {
//            answerLabel.isHidden = true
//            questionLabel.isHidden = false
//        }
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
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        //Confirming that didTapOnPrev was tapped
         prevTapBool = true
        
        
        //decrease current index
        currentIndex = currentIndex - 1
        
        //Update labels
        //updateLabels()
        
        //update buttons
        updateNextPrevButtons()
        animateCardOut()
        
        
    }
    
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        //confirming that didTapOnPrev was not tapped
        prevTapBool = false
        
        //Increase current index
        currentIndex = currentIndex + 1
        
        
        //Update labels
        //updateLabels()
        
        //update buttons
        updateNextPrevButtons()
        animateCardOut()
    }
    
    func updateFlashCard(question:String?,answer:String? ){
        let flashcard = Flashcard(question: question, answer: answer)
        questionLabel.text = question
        answerLabel.text = answer
        
        // This will add a flashcard in the flashcards array
        flashcards.append(flashcard)
        
        //Logging to the console
        print("Added a new flashcard.")
        print("We now have \(flashcards.count) flashcards." )
        
        //Update current index
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex) ")
        
        //Call on update buttons
        updateNextPrevButtons()
        
        //Update labels
        updateLabels()
        
        //call save to disk
        saveAllFlashcardsToDisk()
    }
    
    func updateNextPrevButtons(){
        
        //Disable next button if at the end
        if currentIndex == flashcards.count-1
        {
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
        
        //Disable prev button if at the begining
        if currentIndex == 0
        {
            prevButton.isEnabled = false
        }
        else{
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels(){
        
        //Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //update labels
        questionLabel.text = currentFlashcard.question
        answerLabel.text = currentFlashcard.answer
    }
    
    func saveAllFlashcardsToDisk(){
        
        //Log it
        print("Flashcards saved to UserDefaults")
        
        //From flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String?: String?] in
            return ["question": card.question, "answer":card.answer]
            
        }
        
        //Save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray,forKey:"flashcards")
        
        
    }
    
    func readSavedFlashcards(){
        
        //Read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String?:String?]]{
            
            //in here we know that there is definitely a dictionary array
            let savedCards = dictionaryArray.map{ dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)}
        
        //Put all these flashcards in our flashcards array
        flashcards.append(contentsOf: savedCards)
    }
}
    func flipFlashcard(){
        
        UIView.transition(with: Card, duration: 0.3, options:UIView.AnimationOptions .transitionFlipFromRight  , animations: {
            if(self.answerLabel.isHidden == true){
                self.questionLabel.isHidden = true
                self.answerLabel.isHidden = false
            }
            else if(self.answerLabel.isHidden == false) {
                self.answerLabel.isHidden = true
                self.questionLabel.isHidden = false
            }
        })
    }
    
    
    func animateCardOut(){
        
    confirmAnimationDirection()
        
        UIView.animate(withDuration: 0.3, animations:{
            self.Card.transform = CGAffineTransform.identity.translatedBy(x:-CGFloat(self.xTranslation), y: 0.0)
        }, completion: { finished in
            
            //Update labels
            self.updateLabels()
            //Run other animation
            self.animateCardIn()
        })
        
    
    }

    func animateCardIn(){
        
       confirmAnimationDirection()
        
        //Start on the right side(don't animate this)
        Card.transform = CGAffineTransform.identity.translatedBy(x: CGFloat(self.xTranslation), y: 0.0)
        
        //Animate card going back to its origional position
        UIView.animate(withDuration: 0.3){
            self.Card.transform = CGAffineTransform.identity
            
            
            }
        }
    
    func confirmAnimationDirection(){
        
        if prevTapBool  == true{
            xTranslation = -1 * xTranslation
        }
        else{
            xTranslation = 300.0
        }
    }
        
    }


