//
//  SecondViewController.swift
//  Pokedex
//
//  Created by Ludovic Ollagnier on 29/11/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

import UIKit


extension UIColor {

    static var monVert: UIColor {
        return UIColor(red: 0.0, green: 0.5, blue: 0.4, alpha: 1)
    }

    func lowerColor() {
        print("A lower color")
    }
}

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
