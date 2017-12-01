//
//  PokeDetailsViewController.swift
//  Pokedex
//
//  Created by Ludovic Ollagnier on 01/12/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

import UIKit

class PokeDetailsViewController: UIViewController {

    var pokemonToDisplay: Pokemon?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let p = pokemonToDisplay else { fatalError("J'ai pas de pokemon à afficher") }

        title = p.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
