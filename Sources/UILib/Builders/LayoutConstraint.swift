//
//  LayoutConstraint.swift
//  
//
//  Created by lonnie on 2020/1/1.
//
#if canImport(UIKit)
import UIKit

protocol LayoutConstraintConvertable {
    func toLayoutConstraints(with firstItem: UIView, secondItem: UIView?) -> [NSLayoutConstraint]
}

public struct LayoutConstraint: LayoutConstraintConvertable {
    
    public var attribute: NSLayoutConstraint.Attribute
    
    public var secondAttribute: NSLayoutConstraint.Attribute
       
    public var multiplay: CGFloat
       
    public var constant: CGFloat
       
    public var relation: NSLayoutConstraint.Relation
       
    public var priority: UILayoutPriority
       
    init(
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation = .equal,
        secondAttribute: NSLayoutConstraint.Attribute? = nil,
        multiplay: CGFloat = 1.0,
        constant: CGFloat = 0.0,
        priority: UILayoutPriority = .required) {
        self.attribute = attribute
        self.secondAttribute = secondAttribute ?? attribute
        self.relation = relation
        self.multiplay = multiplay
        self.constant = constant
        self.priority = priority
    }
       
    func toLayoutConstraints(with firstItem: UIView, secondItem: UIView?) -> [NSLayoutConstraint] {
        [
            NSLayoutConstraint(
                item: firstItem,
                attribute: attribute,
                relatedBy: relation,
                toItem: secondItem,
                attribute: secondAttribute,
                multiplier: multiplay,
                constant: constant
            )
        ]
    }
    
    static func equalToSuperView(with edgeInsets: UIEdgeInsets) -> [LayoutConstraint] {
        [
            .init(attribute: .leading, constant: edgeInsets.left),
            .init(attribute: .trailing, constant: edgeInsets.right),
            .init(attribute: .top, constant: edgeInsets.top),
            .init(attribute: .bottom, constant: edgeInsets.bottom)
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
    
    
    static func equalToSuperView(_ edgeInsets: UIEdgeInsets = .zero) -> LayoutStrategy {
        return .constraints([
            .init(attribute: .leading, constant: edgeInsets.left),
            .init(attribute: .trailing, constant: edgeInsets.right),
            .init(attribute: .top, constant: edgeInsets.top),
            .init(attribute: .bottom, constant: edgeInsets.bottom),
        ])
    }
    
    static func equalTo(_ size: CGSize) -> LayoutStrategy {
        return .constraints([
            .init(attribute: .width, constant: size.width),
            .init(attribute: .height, constant: size.height),
        ])
    }

    public func toLayoutConstraints(with firstItem: UIView, secondItem: UIView?) -> [NSLayoutConstraint] {
        switch self {
        case .constraint(let constraint, let relation, let secondAttribute, let multiplay, let constant, let priority):
            return LayoutConstraint(
                attribute: constraint,
                relation: relation,
                secondAttribute: secondAttribute,
                multiplay: multiplay,
                constant: constant,
                priority: priority
            ).toLayoutConstraints(with: firstItem, secondItem: secondItem)
        case .constraints(let constraints):
            return constraints.flatMap {
                $0.toLayoutConstraints(with: firstItem, secondItem: secondItem)
            }
        }
    }
}

public extension UIView {
    
    func makeLayout(_ constraint: LayoutStrategy, secondItem: UIView? = nil) {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate(constraint.toLayoutConstraints(with: self, secondItem: secondItem))
    }
    
}

#endif

