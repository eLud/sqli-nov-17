//
//  ViewController.swift
//  Pokedex
//
//  Created by Ludovic Ollagnier on 29/11/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    //MARK: Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var levelSlider: UISlider!
    @IBOutlet weak var capturedSwitch: UISwitch!

    @IBOutlet var datePicker: UIDatePicker!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        nameTextField.inputView = datePicker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Actions

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {

        nameTextField.text = "\(datePicker.date)"
    }

    @IBAction func save(_ sender: Any) {
    }

    @IBAction func takePhoto(_ sender: Any) {
    }
}

