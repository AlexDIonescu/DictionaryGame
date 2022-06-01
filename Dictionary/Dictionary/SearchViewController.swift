//
//  SearchViewController.swift
//  Dictionary
//
//  Created by Alex Ionescu on 13.05.2022.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text="Swipe down to return to main menu\n"
        headerArrowLabel.text="〉"
        headerArrowLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        searchedWord.delegate = self
    }
    @IBAction func gestureRecognize(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var word = ""
    public var wordsList = dictionary 
    @IBOutlet weak var searchWordsButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var searchedWord: UITextField!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerArrowLabel: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchedWord {
           searchWords(searchWordsButton)
        }
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func searchWords(_ sender: UIButton) {
        word = searchedWord.text!
        resultLabel.backgroundColor = .systemYellow
        view.backgroundColor = .systemCyan
        if wordsList.contains(word){
            resultLabel.text = "Hoooray, your word:\n 👉\(word)👈\n has been found!"
        } else if word != "" {
            resultLabel.text = "Sorry, your word:\n 👉\(word)👈\n hasn't been found!"
        } else {
            resultLabel.text = "Your word can't be null!"
        }
        searchedWord.text = ""
        searchedWord.resignFirstResponder()
    }
}
