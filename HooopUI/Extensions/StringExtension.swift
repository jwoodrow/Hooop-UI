//
//  StringExtension.swift
//  HOOOP
//
//  Created by James Woodrow on 06/03/2018.
//  Copyright © 2018 Hooop. All rights reserved.
//

import Foundation

public extension String {
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
}
