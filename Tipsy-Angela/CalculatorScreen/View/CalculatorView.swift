//
//  ClaculatorView.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit


class CalculatorView: UIView {
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .customGreen2
        setupView(view)
        return view
    }()
    
    private let topStackView = UIStackView()
    private let totalLabel = UILabel()
    let billTextField = UITextField()
    
    private let stackView = UIStackView()
    
    private let tipLabel = UILabel()
    
    private let buttonsStackView = UIStackView()
    var ptcButtons: [UIButton] = []
    
    private let splitLabel = UILabel()
    
    private let stepperStackView = UIStackView()
    let splitNumberLabel = UILabel()
    let stepper = UIStepper()
    
    let calculateButton = UIButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTopStackView()
        setupTotalLabel()
        setupBillTextField()
        
        // elements from the greenView
        setupStackView()
        
        // elements from the stackView
        setupTipLabel()
        setupButtonsStackView()
        setupPtcButtons()
        setupSplitLabel()
        setupStepperStackView()
        setupSplitNumberLabel()
        setupStepper()
        
        setupCalculateButton()
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // linked to superview, stackView alignment = center
            totalLabel.heightAnchor.constraint(equalToConstant: 30),
            totalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            trailingAnchor.constraint(equalTo: totalLabel.trailingAnchor, constant: 30),
            
            // linked to superview, stackView alignment = center
            billTextField.heightAnchor.constraint(equalToConstant: 48),
            billTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            trailingAnchor.constraint(equalTo: billTextField.trailingAnchor, constant: 10),
            
            greenView.topAnchor.constraint(equalTo: billTextField.bottomAnchor, constant: 20),
            greenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: trailingAnchor),
            greenView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 20),
            greenView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 20),
            
            // linked to superview, stackView alignment = center
            tipLabel.heightAnchor.constraint(equalToConstant: 30),
            tipLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            trailingAnchor.constraint(equalTo: tipLabel.trailingAnchor, constant: 30),
            
            // linked to superview, stackView (the stackView) alignment = center
            buttonsStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            // b1 width is equal to 30% of buttonsStackView width
            ptcButtons[0].heightAnchor.constraint(equalToConstant: 54),
            ptcButtons[0].widthAnchor.constraint(equalTo: buttonsStackView.widthAnchor, multiplier: 0.3),
            ptcButtons[0].heightAnchor.constraint(equalToConstant: 54),
            ptcButtons[2].heightAnchor.constraint(equalToConstant: 54),
            ptcButtons[2].widthAnchor.constraint(equalTo: ptcButtons[0].widthAnchor),
            
            // linked to superview, stackView alignment = center
            splitLabel.heightAnchor.constraint(equalToConstant: 30),
            splitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            trailingAnchor.constraint(equalTo: splitLabel.trailingAnchor, constant: 30),
            
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 58),
            calculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 

private extension CalculatorView {
    
    func setupTopStackView() {
        topStackView.axis = .vertical
        topStackView.distribution = .fill
        topStackView.alignment = .center
        topStackView.spacing = 20
        
        setupView(topStackView)
    }
    
    func setupTotalLabel() {
        totalLabel.text = "Enter bill total"
        totalLabel.textColor = .lightGray
        totalLabel.font = UIFont.systemFont(ofSize: 20)
        
        topStackView.addArrangedSubview(totalLabel)
    }
    
    func setupBillTextField() {
        billTextField.placeholder = "e.g 123.56"
        billTextField.textColor = .darkGray
        billTextField.font = UIFont.systemFont(ofSize: 40)
        billTextField.keyboardType = .numberPad
        billTextField.textAlignment = .center
        billTextField.clearButtonMode = .always
        
        topStackView.addArrangedSubview(billTextField)
    }
    
    func setupStackView() {
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        greenView.addSubview(stackView)
    }
    
    func setupTipLabel() {
        tipLabel.text = "Select tip"
        tipLabel.textColor = .lightGray
        tipLabel.font = UIFont.systemFont(ofSize: 20)
        
        stackView.addArrangedSubview(tipLabel)
    }
    
    func setupButtonsStackView() {
        buttonsStackView.distribution = .fillProportionally
        buttonsStackView.alignment = .fill
        
        stackView.addArrangedSubview(buttonsStackView)
    }
    
    func setupPtcButtons() {
        [0, 10, 20].forEach { percent in
            let button = UIButton(type: .system)
            button.setTitle("\(percent)%", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
            button.contentMode = .scaleAspectFit
            
            
            button.setTitleColor(.customGreen1, for: .normal)
            button.tintColor = .customGreen1
            
            // selected a button
            if percent == 10 {
                button.isSelected = true
                button.setTitleColor(.white, for: .normal)
            }
            
            buttonsStackView.addArrangedSubview(button)
            
            ptcButtons.append(button)
        }
    }
    
    func setupSplitLabel() {
        splitLabel.text = "Choose Split"
        splitLabel.textColor = .lightGray
        splitLabel.font = UIFont.systemFont(ofSize: 20)
        
        stackView.addArrangedSubview(splitLabel)
    }
    
    func setupStepperStackView() {
        stepperStackView.distribution = .fillEqually
        stepperStackView.alignment = .fill
        stepperStackView.spacing = 20 / 2
        
        stackView.addArrangedSubview(stepperStackView)
    }
    
    func setupSplitNumberLabel() {
        splitNumberLabel.text = "2"
        splitNumberLabel.textColor = .customGreen1
        splitNumberLabel.font = UIFont.systemFont(ofSize: 30)
        splitNumberLabel.textAlignment = .center
        
        stepperStackView.addArrangedSubview(splitNumberLabel)
    }
    
    func setupStepper() {
        stepper.value = 2
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.stepValue = 1
        stepperStackView.addArrangedSubview(stepper)
    }
    
    func setupCalculateButton() {
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        calculateButton.backgroundColor = .customGreen1
        
        setupView(calculateButton)
    }
}



