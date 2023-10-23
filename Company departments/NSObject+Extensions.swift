//
//  NSObject+Extensions.swift
//
//  Created by Alexander Bukov on 16/03/2019.
//  Copyright © 2019 Uniprog. All rights reserved.
//

import Foundation

extension NSObject {
    public func perform(_ block: () -> Void) {
        block()
    }
    
    public func performAfter(delay: TimeInterval, _ block: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.perform(block)
        }
    }
    
    public func performInBackground(_ block: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
    
    public func performInMainThread(_ block: @escaping () -> Void) {
        DispatchQueue.main.async(execute: block)
    }
    
    public var className: String {
        return type(of: self).className
    }
    public static var className: String {
        return stringFromClass(self)
    }
    
    public func attach(_ object: AnyObject) {
        objc_setAssociatedObject(self, Unmanaged.passUnretained(object).toOpaque(), object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    public func detach(_ object: AnyObject) {
        objc_setAssociatedObject(self, Unmanaged.passUnretained(object).toOpaque(), nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

public func stringFromClass(_ aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).components(separatedBy: ".").last!
}
