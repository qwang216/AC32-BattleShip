//
//  BattleFieldViewController.swift
//  BattleShip
//
//  Created by Jason Wang on 9/18/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class BattleFieldController: UIViewController {

    var shipPosition = [String: Target]()
    let row = 10
    let column = 10

    enum Target {
        case Hit
        case Miss
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupBattleFieldGrid(row, by: column)
    }

    func setupNavBar() {
        navigationItem.title = "Battle Ship"
        view.backgroundColor = .whiteColor()
    }

    func setupBattleFieldGrid(x: Int, by y: Int) {
        for rowItem  in 0..<x {
            for columnItem in 0..<y {
                addButtonOn(rowItem, column: columnItem)
                print(rowItem, columnItem)
            }
        }
        positionAllBattleShips()
    }

    func positionAllBattleShips() {
        let positions = ["0,0", "0,1", "0,2", "0,3", "3,3", "3,4", "3,5"]
        for position in positions {
            shipPosition[position] = .Hit
        }

//        let positions = generateCoordinateWithBattleShip(5)
//        for position in positions {
//            shipPosition[position] = .Hit
//        }
    }

    func generateCoordinateWithBattleShip(size: Int) -> [String] {
        let isVerticle = Bool(Int(arc4random_uniform(1)))
        let xPosition = Int(arc4random_uniform(UInt32(column)))
        let yPosition = Int(arc4random_uniform(UInt32(row)))
        if isVerticle {
            // check if colume have at least ship's size space available
            // if it does then random yPosition base on available space
            var availableSpace = 0
            var isConsecutive = false
            var startingConsecutivePosition = ""

            for x in 0..<column {
                let position = "\(x),\(yPosition)"
                if canBePlaceAtPosition(position) && availableSpace < size {
                    availableSpace += 1
                    if !isConsecutive {
                        startingConsecutivePosition = position
                    }
                    isConsecutive = true
                } else {

                }
            }


            // if it doesn't generate random yPosition again

        } else {
            // check if row have at least ship's size space available
        }
        return [""]
    }

    func canBePlaceAtPosition(position: String) -> Bool {
        if shipPosition[position] == .Miss {
            return true
        }
        return false
    }

    func addButtonOn(row: Int, column: Int) {
        let xValue = (column * 35) + 10
        let yValue = (row * 35) + 80
        let frame = CGRect(x: xValue, y: yValue, width: 33, height: 33)
        let gridButton = UIButton(frame: frame)
        let position = "\(row),\(column)"
        gridButton.setTitle( position, forState: .Normal)
        shipPosition[position] = .Miss
        gridButton.backgroundColor = .blueColor()
        gridButton.addTarget(self, action: #selector(handleGridButton), forControlEvents: .TouchUpInside)
        view.addSubview(gridButton)
    }

    func handleGridButton(button: UIButton) {
        guard let title = button.currentTitle else { return }
        print(title)
        if shipPosition[title] == .Hit {
            button.backgroundColor = .redColor()
        }
    }

}
