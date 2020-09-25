//
//  LoadingView.swift
//  
//
//  Created by lonnie on 2020/9/25.
//
#if canImport(UIKit)
import UIKit
class LoadingView: UIView {
    
    private var loadingLayer = CAShapeLayer()
    
    class Style {
        
        var radius: CGFloat = 30
        
        var ringColor: UIColor = .magenta
        
        var ringWidth: CGFloat = 2
        
        static var `default`: Style {
            return Style()
        }
        
    }
    
    var style: Style = Style.default
    
    init(style: Style = .default, frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        let path = UIBezierPath(arcCenter: CGPoint(x: style.radius, y: style.radius), radius: style.radius / 2, startAngle: 0, endAngle: .pi / 2, clockwise: true)
        loadingLayer.strokeColor = style.ringColor.cgColor
        loadingLayer.fillColor = UIColor.clear.cgColor
        loadingLayer.lineWidth = style.ringWidth
        loadingLayer.frame.size = CGSize(width: style.radius * 2, height: style.radius * 2)
        loadingLayer.path = path.cgPath
        layer.addSublayer(loadingLayer)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: style.radius * 2, height: style.radius * 2)
    }
    
    func show() {
        loadingLayer.add(CABasicAnimation(keyPath: "transform.rotation.z", fromValue: 0, toValue: CGFloat.pi * 2, duration: 0.5, repeatCount: .greatestFiniteMagnitude), forKey: "animation")
        isHidden = false
    }
    
    func hide() {
        loadingLayer.removeAllAnimations()
        isHidden = true
    }
}

#endif
