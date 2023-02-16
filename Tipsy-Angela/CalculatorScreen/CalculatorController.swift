//
//  StartController.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit

class CalculatorController: UIViewController {

    private let calculatorView = CalculatorView()
    private var brain = Brain()

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
        
        let resultVC = ResultController()
//        resultVC.modalPresentationStyle = .fullScreen
        show(resultVC, sender: nil)
    }
    
    func stepperDidChange(_ sender: UIStepper) {
        calculatorView.splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
}

extension CalculatorController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print("TF : \(string)")
        
        return brain.isValidCharacter(string)
    }
    
}
