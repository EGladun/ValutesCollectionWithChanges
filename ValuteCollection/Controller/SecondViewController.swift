//
//  SecondViewController.swift
//  ValuteCollection
//
//  Created by Egor on 20.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit
//protocol for pass data backward
protocol Delegator: NSObjectProtocol {
    func doSomething(data: (Int, String))
}

class SecondViewController: UIViewController {
    @IBOutlet var rateTextView: UITextField!
    
    var valute: Valute?
    var index: Int?
    weak var delegate: Delegator?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.valute?.code
        self.rateTextView.text = self.valute?.rate
        
        
    }

    @IBAction func saveButton(_ sender: Any) {
        if let delegate = delegate {
            delegate.doSomething(data: (self.index!, self.rateTextView.text!))
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}


