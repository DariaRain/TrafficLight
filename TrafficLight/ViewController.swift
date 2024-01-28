//
//  ViewController.swift
//  TrafficLight
//
//  Created by MacBook Pro on 26.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var switchButton: UIButton!
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    private var currentColor:TrafficLightColors = .red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.layer.cornerRadius = 49
        yellowView.layer.cornerRadius = 49
        greenView.layer.cornerRadius = 49
        switchButton.layer.cornerRadius = 20
        
        redView.alpha = lightIsOff
        yellowView.alpha = lightIsOff
        greenView.alpha = lightIsOff
    }
    
    @IBAction func colorChangeButton(_ sender: UIButton) {
        if switchButton.currentTitle == "START" {
            switchButton.setTitle("NEXT", for: .normal)
            redView.alpha = lightIsOn
            return
        }
        
        switch currentColor {
        case.red:
            redView.alpha = lightIsOff
            yellowView.alpha = lightIsOn
            currentColor = .yellow
        case.yellow:
            yellowView.alpha = lightIsOff
            greenView.alpha = lightIsOn
            currentColor = .green
        case.green:
            greenView.alpha = lightIsOff
            redView.alpha = lightIsOn
            currentColor = .red
        }
    }
}

extension ViewController {
    private enum TrafficLightColors {
        case red, yellow, green
    }
}
