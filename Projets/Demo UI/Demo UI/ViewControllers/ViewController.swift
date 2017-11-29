//
//  ViewController.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 29/11/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var allElements: [UIView]!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        nameTextField.backgroundColor = UIColor.red
    }

    @IBAction func showTextFieldValueInLabel(_ sender: UIButton) {

        sender.backgroundColor = UIColor.red
    }

}












