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
        setup()
    }
    
    // close keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


private extension CalculatorController {
    
    func setup() {
        view = calculatorView
        
        calculatorView.billTextField.delegate = self
        
        calculatorView.ptcButtons.forEach {
            $0.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        }
        
        calculatorView.calculateButton.addTarget(self, action: #selector(calculateButtonDidPress), for: .touchUpInside)
        
        calculatorView.stepper.addTarget(self, action: #selector(stepperDidChange), for: .valueChanged)
    }
}

@objc extension CalculatorController {
    func buttonDidPress(_ sender: UIButton) {
        print("didPress - \(sender.currentTitle!)")
    }
    
    func calculateButtonDidPress() {
        print("calculateButtonDidPress")
    }
    
    func stepperDidChange(_ sender: UIStepper) {
        print("stepperDidChange \(sender.value)")
    }
}

extension CalculatorController: UITextFieldDelegate {
    
}
