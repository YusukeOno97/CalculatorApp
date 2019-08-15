//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 小野勇輔 on 2019/08/14.
//  Copyright © 2019 yo-project. All rights reserved.
// --自戒--不用意な改行はしない！

import UIKit

class ViewController: UIViewController {
    // 画面上の数字
    var numberOnScreen: Double = 0
    // 前回表示されていた数字
    var previousNumber: Double = 0
    // 計算してもいい？の判断値
    var performingMath = false
    // 足し算、引き算、割り算、掛け算
    var operation = 0
    // 数値が入力されているか
    var inValue = false

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
    }
    // 計算結果を表示するラベルの紐付け
    @IBOutlet weak var label: UILabel!
    // 数字ボタンの紐付け
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            // numberOnScreen の値が上書きされる
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        } else {
            // String(sender.tag-1) 数字が代入
            label.text = label.text! + String(sender.tag - 1)
            // 数字が表示
            numberOnScreen = Double(label.text!)!
        }
        // 数値が入力された
        inValue = true
    }
    @IBAction func buttons(_ sender: UIButton) {
        // 数字が表示されていた場合の処理
        if label.text != "" && sender.tag != 11 && sender.tag != 16{

            if inValue {
                previousNumber = Double(label.text!)!
            }
            if sender.tag == 12 {  // 割り算
                label.text = "÷"
            } else if sender.tag == 13 {  //  掛け算
                label.text = "×"
            } else if sender.tag == 14 { // 足し算
                label.text = "+"
            }else if sender.tag == 15 { // 引き算
                label.text = "-"
            }
            operation = sender.tag // 四則演算のタグ番号代入
            performingMath = true // 計算可能
            inValue = false // 数値ではない
        } else if sender.tag == 16 {  // イコールボタンが押された時の処理

            if operation == 12{
                if  numberOnScreen == 0 {
                    label.text = "エラー"
                } else {
                    let num = String(previousNumber / numberOnScreen).components(separatedBy: ".")
                    if num[1] == "0" {
                        // 少数でない時
                        label.text = num[0]
                    } else {
                        label.text = String(previousNumber / numberOnScreen)
                    }
                }

            } else if operation == 13 {
                let num = String(previousNumber * numberOnScreen).components(separatedBy: ".")
                if num[1] == "0" {
                     // 少数でない時
                    label.text = num[0]
                } else {
                    label.text = String(previousNumber * numberOnScreen)
                }
            } else if operation == 14{
                let num = String(previousNumber - numberOnScreen).components(separatedBy: ".")
                if num[1] == "0" {
                    // 少数でない時
                    label.text = num[0]
                } else {
                    label.text = String(previousNumber + numberOnScreen)
                }
            } else if operation == 15{
                let num = String(previousNumber - numberOnScreen).components(separatedBy: ".")
                if num[1] == "0" {
                     // 少数でない時
                    label.text = num[0]
                } else {
                    label.text = String(previousNumber - numberOnScreen)
                }
            }
        } else if sender.tag == 11 { // Cが押された時
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}




