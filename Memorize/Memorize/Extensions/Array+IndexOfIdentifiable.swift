//
//  Array+IndexOfIdentifiable.swift
//  Memorize
//
//  Created by Martin Dimitrov on 26.11.20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(of element: Element) -> Int? {
        for index in self.indices {
            if self[index].id == element.id {
                return index
            }
        }
        return nil
    }
}
