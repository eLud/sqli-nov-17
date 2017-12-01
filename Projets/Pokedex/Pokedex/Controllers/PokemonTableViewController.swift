//
//  PokemonTableViewController.swift
//  Pokedex
//
//  Created by Ludovic Ollagnier on 01/12/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {

    var manager = PokeManager()

    override func viewDidLoad() {
        super.viewDidLoad()


        manager.add(Pokemon(name: "test", level: 0, type: .fire, captured: false))

        let notCenter = NotificationCenter.default
//        notCenter.addObserver(self, selector: #selector(reload), name: Notification.Name("modelUpdated"), object: nil)

        notCenter.addObserver(forName: Notification.Name("modelUpdated"), object: nil, queue: OperationQueue.main) { (notif: Notification) in
            self.tableView.reloadData()
            print(notif.name)
        }
    }

//    @objc func reload() {
//        self.tableView.reloadData()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 1
        } else if section == 1 {
            return manager.list().count
        }

        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell

        switch indexPath.section {
        case 0:
        cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath)
            let pokemon = manager.list()[indexPath.row]

            cell.textLabel?.text = pokemon.name
            cell.detailTextLabel?.text = "Niveau \(pokemon.level)"
        default:
            fatalError()
        }

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showForm" {

            guard let destination = segue.destination as? ViewController else { return }
            destination.manager = self.manager
        }
    }

}
















