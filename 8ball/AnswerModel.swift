//
//  AnswerModel.swift
//  8ball
//
//  Created by Bogdan Mishura on 9/8/19.
//  Copyright © 2019 Bogdan Mishura. All rights reserved.
//

import Foundation

class AnswerModel: Decodable {
    var question: String?
    var answer: String?
    var type: String?
}
