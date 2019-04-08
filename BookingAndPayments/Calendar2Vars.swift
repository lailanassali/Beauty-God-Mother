//
//  Calendar2Vars.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 08/04/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current

let day = calendar.component(.day, from: date)
let weekday = calendar.component(.weekday, from: date)
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)


