//
//  RadialGradientLayer.swift
//  ThenAnimatable
//
//  Created by ghost on 01/08/2023.

import UIKit

final class RadialGradientLayer: CALayer {
    
    var startPoint: CGPoint = .zero
    var endPoint: CGPoint = .zero
    var colors = [CGColor]()
    
    required override init() {
        super.init()
        needsDisplayOnBoundsChange = true
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
    }
    
    override func draw(in ctx: CGContext) {
        ctx.saveGState()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard !colors.isEmpty, let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: [0, 1])  else {
            return
        }
        let startCenter = CGPoint(x: bounds.width * startPoint.x,
                                  y: bounds.height * startPoint.y)
        let endCenter = CGPoint(x: bounds.width * endPoint.x,
                                y: bounds.height * endPoint.y)
        
        let endRadius = max(max(frame.size.width - endPoint.x, endPoint.x), max(frame.size.height - endPoint.y, endPoint.y))
        ctx.drawRadialGradient(gradient,
                               startCenter: startCenter,
                               startRadius: 0,
                               endCenter: endCenter,
                               endRadius: endRadius,
                               options: .drawsAfterEndLocation)
    }
    
}
