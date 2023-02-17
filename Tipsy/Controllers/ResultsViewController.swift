//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Taehoon Lee on 2023/01/30.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var calculationResult: String?
    var tip: Double?
    var splitNumber: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = calculationResult
        settingLabel.text = "Split between \(splitNumber ?? "2") people, with \(Int(tip! * 100))% tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
