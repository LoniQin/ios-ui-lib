//
//  LayoutConstraint.swift
//  
//
//  Created by lonnie on 2020/9/4.
//
#if !os(macOS)
import UIKit
public struct LayoutConstraint: LayoutConstraintConvertable {
    
    public var attribute: NSLayoutConstraint.Attribute
    
    var secondItem: UIView? = nil
    
    public var secondAttribute: NSLayoutConstraint.Attribute
       
    public var multiplay: CGFloat
       
    public var constant: CGFloat
       
    public var relation: NSLayoutConstraint.Relation
       
    public var priority: UILayoutPriority
    
    public var relateToSuperView = false
       
    public init(
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        secondItem: UIView? = nil,
        secondAttribute: NSLayoutConstraint.Attribute? = nil,
        multiplay: CGFloat = 1.0,
        constant: CGFloat = 0.0,
        priority: UILayoutPriority = .required,
        relateToSuperView: Bool = true
    ) {
        self.attribute = attribute
        self.secondItem = secondItem
        self.secondAttribute = secondAttribute ?? attribute
        self.relation = relation
        self.multiplay = multiplay
        self.constant = constant
        self.priority = priority
        self.relateToSuperView = relateToSuperView
    }
       
    public func toLayoutConstraints(with firstItem: UIView) -> [NSLayoutConstraint] {
        [
            NSLayoutConstraint(
                item: firstItem,
                attribute: attribute,
                relatedBy: relation,
                toItem: (secondItem == nil && relateToSuperView) ? firstItem.superview : secondItem,
                attribute: secondAttribute,
                multiplier: multiplay,
                constant: constant
            )
        ]
    }

}
#endif
