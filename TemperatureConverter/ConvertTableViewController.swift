//
//  ConvertorTableViewController.swift
//  TemperatureConverter
//
//  Created by Jeannette on 2018-02-18.
//  Copyright © 2018 Jeannette. All rights reserved.
//

import UIKit

class ConvertTableViewController: UITableViewController {

    //MARK: Properties
    
    var conversions = [Conversion]()
    let cellIdentifier = "ConvertTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleConversions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // Tells the table view how many sections to display
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Tells the table view how many rows to Create
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return converisons.count
    }
    
    // Configures and provides a cell to display for a given row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Requests a cell from the table view
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConvertTableViewCell else {
            fatalError("Selected cell is not of type \(cellIdentifier)")
        }
        //fetches the appropriate conversion for data source layout
        let conversion = conversions[indexPath.row]
        cell.nameLabel.text = conversion.name
        return cell
    }
    // MARK: Private Methods
    
    private func loadSampleConversions() {
        guard let area = Conversion(name: "Area", unit1Name: "ac", unit1: 1.0, unit2Name: "ha", unit2: 0.405) else {
            fatalError("Unable to instantiate Area")
        }
        guard let length = Conversion(name: "Length", unit1Name: "'", unit1: 1.0,  unit2Name: "m", unit2: 0.305) else {
            fatalError("Unable to instantiate Length")
        }
        guard let weight = Conversion(name: "Weight",  unit1Name: "lbs", unit1: 1.0, unit2Name: "kg", unit2: 0.454) else {
            fatalError("Unable to instantiate Weight")
        }
        //guard let temperature = Conversion(name: "Temperature", unit1: 1.0, unit2: 0.305) else {
        //    fatalError("Unable to instantiate Temperature")
        //}
        
        conversions += [area, length, weight]
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
