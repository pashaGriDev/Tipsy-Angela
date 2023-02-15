//
//  ResultController.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit

class ResultController: UIViewController {
    
    let resultView = ResultView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = resultView
    }
}
