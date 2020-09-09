//
//  Assert.swift
//  
//
//  Created by lonnie on 2020/8/22.
//

import Foundation
#if canImport(XCTest)
import XCTest
public protocol AssertProtocol {
    
}

public extension AssertProtocol {
    func equal<T: Equatable>(_ lhs: T, _ rhs: T) {
        XCTAssertEqual(lhs, rhs)
    }
    
    func notEqual<T: Equatable>(_ lhs: T, _ rhs: T) {
        XCTAssertNotEqual(lhs, rhs)
    }
    
    func greaterThan<T: Comparable>(_ lhs: T, _ rhs: T) {
        XCTAssertGreaterThan(lhs, rhs)
    }
    
    func greaterThanOrEqual<T: Comparable>(_ lhs: T, _ rhs: T) {
        XCTAssertGreaterThanOrEqual(lhs, rhs)
    }
    
    func lessThan<T: Comparable>(_ lhs: T, _ rhs: T) {
        XCTAssertLessThan(lhs, rhs)
    }
    
    func lessThanOrEqual<T: Comparable>(_ lhs: T, _ rhs: T) {
        XCTAssertLessThanOrEqual(lhs, rhs)
    }
    
    func `true`(_ expression: Bool) {
        XCTAssertTrue(expression)
    }
    
    func `false`(_ expression: Bool) {
        XCTAssertFalse(expression)
    }
    
    func notNil(_ expression: Any?, message: String = "") {
        XCTAssertNotNil(expression, message)
    }
    
}
public struct Assert: AssertProtocol {}


public struct EquatableAssert<T: Equatable>: AssertProtocol {
    
    public let value: T
    
    public let assert = Assert()
    
    public func equal(_ another: T) {
        assert.equal(value, another)
    }
    
    public func notEqual(_ another: T) {
        assert.notEqual(value, another)
    }
    
    public func notNil() {
        assert.notNil(value)
    }
    
}

extension EquatableAssert where T == Bool {
    
    public func `true`() {
        assert.true(value)
    }
    
    public func `false`() {
       assert.false(value)
    }
    
}

public struct ComparableAssert<T: Comparable> {
    
    public let value: T
    
    public let assert = Assert()
    
    public func equal(_ another: T) {
        assert.equal(value, another)
    }
    
    public func notEqual(_ another: T) {
        assert.notEqual(value, another)
    }
    
    public func greaterThan(_ another: T) {
        assert.greaterThan(value, another)
    }
    
    public func greaterThanOrEqual(_ another: T) {
        assert.greaterThanOrEqual(value, another)
    }
    
    public func lessThan(_ another: T) {
        assert.lessThan(value, another)
    }
    
    public func lessThanOrEqual(_ another: T) {
        assert.lessThanOrEqual(value, another)
    }
    
}

public extension Equatable {
    
    var assert: EquatableAssert<Self> { EquatableAssert(value: self) }

}

public extension Comparable {
    
    var assert: ComparableAssert<Self> { ComparableAssert(value: self) }

}

#endif
