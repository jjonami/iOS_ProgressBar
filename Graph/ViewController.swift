//
//  ViewController.swift
//  Graph
//
//  Created by JJONAMI on 30/12/2018.
//  Copyright © 2018 JJONAMI. All rights reserved.
//

import UIKit

extension NSLayoutConstraint{
    func changeMultiplier(multiplier:CGFloat) -> NSLayoutConstraint{
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var ratio1: NSLayoutConstraint!
    @IBOutlet weak var ratio2: NSLayoutConstraint!
    @IBOutlet weak var ratio3: NSLayoutConstraint!
    @IBOutlet weak var ratio4: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setRatio()
    }
    
    func setRatio(){
        ratio1 = ratio1.changeMultiplier(multiplier: 0.8)
        ratio2 = ratio2.changeMultiplier(multiplier: 0.4)
        ratio3 = ratio3.changeMultiplier(multiplier: 1)
        ratio4 = ratio4.changeMultiplier(multiplier: 0.6)
        
        //애니메이션
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }


}

