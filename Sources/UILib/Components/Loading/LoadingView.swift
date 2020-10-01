//
//  LoadingView.swift
//  
//
//  Created by lonnie on 2020/9/25.
//
#if canImport(UIKit)
import UIKit
import FoundationLib
public class LoadingView: UIView {
    
    private var loadingLayer = CAShapeLayer()
    
    public class Style: Configurable {
        
        public var radius: CGFloat = 30
        
        public var ringColor: UIColor = .magenta
        
        public var startAngle: CGFloat = 0
        
        public var endEngle: CGFloat = .pi * 4 / 3
        
        public var ringWidth: CGFloat = 5
        
        public var duration: TimeInterval = 0.5
        
        public static var `default`: Style {
            return Style()
        }
        
    }
    
    public var style: Style = Style.default
    
    public init(style: Style = .default, frame: CGRect = .zero) {
        super.init(frame: frame)
        self.style = style
        setupView()
        backgroundColor = .clear
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        let path = UIBezierPath(arcCenter: CGPoint(x: style.radius, y: style.radius), radius: style.radius / 2, startAngle: style.startAngle, endAngle: style.endEngle, clockwise: true)
        loadingLayer.strokeColor = style.ringColor.cgColor
        loadingLayer.fillColor = UIColor.clear.cgColor
        loadingLayer.lineCap = .round
        loadingLayer.lineWidth = style.ringWidth
        loadingLayer.frame.size = CGSize(width: style.radius * 2, height: style.radius * 2)
        loadingLayer.path = path.cgPath
        layer.addSublayer(loadingLayer)
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: style.radius * 2, height: style.radius * 2)
    }
    
    public func show() {
        loadingLayer.add(CABasicAnimation(keyPath: "transform.rotation.z", fromValue: 0, toValue: CGFloat.pi * 2, duration: style.duration, repeatCount: .greatestFiniteMagnitude), forKey: "animation")
        isHidden = false
    }
    
    public func hide() {
        loadingLayer.removeAllAnimations()
        isHidden = true
    }
}

#endif
