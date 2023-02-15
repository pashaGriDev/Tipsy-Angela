//
//  ClaculatorView.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit

class CalculatorView: UIView {
    
    // MARK: - UI constants
    
    private let mainContainer = UIView()
    
    private let greenView = UIView()
    
    private let totalLabel = UILabel()
    private let billTextField = UITextField()
    
    private let tipLabel = UILabel()
    private let stackView = UIStackView()
    private let ptcButtons: [UIButton] = []
    
    private let splitLabel = UILabel()
    private let splitNumberLabel = UILabel()
    private let stepper = UIStepper()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupGreenView()
        setupMainContainer()
        
        setupTotalLabel()
        setupBillTextField()
        
        setupStackView()
    }
    
    
    // MARK: - Rrivate methods
    
    
    
    private func setupBillTextField() {
        billTextField.placeholder = "e.g 123.56"
        billTextField.textColor = .darkGray
        billTextField.font = UIFont.systemFont(ofSize: 40)
        billTextField.keyboardType = .numberPad
        billTextField.textAlignment = .center
        billTextField.clearButtonMode = .always
        mainContainer.setupView(billTextField)
        
        NSLayoutConstraint.activate([
            billTextField.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: Size.spacing),
            billTextField.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            billTextField.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            billTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupMainContainer() {
        setupView(mainContainer)
        
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Size.leftOffset),
            mainContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Size.rightOffset),
            mainContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupTotalLabel() {
        totalLabel.text = "Enter bill total"
        totalLabel.textColor = .lightGray
        totalLabel.font = UIFont.systemFont(ofSize: 16)
        
        mainContainer.setupView(totalLabel)
        
        NSLayoutConstraint.activate([
            totalLabel.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: Size.offset),
            totalLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            totalLabel.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            totalLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        
        mainContainer.setupView(stackView)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 50)])
    
    }
    
    private func setupGreenView() {
        setupView(greenView)
        
        greenView.backgroundColor = .customGreen2
        
        NSLayoutConstraint.activate([
            greenView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            greenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: trailingAnchor),
            greenView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 
