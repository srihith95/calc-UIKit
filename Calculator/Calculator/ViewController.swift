//
//  ViewController.swift
//  Calculator
//
//  Created by Srihith Prudhivi on 18/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    
    var workings: String = ""
    
    func clearAll(){
        workings = ""
        inputLabel.text = ""
        outputLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        inputLabel.text = workings
    }
    
    @IBAction func eqResTap(_ sender: Any) {
        if(validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            outputLabel.text = resultString
        }
        else
        {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to do math based on given input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            
        }
    }
    
    func validInput() -> Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings   {
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous = -1
        
        for index in funcCharIndexes {
            if(index == 0){
                return false
            }
            if(index == workings.count - 1){
                return false
            }
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        if(char == "-")
        {
            return true
        }
        if(char == "%")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
           return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }

    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func delTap(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            inputLabel.text = workings
        }
    }
    
    @IBAction func percentTap(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func additionTap(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func subTap(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func multTap(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func divTap(_ sender: Any) {
        addToWorkings(value: "÷")
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9")
    }
}

