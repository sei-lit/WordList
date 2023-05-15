//
//  QuestionViewController.swift
//  WordList
//
//  Created by 大森青 on 2023/05/11.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    let saveData = UserDefaults.standard
    
    var isAnswered: Bool = false
    var wordArray: [Dictionary<String, String>] = []
    var answerCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        wordArray.shuffle()
        questionLabel.text = wordArray[answerCount]["english"]
    }
    
    @IBAction func tappedNextButton() {
        if isAnswered {
            
            answerCount += 1
            answerLabel.text = ""
            
            if answerCount < wordArray.count {
                questionLabel.text = wordArray[answerCount]["english"]
                isAnswered = false
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                answerCount = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            answerLabel.text = wordArray[answerCount]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
        }
    }

}
