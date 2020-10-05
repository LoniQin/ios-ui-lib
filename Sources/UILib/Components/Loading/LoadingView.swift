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
    
    private var loadingBottomLayer = CAShapeLayer()
    
    private var loadingLayer = CAShapeLayer()
    
    private struct Constants {
        static let animationKey = "animation"
    }
    
    public class Style: Configurable {
        
        public var radius: CGFloat = 30
        
        public var bottomRingColor: UIColor = .clear
        
        public var ringColor: UIColor = .white
        
        public var startAngle: CGFloat = 0
        
        public var endEngle: CGFloat = .pi
        
        public var ringWidth: CGFloat = 5
        
        public var duration: TimeInterval = 0.6
        
        public var backgroundColor: UIColor = .clear
        
        public var insets: UIEdgeInsets = .zero
        
        public var cournerRaidus: CGFloat = 5
        
        public static var `default`: Style {
            return Style()
        }
        
    }
    
    public var style: Style = Style.default
    
    public init(style: Style = .default, frame: CGRect = .zero) {
        super.init(frame: frame)
        self.style = style
        setupView()
        
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        with(\.backgroundColor, style.backgroundColor)
            .do {
            $0.layer.cornerRadius = $0.style.cournerRaidus
            $0.layer.masksToBounds = true
            $0.loadingBottomLayer = $0.addShapeLayer(startAngle: 0, endEngle: .pi * 2, ringColor: $0.style.bottomRingColor)
            $0.loadingLayer = $0.addShapeLayer(startAngle: $0.style.startAngle, endEngle: $0.style.endEngle, ringColor: $0.style.ringColor)
        }
    }
    
    func addShapeLayer(startAngle: CGFloat, endEngle: CGFloat, ringColor: UIColor) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath(arcCenter: CGPoint(x: style.radius, y: style.radius), radius: style.radius / 2, startAngle: startAngle, endAngle: endEngle, clockwise: true)
        shapeLayer.strokeColor = ringColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = style.ringWidth
        shapeLayer.frame.origin.x = style.insets.left
        shapeLayer.frame.origin.y = style.insets.top
        shapeLayer.frame.size = CGSize(width: style.radius * 2, height: style.radius * 2)
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        return shapeLayer
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(
            width: style.radius * 2 + style.insets.left + style.insets.right,
            height: style.radius * 2 + style.insets.top + style.insets.bottom
        )
    }
    
    public func show() {
        loadingLayer.add(CABasicAnimation(keyPath: AnimationKey.transform.rotation.z, fromValue: 0, toValue: CGFloat.pi * 2, duration: style.duration, repeatCount: .greatestFiniteMagnitude, timingFunction: .init(name: .linear)), forKey: Constants.animationKey)
        isHidden = false
    }
    
    public func hide() {
        loadingLayer.removeAnimation(forKey: Constants.animationKey)
        isHidden = true
    }
    
}

#endif
