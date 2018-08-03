//
//  Configuration.swift
//  BlackCamera
//
//  Created by Almas on 01.08.2018.
//  Copyright © 2018 Almas. All rights reserved.
//

import Foundation

struct Settings {
    var title: String
    var description: [String]
    
    init(_ title: String, _ description: [String]) {
        self.title = title
        self.description = description
    }
    static let list: [Settings] = [Settings("Noise", ["No","Noise + ", "Noise ++", "Noise +++"]),
                                   Settings("Frame", ["No" ,"Kodak400", "90s Rounded" , "Black Square", "Kodak100PTX"]),
                                   Settings("Date", ["current", "90s", "No"]),
                                   Settings("Format", ["dd.mm.yy","mm.dd.yy"])]
}

