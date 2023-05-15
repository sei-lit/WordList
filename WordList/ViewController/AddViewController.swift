//
//  AddViewController.swift
//  WordList
//
//  Created by 大森青 on 2023/05/11.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
    }
    
    @IBAction func saveWord() {
        if englishTextField.text != "" && japaneseTextField.text != "" {
            
            let wordDictionary = ["english" : englishTextField.text!, "japanese": japaneseTextField.text!]
            wordArray.append(wordDictionary)
            saveData.set(wordArray, forKey: "WORD")
            
        } else {
            present(createAlert(title: "入力", message: "日本語と英語どちらも入力してください"), animated: true, completion: nil)
        }
    
        present(createAlert(title: "保存完了", message: "単語の保存が完了しました"), animated: true, completion: nil)
        
        englishTextField.text = ""
        japaneseTextField.text = ""
    }
    
    func createAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
}
