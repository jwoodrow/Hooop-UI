//
//  StringExtension.swift
//  HOOOP
//
//  Created by James Woodrow on 06/03/2018.
//  Copyright © 2018 Hooop. All rights reserved.
//

import Foundation

public extension String {
    
    public subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    public subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    public subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return self[Range(start ..< end)]
    }
}
