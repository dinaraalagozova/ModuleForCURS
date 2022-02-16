//
//  UIView+Gradient.swift
//  ModuleForCURS
//
//  Created by Dinara Alagozova on 16.02.2022.
//

import UIKit

class GradientView: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor(red: 0.945, green: 0.392, blue: 0.369, alpha: 1).cgColor,
                                UIColor(red: 0.965, green: 0.647, blue: 0.627, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
    }
}
