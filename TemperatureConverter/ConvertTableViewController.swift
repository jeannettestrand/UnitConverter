//
//  ConvertorTableViewController.swift
//  Handles Table View drawing.
//
//  Created by Jeannette on 2018-02-18.
//  Copyright © 2018 Jeannette. All rights reserved.
//

import UIKit

// 
class ConvertTableViewController: UITableViewController {

    //MARK: Properties
    var items = [Conversion]()
    let cellIdentifier = "ConvertTableViewCell"
    
    // Initializes the Table View Controller class
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleConversions()
    }
    
    // Catches memory errors
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // Tells the table view how many sections to display
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Tells the table view how many rows to Create
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Configures and provides a cell to display for a given row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Requests a cell from the table view
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConvertTableViewCell else {
            fatalError("Selected cell is not of type \(cellIdentifier)")
        }
        
        // Fetches the appropriate item for data source layout
        let item = items[indexPath.row]
        cell.nameLabel.text = item.nameLabel
        return cell
    }
    
    // Creates data item to pass to View Controller for display
    // If error encountered fatalError message sent
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ShowDetail" {
            guard let detailViewController = segue.destination as? ViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
            guard let selectedTableViewCell = sender as? ConvertTableViewCell else {
                fatalError("Unexpected destination \(String(describing: sender))")
            }
            guard let indexPath = tableView.indexPath(for: selectedTableViewCell) else {
                fatalError("Unexpected index path for \(selectedTableViewCell)")
            }
            detailViewController.item = items[indexPath.row]
        }
    }
    
    // Catches cancel function segue from View Controller
    @IBAction func unwindToConversionList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let item = sourceViewController.item {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Edit
                items[selectedIndexPath.row] = item
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }
            }
    }

    // MARK: Private Methods
    // Instantiate default Conversion data objects for application
    private func loadSampleConversions() {
        guard let area = Conversion(nameLabel: "Area Converter",
                                    buttonLabelA: " ha > ac ",
                                    buttonLabelB: " ac > ha ",
                                    closureA: {(value: Double) -> Double? in return value < 0 ? nil : value * 2.47105},
                                    closureB: {(value: Double) -> Double? in return value < 0 ? nil : value * 0.404686}
            ) else { fatalError("Unable to instantiate Area") }
            
        guard let length = Conversion(nameLabel: "Length Converter",
                                      buttonLabelA: " m > ' ",
                                      buttonLabelB: " ' > m ",
                                      closureA: {(value: Double) -> Double? in return value < 0 ? nil : value * 3.28084},
                                      closureB: {(value: Double) -> Double? in return value < 0 ? nil : value * 0.305}
            ) else { fatalError("Unable to instantiate Length")}
        
        guard let weight = Conversion(nameLabel: "Weight Converter",
                                      buttonLabelA: " lbs > kg ",
                                      buttonLabelB: " kg > lbs ",
                                      closureA: {(value: Double) -> Double? in return value < 0 ? nil : value * 0.453592},
                                      closureB: {(value: Double) -> Double? in return value < 0 ? nil : value * 2.20462}
            ) else { fatalError("Unable to instantiate Weight") }
        
        guard let temperature = Conversion(nameLabel: "Temperature Converter",
                                            buttonLabelA: " °C > F ",
                                            buttonLabelB: " F > °C ",
                                            closureA: {(value: Double) -> Double in return value * 1.8 + 32},
                                            closureB: {(value: Double) -> Double in return (value - 32.0) * 5.0 / 9.0}
            ) else { fatalError("Unable to instantiate Temperature") }
        // Add Conversion objects to items array for cell population
        items += [area, length, weight, temperature]
    }
}

