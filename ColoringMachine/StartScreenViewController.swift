//
//  StartScreenViewController.swift
//  ColoringMachine
//
//  Created by g.semshchikov on 13.01.2023.
//

import UIKit

class StartScreenViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editColorVC = segue.destination as! EditColorViewController
        editColorVC.delegate = self
        editColorVC.startColor = mainView.backgroundColor ?? UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showEditColor", sender: nil)
    }
}

extension StartScreenViewController: EditColorViewControllerDelegate {
    func saveColor(color: UIColor) {
        mainView.backgroundColor = color
    }
}
