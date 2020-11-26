//
//  Array+Only.swift
//  Memorize
//
//  Created by Martin Dimitrov on 26.11.20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
