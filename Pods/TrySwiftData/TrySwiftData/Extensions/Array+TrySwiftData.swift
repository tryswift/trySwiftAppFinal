//
//  Array+TrySwiftData.swift
//  Pods-TrySwiftData_Tests
//
//  Created by Natasha Murashev on 2/22/18.
//

import Foundation

extension Array {
    func dictionary<K: Hashable, V>() -> [K: V] where Element == Dictionary<K, V>.Element {
        var dictionary = [K: V]()
        for element in self {
            dictionary[element.key] = element.value
        }
        return dictionary
    }
}
