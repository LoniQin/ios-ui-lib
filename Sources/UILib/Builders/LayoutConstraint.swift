//
//  LayoutConstraint.swift
//  
//
//  Created by lonnie on 2020/1/1.
//
#if canImport(UIKit)

import UIKit

protocol LayoutConstraintConvertable {
    func toLayoutConstraints(with firstItem: UIView) -> [NSLayoutConstraint]
}

public struct LayoutConstraint: LayoutConstraintConvertable {
    
    public var attribute: NSLayoutConstraint.Attribute
    
    var secondItem: UIView? = nil
    
    public var secondAttribute: NSLayoutConstraint.Attribute
       
    public var multiplay: CGFloat
       
    public var constant: CGFloat
       
    public var relation: NSLayoutConstraint.Relation
       
    public var priority: UILayoutPriority
    
    public var relateToSuperView = false
       
    init(
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
       
    func toLayoutConstraints(with firstItem: UIView) -> [NSLayoutConstraint] {
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

public enum LayoutStrategy: LayoutConstraintConvertable {
    
    case constraint(
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation,
        secondAttribute: NSLayoutConstraint.Attribute?,
        multiplay: CGFloat,
        constant: CGFloat,
        priority: UILayoutPriority = .required
    )
    
    case constraints([LayoutConstraint])
    
    case strategies([LayoutStrategy])
    
    
    static func equalToSuperView(_ edgeInsets: UIEdgeInsets = .zero) -> LayoutStrategy {
        return equalTo(edgeInsets)
    }
    
    static func equalTo(_ edgeInsets: UIEdgeInsets = .zero, view: UIView? = nil) -> LayoutStrategy {
        return .strategies([
            .equalHorizontal(view, offset: (edgeInsets.left, edgeInsets.right)),
            .equalVertical(view, offset: (edgeInsets.top, edgeInsets.bottom))
        ])
    }
    
    static func equalTo(_ size: CGSize) -> LayoutStrategy {
        return .constraints([
            .init(attribute: .width, constant: size.width, relateToSuperView: false),
            .init(attribute: .height, constant: size.height, relateToSuperView: false),
        ])
    }
    
    static func equalHorizontal(_ view: UIView? = nil, offset: (CGFloat, CGFloat) = (0, 0)) -> LayoutStrategy {
        return .strategies([
            .equalLeading(view, offset: offset.0),
            .equalTrailing(view, offset: offset.1)
        ])
    }
    
    static func equalLeading(_ view: UIView? = nil, offset: CGFloat = 0) -> LayoutStrategy {
        return .constraint(attribute: .leading, relation: .equal, secondAttribute: .leading, multiplay: 1.0, constant: offset, priority: .required)
    }
    
    static func equalTrailing(_ view: UIView? = nil, offset: CGFloat = 0) -> LayoutStrategy {
        return .constraint(attribute: .trailing, relation: .equal, secondAttribute: .trailing, multiplay: 1.0, constant: -offset, priority: .required)
    }
    
    static func equalVertical(_ view: UIView? = nil, offset: (CGFloat, CGFloat) = (0, 0)) -> LayoutStrategy {
        return .strategies([
            .equalTop(view, offset: offset.0),
            .equalBottom(view, offset: offset.1)
        ])
    }
    
    static func equalTop(_ view: UIView? = nil, offset: CGFloat = 0) -> LayoutStrategy {
        return .constraint(attribute: .top, relation: .equal, secondAttribute: .top, multiplay: 1.0, constant: offset, priority: .required)
    }
    
    static func equalBottom(_ view: UIView? = nil, offset: CGFloat = 0) -> LayoutStrategy {
        return .constraint(attribute: .bottom, relation: .equal, secondAttribute: .bottom, multiplay: 1.0, constant: -offset, priority: .required)
    }
    
    
    public func toLayoutConstraints(with firstItem: UIView) -> [NSLayoutConstraint] {
        switch self {
        case .constraint(let constraint, let relation, let secondAttribute, let multiplay, let constant, let priority):
            return LayoutConstraint(
                attribute: constraint,
                relation: relation,
                secondAttribute: secondAttribute,
                multiplay: multiplay,
                constant: constant,
                priority: priority
            ).toLayoutConstraints(with: firstItem)
        case .constraints(let constraints):
            return constraints.flatMap {
                $0.toLayoutConstraints(with: firstItem)
            }
        case .strategies(let value):
            return value.flatMap {
                $0.toLayoutConstraints(with: firstItem)
            }
        }
    }
}

public extension UIView {
    
    func makeLayout(_ constraint: LayoutStrategy) {
        if let value = superview?.translatesAutoresizingMaskIntoConstraints, value == true {
            superview?.translatesAutoresizingMaskIntoConstraints = false
        }
        superview?.addConstraints(constraint.toLayoutConstraints(with: self))
    }
    
}

#endif

