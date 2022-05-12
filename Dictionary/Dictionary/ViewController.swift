//
//  ViewController.swift
//  Dictionary
//
//  Created by Alex Ionescu on 08.05.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordsList.delegate = self
        searchedWord.delegate = self
    }
    
    var dictionary : [String] = []
    var word = ""
    @IBOutlet weak var changingTitle: UILabel!
    @IBOutlet weak var wordsList: UITextField!
    @IBOutlet weak var searchedWord: UITextField!
    @IBOutlet weak var addWordsButton: UIButton!
    @IBOutlet weak var searchWordsButton: UIButton!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == wordsList {
        addWords(addWordsButton)
        } else if textField == searchedWord {
        searchWords(searchWordsButton)
        }
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func inputWords(_ sender: UITextField) {
    }
    @IBAction func resetButtonTap(_ sender: UIButton) {
        dictionary = []
        searchedWord.text = ""
        changingTitle.text = "Type your words and search them!"
        changingTitle.backgroundColor = .systemBackground
        view.backgroundColor = .systemBackground
    }
    @IBAction func gestureRecognize(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func inputSearchedWord(_ sender: UITextField) {
    }
    
    @IBAction func addWords(_ sender: UIButton) {
        if wordsList.text != nil {
        dictionary.append(wordsList.text!)
        }
        wordsList.text = ""
        wordsList.resignFirstResponder()
    }
    
    @IBAction func searchWords(_ sender: UIButton) {
        word = searchedWord.text!
        changingTitle.backgroundColor = .systemYellow
        view.backgroundColor = .systemCyan
        if dictionary.contains(word){
            changingTitle.text = "Hoooray, your word:\n 👉\(word)👈\n has been found!"
        } else {
            changingTitle.text = "Sorry, your word:\n 👉\(word)👈\n hasn't been found!"
        }
        searchedWord.text = ""
        searchedWord.resignFirstResponder()
    }
}

