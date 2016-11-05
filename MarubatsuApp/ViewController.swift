//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 高橋知憲 on 2016/11/05.
//  Copyright © 2016年 高橋知憲. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var rightOrWrong: UILabel!
    
    @IBOutlet weak var currentNumber: UILabel!
    
    //表示中の問題番号を格納
    var currentQuestionNum: Int = 0 //グローバル変数
   
    
    // 問題
    let questions: [[String: Any]] = [
        [
            "question": "iPhoneアプリを開発する統合環境はZcodeである",
            "answer": false
        ],
        [
            "question": "Xcode画面の右側にはユーティリティーズがある",
            "answer": true
        ],
        [
            "question": "UILabelは文字列を表示する際に利用する",
            "answer": true
        ],
        [
            "question": "空は青い",
            "answer": true
        ],
        [
            "question": "冬はアツい",
            "answer": false
        ],
        [
            "question": "いつでも眠い",
            "answer": true
        ],
        [
            "question": "グーはチョキに強い",
            "answer": true
        ],
        [
            "question": "対面する信号が右折を示す青色の灯火の矢印の場合には自動車は矢印の方向に進むことができる",
            "answer": true
        ],
        [
            "question": "運転者が危険を感じてからブレーキをかけ、ブレーキが実際に効き始めるまでの間に進む距離を制動距離という",
            "answer": true
        ],
        [
            "question": "内輪差とは、車が曲がるときに後輪が前輪より内側を通ることにより生じる。",
            "answer": true
        ]
    ]
    
    // 問題を表示する関数
    func showQuestion() {
        let question = questions[currentQuestionNum]
        
        
        let number:Int = currentQuestionNum + 1
        var numberStr = String(number)
        currentNumber.text = "現在の問題番号:"+numberStr
        
        if let que = question["question"] as? String {
            questionLabel.text = que
            
        }
    }
    
    // 回答をチェックする関数
    // 正解なら次の問題を表示します
    func checkAnswer(yourAnswer: Bool) {
        
        if yourAnswer{
            //print("回答ができていません")
            //return
        }
        
        
        
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool {
            
            if yourAnswer == ans {
                 rightOrWrong.text = "前の問題→正解!!!"
                // currentQuestionNumを1足して次の問題に進む
                currentQuestionNum += 1
                
            } else {
                rightOrWrong.text = "不正解"
            }
            
        }else {
                print("問題の答えが入っていません")
        }
        
        // currentQuestionNumの値が問題数以上だったら最初の問題に戻す
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        
        // 問題を表示します。
        // 正解であれば次の問題が、不正解であれば同じ問題が再表示されます。
        showQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tappedNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    
}

