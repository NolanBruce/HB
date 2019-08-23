//
//  IBUCalculatorController.swift
//  HBApp
//
//  Created by Nolan Bruce on 8/22/19.
//  Copyright © 2019 Nolan Bruce. All rights reserved.
//

import UIKit

struct Hop {
    var name : String
    var oz : Float
    var aa : Float
    var min : Int
    
    init(name : String, oz : Float, aa : Float, min : Int) {
        self.name = name
        self.oz = oz
        self.aa = aa
        self.min = min
    }
}

class IBUCalculatorController: UIViewController {
    
    var hops : [Hop] = []
    var magnum, kentGoldings, cascade : Hop
    
    required init?(coder aDecoder: NSCoder) {
        //Magnum Hops
        magnum = Hop(name : "Magnum", oz : Float(2), aa : Float(13), min : 60)
        hops.append(magnum)
        //Kent Golding Hops
        kentGoldings = Hop(name : "Kent Goldings", oz : Float(1), aa : Float(5.5), min : 30)
        hops.append(kentGoldings)
        //Cascade Hops
        cascade = Hop(name : "Cascade", oz : Float(1), aa : Float(5.3), min : 10)
        hops.append(cascade)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Testing. IBUs of Hops: " + String(self.calculateIBUs(hops: self.hops)))
    }
    /*
    * Returns Utlizization percentage for a given amount of time
    * that hops spend in the boil
    */
    func getUtilization(min: Int) -> Float {
        if min <= 5 { return Float(5.0) } else
        if min <= 10 { return Float(6.0) } else
        if min <= 15 { return Float(8.0) } else
        if min <= 20 { return Float(10.1) } else
        if min <= 25 { return Float(12.1) } else
        if min <= 30 { return Float(15.3) } else
        if min <= 35 { return Float(18.8) } else
        if min <= 40 { return Float(22.8) } else
        if min <= 45 { return Float(26.9) } else
        if min <= 50 { return Float(28.1) } else
        if min <= 60 { return Float(30) }
        return Float(31)
    }
    
    func calcAnIBU(aHop : Hop) -> Float {
        print("calcAnIBU called on " + aHop.name)
        var result = Float(0)
        
        //Formula:
        result = (aHop.oz * aHop.aa * (self.getUtilization(min: aHop.min))) / 7.25
        
        print(aHop.name + " IBUs: " + String(result))
        return result
    }
    
    func calculateIBUs(hops : [Hop]) -> Float {
        print("calculateIBUs called on an array of Hops")
        var result = Float(0)
        for aHop in hops {
            result += calculateIBUs(aHop : aHop)
        }
        
        print("calculateIBUs result: " + String(result))
        return result
    }
    
    func calculateIBUs(aHop : Hop) -> Float {
        print("calculateIBUs called on a single Hop")
        return calcAnIBU(aHop : aHop)
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
