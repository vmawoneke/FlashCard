//
//  CreationViewController.swift
//  FlashCard1
//
//  Created by Vimbai Mawoneke on 11/26/18.
//  Copyright © 2018 Vimbai Mawoneke. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    
    @IBOutlet weak var QuestionTextField: UITextField!
    
    @IBOutlet weak var AnswerTextField: UITextField!
    
    var flashcardsController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapOnCancel(_ sender: Any) {
    
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        //Get question in the question text field
        let questionText = QuestionTextField.text
        
        //Get answer in the answer text field
       let answerText = AnswerTextField.text
        //Call the function to update
        
        flashcardsController.updateFlashCard(question: questionText, answer:answerText)
        
        //Dismiss
        dismiss(animated: true)
        
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
