//
//  ViewController.swift
//  CAShaperLayerAndUIBezierPath
//
//  Created by ABS on 16/2/5.
//  Copyright © 2016年 ABS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bezier:UIBezierPath = UIBezierPath.init()
    var startPoint:CGPoint = CGPoint()
    var movePoint:CGPoint = CGPoint()
    var shaperLayer:CAShapeLayer = CAShapeLayer.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pan:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panTouch(_:)))
        self.view.addGestureRecognizer(pan)
        self.initCAShaper()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initCAShaper() {
        self.shaperLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.shaperLayer.fillColor = nil
        self.shaperLayer.lineCap = kCALineCapRound
        self.shaperLayer.strokeColor = UIColor.cyanColor().CGColor
        self.shaperLayer.lineWidth = 2
        self.view.layer.addSublayer(self.shaperLayer)
    }
    
    func panTouch(pan:UIPanGestureRecognizer) {
        self.startPoint = pan.locationInView(self.view)
        if pan.state == UIGestureRecognizerState.Began {
            self.bezier.moveToPoint(self.startPoint)
        }
        if pan.state == UIGestureRecognizerState.Changed {
            self.movePoint = pan.locationInView(self.view)
            self.bezier.addLineToPoint(self.movePoint)
            self.shaperLayer.path = self.bezier.CGPath
        }
        
    }
}

