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
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var levelLabel: UILabel!

    //MARK: - Instance properties
    var manager = PokeManager()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Actions

    @IBAction func levelSliderValueChanged(_ sender: UISlider) {
        let rounded = round(sender.value)

        //Déplacement cranté
        sender.value = rounded

        //Valeur dans le label
        levelLabel.text = "\(Int(sender.value))"
    }

    @IBAction func save(_ sender: Any) {

        guard let name = nameTextField.text, name.count > 2 else {
            nameTextField.backgroundColor = UIColor.red
            return
        }
        nameTextField.backgroundColor = UIColor.white

        let type = selectedType()
        let level = Int(round(levelSlider.value))
        let captured = capturedSwitch.isOn

        let newPokemon = Pokemon(name: name, level: level, type: type, captured: captured)

        manager.add(newPokemon)

        print(manager.list())
    }
    
    @IBAction func takePhoto(_ sender: Any) {

    }

    //MARK: - Private methods

    private func configureUI() {
        configureSegmentedControl()
        photoButton.setTitle("📷", for: .normal)
        photoButton.setTitle("📸", for: .highlighted)

        levelLabel.text = "\(Int(levelSlider.value))"

        view.backgroundColor = UIColor.monVert
        
    }

    private func configureSegmentedControl() {
        typeSegmentedControl.removeAllSegments()
        for type in Pokemon.PokemonType.allTypes {
            typeSegmentedControl.insertSegment(withTitle: type.emojiValue, at: type.rawValue, animated: false)
        }
        typeSegmentedControl.selectedSegmentIndex = 0
    }

    private func selectedType() -> Pokemon.PokemonType {
        let index = typeSegmentedControl.selectedSegmentIndex
        guard let type = Pokemon.PokemonType(rawValue: index) else { fatalError() }
        return type
    }













}

