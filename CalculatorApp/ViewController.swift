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
    var numberOnScreen:Double = 0
    // 前回表示されていた数字
    var previousNumber:Double = 0
    // 計算してもいい？の判断値
    var performingMath = false
    // 足し算、引き算、割り算、掛け算
    var operation = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // 計算結果を表示するラベルの紐付け
    @IBOutlet weak var label: UILabel!
    // 数字ボタンの紐付け
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            // numberOnScreen の値が上書きされる
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else{
            // String(sender.tag-1) 数字が代入
            label.text = label.text! + String(sender.tag-1)
            // 数字が表示
            numberOnScreen = Double(label.text!)!
        }
    }
    @IBAction func buttons(_ sender: UIButton) {
        // 数字が表示されていた場合の処理
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            previousNumber = Double(label.text!)!
            // 割り算
            if sender.tag == 12{
                label.text = "÷";
            }
            //  掛け算
            else if sender.tag == 13{
                label.text = "×";
            }
            // 引き算
            else if sender.tag == 14{
                label.text = "-";
            }
            // 足し算
            else if sender.tag == 15{
                label.text = "+";
            }
            operation = sender.tag
            performingMath = true;
        }
        // イコールボタンが押された時の処理
        else if sender.tag == 16
        {
            if operation == 12{
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13{
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14{
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15{
                label.text = String(previousNumber + numberOnScreen)
            }
            
            // 整数の時に小数点第一を消す処理
            let decimals: [String] = String(label.text!).components(separatedBy: ".")
            if decimals[1] == "0" {
                label.text = String((label.text!.description as NSString).integerValue)
            } else {
                label.text = String(label.text!)
            }
        
        }
        // クリアされたとき
        else if sender.tag == 11{
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}




