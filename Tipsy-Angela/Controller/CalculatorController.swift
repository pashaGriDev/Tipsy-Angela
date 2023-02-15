//
//  StartController.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit

class CalculatorController: UIViewController {

    let calculatorView = CalculatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = calculatorView
    }
}
