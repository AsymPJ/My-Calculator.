//
//  ViewController.swift
//  My Calculator.
//
//  Created by user228139 on 10/30/22.
//

import UIKit


class ViewController: UIViewController{
    
    
    @IBOutlet weak var resultOperation: UILabel!

    var resultValue: String = ""
    var state: Int = 0
    var firstOp: Double = 0
    var secondOp: Double = 0
    var totalToShow: Double = 0
    var operatorS : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearScreenAndMemory()
        
    }
    func clearScreenAndMemory(){
        resultValue = ""
        resultOperation.text = ""
        firstOp = 1
        secondOp = 0
        state = 0
    }
    func oppositeResult(){
        if resultValue == ""{
            resultOperation.text = "-"
            firstOp = -1
        }else{
            var temp : Double = 0
            temp = (Double(resultValue)!) * (-1)
            resultValue = String(temp)
        }
    }
    
    func addValue (_ valueS: String){
        if state == 0{
            if (valueS == "/" || valueS == "x" || valueS == "-" || valueS == "+") {
                if operatorS != "="{
                    firstOp = (Double(resultValue)!) * firstOp
                }
                
                operatorS = valueS
                resultValue = ""
                state = 1
            }
            else if valueS == "%" {
                firstOp = (Double(resultValue)!) * 0.01
                resultOperation.text = String(firstOp)
                resultValue = resultOperation.text!
            }
            else if valueS == "="{
                firstOp = Double(resultValue)!
                resultValue = ""
            }
            else {
                operatorS = ""
                resultValue = resultValue + valueS
                resultOperation.text = resultValue
            }
        }
        else if state == 1 {
            if valueS == "/" || valueS == "x" || valueS == "-" || valueS == "+" || valueS == "="{
                if resultValue != ""{
                    /*guard let secondOp = Double(resultValue) else{
                    
                     return
                     }*/
                    if (operatorS == "+"){
                        secondOp = Double(resultValue)!
                        operatorS = valueS
                        totalToShow = firstOp + secondOp
                        firstOp = totalToShow
                        resultValue = ""
                        if totalToShow.truncatingRemainder(dividingBy: 1) == 0{
                            resultOperation.text = String(format: "%.0f", totalToShow)
                        }else{
                            resultOperation.text = String(totalToShow)
                        }
                    }
                    else if (operatorS == "-"){
                        secondOp = Double(resultValue)!
                        operatorS = valueS
                        totalToShow = firstOp - secondOp
                        firstOp = totalToShow
                        resultValue = ""
                        if totalToShow.truncatingRemainder(dividingBy: 1) == 0{
                            resultOperation.text = String(format: "%.0f", totalToShow)
                        }else{
                            resultOperation.text = String(totalToShow)
                        }
                    }
                    else if (operatorS == "/"){
                        operatorS = valueS
                        secondOp = Double(resultValue)!
                        totalToShow = firstOp / secondOp
                        firstOp = totalToShow
                        resultValue = ""
                        if totalToShow.truncatingRemainder(dividingBy: 1) == 0{
                            resultOperation.text = String(format: "%.0f", totalToShow)
                        }else{
                            resultOperation.text = String(totalToShow)
                        }
                    }
                    else if (operatorS == "x"){
                        operatorS = valueS
                        secondOp = Double(resultValue)!
                        totalToShow = firstOp * secondOp
                        firstOp = totalToShow
                        resultValue = ""
                        if totalToShow.truncatingRemainder(dividingBy: 1) == 0{
                            resultOperation.text = String(format: "%.0f", totalToShow)
                        }else{
                            resultOperation.text = String(totalToShow)
                        }
                    }
                    if valueS == "="{
                        operatorS = "="
                        state = 0
                    }
                
                }
                else{
                    let alert = UIAlertController(title: "Fatal Error", message:"Can not type two operator in a row", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Type a number", style: .default))
                    self.present(alert, animated: true)
                }
            }
            else{
                resultValue = resultValue + valueS
                resultOperation.text = resultValue
                
            }
        }
    }
            
            

       
    @IBAction func allClearButton(_ sender: Any) {
        clearScreenAndMemory()
    }
    
    
    @IBAction func oppositebutton(_ sender: Any) {
        //oppositeNumber(resultValue)
    }
    
    
    @IBAction func percentButton(_ sender: Any) {
        addValue("%")
    }
    
    @IBAction func divisionButton(_ sender: Any) {
        addValue("/")
    }
    
    
    
    @IBAction func multiplicationButton(_ sender: Any) {
        addValue("x")
    }
    
    
    @IBAction func substractionButton(_ sender: Any) {
        addValue("-")
    }
    
    @IBAction func additionButton(_ sender: Any) {
        addValue("+")
    }
    
    
    @IBAction func uqualButton(_ sender: Any) {
        addValue("=")
    }
    
    @IBAction func dotButton(_ sender: Any) {
        addValue(".")
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        addValue("0")
    }
    
    @IBAction func oneButton(_ sender: Any) {
        addValue("1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        addValue("2")
    }
    
    
    @IBAction func threeButton(_ sender: Any) {
        addValue("3")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        addValue("4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        addValue("5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        addValue("6")
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        addValue("7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        addValue("8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        addValue("9")
    }
    
    
}

