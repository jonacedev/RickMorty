//
//  Model.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

struct AlertModel {
    var image: String?
    var description = "", buttonText1 = "general_accept".localized, buttonText2 = ""
    let action1: () -> Void
    var action2: (() -> Void)?
}
