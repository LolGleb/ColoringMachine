//
//  StartScreenViewController.swift
//  ColoringMachine
//
//  Created by g.semshchikov on 13.01.2023.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editColorVC = segue.destination as! EditColorViewController
        editColorVC.delegate = self
        editColorVC.mainViewColor = view.backgroundColor
    }
}

// MARK: - Color delegate
extension StartScreenViewController: EditColorViewControllerDelegate {
    func saveColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
