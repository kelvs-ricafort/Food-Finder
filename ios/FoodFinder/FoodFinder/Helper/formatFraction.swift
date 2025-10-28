//
//  formatFraction.swift
//  FoodFinder
//
//  Created by Kelvin Ricafort on 10/28/25.
//

import Foundation

func formatFraction(_ value: Double) -> String {
    let whole = Int(value)
    let fraction = value - Double(whole)
    
    let unicodeFractions: [Double: String] = [ 0.125: "⅛", 0.25: "¼", 0.333: "⅓", 0.375: "⅜", 0.5: "½", 0.625: "⅝", 0.666: "⅔", 0.75: "¾", 0.875: "⅞" ]
    
    let roundedFraction = (fraction * 8).rounded() / 8.0 // round to nearest 1/8
    let fractionSymbol = unicodeFractions[roundedFraction] ?? String(format: "%.2f", value)
    
    if fraction == 0 {
        return "\(whole)"
    } else if whole == 0 {
        return "\(fractionSymbol)"
    } else {
        return "\(whole)\(fractionSymbol)"
    }
}
