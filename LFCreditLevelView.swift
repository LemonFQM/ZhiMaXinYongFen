//
//  LFCreditLevelView.swift
//  ZhiMaXinYongFen
//
//  Created by Topband on 15/7/20.
//  Copyright (c) 2015年 Topband. All rights reserved.
//

import UIKit
//static inline float radians(double degrees) { return degrees * M_PI / 180.f;}

func radians(#degrees: Double) -> Double {return degrees * M_PI / 180.0}

class LFCreditLevelView: UIView {

    var contentValue:[Float]?
    
    func update() {
        self.setNeedsDisplay()
    }
    
    private func drawContent() {
        if let content = contentValue {
            let sideLenght = CGRectGetWidth(self.bounds)
            let radius = sideLenght / 2.0
            let avgDegree = 360.0 / 5.0
            
            let context = UIGraphicsGetCurrentContext()
            CGContextSetFillColorWithColor(context, UIColor.blueColor().colorWithAlphaComponent(0.5).CGColor)
            
            for index in 0 ..< content.count {
                let value = content[index]
                let contentRaius = CGFloat(value) * radius
                if index == 0 {
                    let x:CGFloat = sideLenght / 2.0
                    let y:CGFloat = radius - contentRaius
                    CGContextMoveToPoint(context, x, y)
                } else if index == 1 {
                    let y = CGFloat(Double(radius) - cos(radians(degrees: avgDegree)) * Double(contentRaius))
                    let x = CGFloat(Double(radius) + sin(radians(degrees: avgDegree)) * Double(contentRaius))
                    CGContextAddLineToPoint(context, x, y)
                } else if index == 2 {
                    let y = CGFloat(Double(radius) + cos(radians(degrees: 180 - avgDegree * 2.0)) * Double(contentRaius))
                    let x = CGFloat(Double(radius) + sin(radians(degrees: 180 - avgDegree * 2.0)) * Double(contentRaius))
                    CGContextAddLineToPoint(context, x, y)
                } else if index == 3 {
                    let y = CGFloat(Double(radius) + cos(radians(degrees: 180 - avgDegree * 2.0)) * Double(contentRaius))
                    let x = CGFloat(Double(radius) - sin(radians(degrees: 180 - avgDegree * 2.0)) * Double(contentRaius))
                    CGContextAddLineToPoint(context, x, y)
                } else if index == 4 {
                    let y = CGFloat(Double(radius) - cos(radians(degrees: avgDegree)) * Double(contentRaius))
                    let x = CGFloat(Double(radius) - sin(radians(degrees: avgDegree)) * Double(contentRaius))
                    CGContextAddLineToPoint(context, x, y)
                }
            }
            
            CGContextClosePath(context)
            CGContextFillPath(context)
        }
        
    }
    
    private func drawForm() {
        let sideLenght = CGRectGetWidth(self.bounds)
        let radius = sideLenght / 2.0
        let avgDegree = 360.0 / 5.0
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
        var points = [CGPoint]()
        
        for index in 0 ..< 5
        {
            var x:CGFloat = 0.0, y:CGFloat = 0.0
            if index == 0 {
                x = sideLenght / 2.0
                y = 0.0
                CGContextMoveToPoint(context, x, y)
            } else if index == 1 {
                y = CGFloat(Double(radius) - cos(radians(degrees: avgDegree)) * Double(radius))
                x = CGFloat(Double(radius) + sin(radians(degrees: avgDegree)) * Double(radius))
                CGContextAddLineToPoint(context, x, y)
            } else if index == 2 {
                y = CGFloat(Double(radius) + cos(radians(degrees: 180 - avgDegree * 2.0)) * Double(radius))
                x = CGFloat(Double(radius) + sin(radians(degrees: 180 - avgDegree * 2.0)) * Double(radius))
                CGContextAddLineToPoint(context, x, y)
            } else if index == 3 {
                y = CGFloat(Double(radius) + cos(radians(degrees: 180 - avgDegree * 2.0)) * Double(radius))
                x = CGFloat(Double(radius) - sin(radians(degrees: 180 - avgDegree * 2.0)) * Double(radius))
                CGContextAddLineToPoint(context, x, y)
            } else if index == 4 {
                y = CGFloat(Double(radius) - cos(radians(degrees: avgDegree)) * Double(radius))
                x = CGFloat(Double(radius) - sin(radians(degrees: avgDegree)) * Double(radius))
                CGContextAddLineToPoint(context, x, y)
            }
            points.append(CGPointMake(x, y))
        }
        CGContextClosePath(context)
        
        CGContextMoveToPoint(context, radius, radius)
        for point in points {
            CGContextAddLineToPoint(context, point.x, point.y)
            CGContextClosePath(context)
        }
        CGContextStrokePath(context)
    }
    
    override func drawRect(rect: CGRect) {
        self.drawForm()
        self.drawContent()
    }

}
