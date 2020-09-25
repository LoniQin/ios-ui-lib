//
//  AnimationKey.swift
//  
//
//  Created by lonnie on 2020/9/25.
//
import Foundation
enum AnimationKey: String, CaseIterable {
    
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
    
    static let transform = Transform.transform
    
    case zPosition
    
    
    enum Transform: String {
        
        case transform
        
        enum Rotation: String {
            
            case rotation
            
            var x: String {
                getDescription("x")
            }
            
            var y: String {
                getDescription("y")
            }
            
            var z: String {
                getDescription("z")
            }
            
            func getDescription(_ name: String) -> String {
                "transform.rotation.\(name)"
            }
        }
        
        enum Scale: String {
            
            case scale
            
            var x: String {
                getDescription("x")
            }
            
            var y: String {
                getDescription("y")
            }
            
            var z: String {
                getDescription("z")
            }
            
            func getDescription(_ name: String) -> String {
                "transform.scale.\(name)"
            }
        }
        
        enum Translation: String {
            
            case translation
            
            var x: String {
                getDescription("x")
            }
            
            var y: String {
                getDescription("y")
            }
            
            var z: String {
                getDescription("z")
            }
            
            func getDescription(_ name: String) -> String {
                "transform.translation.\(name)"
            }
        }
        
        var rotation: Rotation {
            Rotation.rotation
        }
        
        var transation: Translation {
            Translation.translation
        }
        
        var scale: Scale {
            Scale.scale
        }
        
    }

}
