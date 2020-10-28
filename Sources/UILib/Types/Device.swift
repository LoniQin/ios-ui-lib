//
//  Device.swift
//  
//
//  Created by lonnie on 2020/8/20.
//
#if !os(macOS)

import UIKit

public struct Device {
    
    private var current: UIDevice  { UIDevice.current }
    
    static let `default` = Device()
    
    public var name: String { current.name }

    public var model: String { current.model }

    public var localizedModel: String { current.localizedModel }

    public var systemName: String { current.systemName }

    public var systemVersion: String { current.systemVersion }

    public var orientation: UIDeviceOrientation { current.orientation }

    public var identifierForVendor: UUID? { current.identifierForVendor }

    public var isBatteryMonitoringEnabled: Bool { current.isBatteryMonitoringEnabled }

    public var batteryState: UIDevice.BatteryState { current.batteryState }

    public var batteryLevel: Float {  current.batteryLevel }
     
    public var isProximityMonitoringEnabled: Bool { current.isProximityMonitoringEnabled }

    public var proximityState: Bool { current.proximityState } // always returns NO if no proximity detector

    public var isMultitaskingSupported: Bool { current.isMultitaskingSupported }

    public var userInterfaceIdiom: UIUserInterfaceIdiom { current.userInterfaceIdiom }
    
}

#endif
