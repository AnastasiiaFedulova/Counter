//
//  ViewController.swift
//  sprint_03
//
//  Created by Anastasiia on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var counter: UILabel!
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var plus: UIButton!
    
    @IBOutlet var minus: UIButton!
    
    @IBOutlet var delete: UIButton!
    
    @IBOutlet var history: UITextView!
  
    var historyArray: [String] = ["История изменений:"]
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter.text = "Значение счётчика: \(number)"
        history.text = "История изменений:"
    }
    
    private func appendHistory(_ a: String){
        let currentDate = Date()
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "y-M-d HH:mm "
        historyArray.append(formatter3.string(from: currentDate) + a)
        history.text = historyArray.joined(separator: "\n")
    }
    private func changeCounter() {
        counter.text = "Значение счётчика: \(number)"
    }
    
    @IBAction func pressTheButton(_ sender: Any) {
        number += 1
        changeCounter()
        appendHistory("значение изменено на +1")
    }
    
    @IBAction func pressPlus(_ sender: Any) {
        number += 1
        changeCounter()
        appendHistory("значение изменено на +1")
    }
    
    @IBAction func pressMinus(_ sender: Any) {
        if number > 0 {
            number -= 1
            appendHistory("значение изменено на -1")
        } else if number == 0 {
            appendHistory("попытка уменьшить значение счётчика ниже 0")
        }
        changeCounter()
    }
    
    @IBAction func pressDelete(_ sender: Any) {
        number = 0
        changeCounter()
        appendHistory("значение сброшено")
    }
}

