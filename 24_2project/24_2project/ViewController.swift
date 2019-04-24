//this is version 2 because could not get playground to work, version 1 can be deleted
//  ViewController.swift
//  24_2project
//
//  Created by Admin on 22/04/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    
    //attributed text Center Alignment
    //https://stackoverflow.com/questions/29045750/attributed-text-center-alignment
    let centerAlignment  = NSMutableParagraphStyle()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerAlignment.alignment = NSTextAlignment.center
    }
    
    //Do what you can,
    //with what you have,
    //where you are.
    @IBAction func Paint(_ sender: UIButton) {
        
        let str = "Be Brave! \n Type Something!"
        
        let atr: [NSAttributedString.Key : Any] = [
            .backgroundColor : UIColor.randomColor,
            .foregroundColor   :UIColor.randomColor,
            .font : UIFont(name: "Arial", size: 50) as Any,
            .paragraphStyle: centerAlignment
        ]
        
        if textView.text != nil && textView.text!.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
            let paintedWord = NSAttributedString(string: textView.text!, attributes: atr)
            textView.attributedText = paintedWord
        }
        else{
            let placeHolder = NSAttributedString(string: str, attributes:    atr)
            textView.attributedText = placeHolder
            
        }
    }
    
    
    @IBAction func colorMix(_ sender: UIButton) {
        
        
        let string: String
        if textView.text != nil && textView.text!.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
            string = textView.text!
        }
        else{
            string = "Home is where you are. Now type your wish."
        }
        
        let intRandom = Int.random(in: 0...string.count)
        print("stringcount = \(string.count) , intrandom = \(intRandom)" )
        
        let location = Int.random(in: 0...(string.count - intRandom))
        let location2 = Int.random(in: 0...(string.count - intRandom))
        
        let coloredWord = NSMutableAttributedString(string: string)
        coloredWord.addAttribute(.foregroundColor, value: UIColor.randomColor, range: NSRange(location: location, length: intRandom))
        coloredWord.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 50), range: NSRange(location: location2, length: intRandom))
        
        textView.attributedText = coloredWord
        
    }
    
    
    @IBAction func addPrefix(_ sender: UIButton) {
        textField.isUserInteractionEnabled = true
        
        let string: String
        if textField.text != nil && textField.text!.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
            string = textView.text!.withPrefix(textField.text!)
        }
        else{
            string = "Write Something here, then type the prefix below in grey field."
        }
        textView.text = string
    }
    
    
    @IBAction func findNumberInWord(_ sender: UIButton) {
        
        textField.isUserInteractionEnabled = true
        
        let string: String
        if textView.text != nil && textView.text!.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
            let typedword = textView.text!
            if textView.text!.isNumeric{
                string = "There is a number in '\(typedword)'"
            }
            else{
                string = "I did not find any numbers in '\(typedword)'"
            }
        }
        else{
            string = "Write Something here, then tap FindNumbers  button, and I will tell you if there are any numbers in the string that you typed."
        }
        textView.text = string
    }
    
    
    @IBAction func findLinesInWord(_ sender: UIButton) {
        
        textField.isUserInteractionEnabled = true
        
        let string: String
        //if text is not empty and is not ""
        if textField.text != nil && textField.text!.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
            let arrayOfLines = textView.text!.lines
            //if there are no lines in given string
            if arrayOfLines.isEmpty{
                string = "Tere are no lines in this string"
            }
            else {
                string = arrayOfLines.joined(separator: " ")
            }
            textView.text = string
        }
    }
    
    
    @IBAction func Clear(_ sender: UIButton) {
        textView.text = ""
    }
}

extension String{
    var lines: [String] {return self.map{String($0)}.filter{$0 == "/" || $0 == "-" || $0 == "_" || $0 == "\\"}
    }
}

extension String{
    //map makes and array of characters turned to string from our string ["a", "s", "d"],.compactMap returns an array of Ints and removes the nil resuls(the array elements that he couldn't turn to Int)
    var isNumeric:Bool{
        return !((self.map{String($0)}.compactMap{Int($0)}).isEmpty)
    }
}

extension String{
    func withPrefix(_ prefix: String)->String{
        if self.hasPrefix(prefix){
            return self
        }
        else {
            return prefix + self
        }
    }
}

extension UIColor{
    static var randomColor:UIColor{
        return UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
    }
}

