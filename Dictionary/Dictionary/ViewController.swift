//
//  ViewController.swift
//  Dictionary
//
//  Created by Alex Ionescu on 08.05.2022.
//

import UIKit


public var dictionary: [String]=[]

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordsList.delegate = self
    }
    
    @IBOutlet weak var changingTitle: UILabel!
    @IBOutlet weak var wordsList: UITextField!
    @IBOutlet weak var addWordsButton: UIButton!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == wordsList {
           addWords(addWordsButton)
        }
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func inputWords(_ sender: UITextField) {
    }
    @IBAction func resetButtonTap(_ sender: UIButton) {
        dictionary = []
        changingTitle.text = "Type your words and search them!"
        changingTitle.backgroundColor = .systemBackground
        view.backgroundColor = .systemBackground
    }
    @IBAction func gestureRecognize(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func addWords(_ sender: UIButton) {
        if wordsList.text != nil {
           dictionary.append(wordsList.text!)
        }
        wordsList.text = ""
        wordsList.resignFirstResponder()
    }
    
    @IBAction func viewWordsTap(_ sender: UIButton) {
        changingTitle.text = ""
        if dictionary.isEmpty{
            changingTitle.text = "Your list in empty!!"
        } else {
           for i in 0..<dictionary.count {
            changingTitle.text! += dictionary[i]
            if i < dictionary.count - 1 {
                changingTitle.text! += ", "
            }
        }
        }
    }
}
