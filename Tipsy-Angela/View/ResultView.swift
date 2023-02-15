//
//  ResultView.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit

class ResultView: UIView {
    
    let greenView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .customGreen2
        setupGreenView()
        
    }
    
    private func setupGreenView() {
        setupView(greenView)
        
        greenView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            greenView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65),
            greenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: trailingAnchor),
            greenView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
