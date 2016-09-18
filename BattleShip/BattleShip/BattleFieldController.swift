//
//  BattleFieldController.swift
//  BattleShip
//
//  Created by Jason Wang on 9/18/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class BattleFieldController: UIViewController {

    enum Target {
        case Hit
        case Miss
    }

    var shipPosition = [String: Target]()

    let row = 10
    let column = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        navigationItem.title = "Battle Ship"
        setupGrideButton(row, by: column)

    }

    func setupGrideButton(row: Int, by column:Int) {
        for rowItem in 0..<row {
            for colItem in 0..<column {
                createButtonOn(rowItem, col: colItem)
            }
        }
        setBattleShipPosition()
    }

    func setBattleShipPosition() {
        // randomly set the ship position
        let positions = ["0,0", "0,1", "0,2"]
        for position in positions {
            shipPosition[position] = .Hit
        }
    }

    func createButtonOn(row: Int, col: Int) {
        let xValue = (col * 35) + 10 // something
        let yValue = (row * 35) + 80   // something
        let frame = CGRect(x: xValue, y: yValue, width: 32, height: 32)
        let button = UIButton(frame: frame)
        let title = "\(row),\(col)"
        button.setTitle(title, forState: .Normal)
        shipPosition[title] = .Miss
        button.backgroundColor = .blueColor()
        button.addTarget(self, action: #selector(handleButtonTapped), forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }

    func handleButtonTapped(button: UIButton) {
        guard let title = button.currentTitle else { return }
        if shipPosition[title] == .Hit {
            button.backgroundColor = .redColor()
        } else {
            button.backgroundColor = .grayColor()
        }
    }

}









