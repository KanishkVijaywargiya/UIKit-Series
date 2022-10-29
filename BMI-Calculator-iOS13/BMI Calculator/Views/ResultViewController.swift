//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Kanishk Vijaywargiya on 29/10/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiValue: String?
    var advice: String?
    var bgColor: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adviceLabel.font = .boldSystemFont(ofSize: 22)
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = bgColor
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
