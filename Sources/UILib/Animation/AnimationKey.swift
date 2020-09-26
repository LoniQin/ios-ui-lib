//
//  AnimationKey.swift
//  
//
//  Created by lonnie on 2020/9/25.
//
import Foundation
public enum AnimationKey: String, CaseIterable {
    
    case anchorPoint
    
    case backgroundColor
    
    case backgroundFilters
    
    case borderColor
    
    case borderWidth
    
    case bounds
    
    case compositingFilter
    
    case contents
    
    case contentsRect
    
    case cornerRadius
    
    case doubleSided
    
    case filters
    
    case frame
    
    case hidden
    
    case mask
    
    case masksToBounds
    
    case opacity
    
    case position
    
    case shadowColor
    
    case shadowOffset
    
    case shadowOpacity
    
    case shadowPath
    
    case shadowRadius
    
    case sublayers
    
    case sublayerTransform
    
    public static let transform = Transform.transform
    
    case zPosition
    
    
    public enum Transform: String {
        
        case transform
        
        public enum Rotation: String {
            
            case rotation
            
            public var x: String {
                getDescription("x")
            }
            
            public var y: String {
                getDescription("y")
            }
            
            public var z: String {
                getDescription("z")
            }
            
            func getDescription(_ name: String) -> String {
                "transform.rotation.\(name)"
            }
        }
        
        public enum Scale: String {
            
            case scale
            
            public var x: String {
                getDescription("x")
            }
            
            public var y: String {
                getDescription("y")
            }
            
            public var z: String {
                getDescription("z")
            }
            
            func getDescription(_ name: String) -> String {
                print("\(self)")
                return "transform.scale.\(name)"
            }
        }
        
        public enum Translation: String {
            
            case translation
            
            public var x: String {
                getDescription("x")
            }
            
            public var y: String {
                getDescription("y")
            }
            
            public var z: String {
                getDescription("z")
            }
            
            func getDescription(_ name: String) -> String {
                "transform.translation.\(name)"
            }
        }
        
        public var rotation: Rotation {
            Rotation.rotation
        }
        
        public var transation: Translation {
            Translation.translation
        }
        
        public var scale: Scale {
            Scale.scale
        }
        
    }

}
