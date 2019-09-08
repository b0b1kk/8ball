//
//  NetworkManager.swift
//  8ball
//
//  Created by Bogdan Mishura on 9/8/19.
//  Copyright © 2019 Bogdan Mishura. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func getAnswer(result: @escaping ((AnswerModel?) -> ())) {
        
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/<question_string>") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession(configuration: .default)
        task.dataTask(with: request) {(data, response, error) in
            guard let dataFromURL = data else {return print(error.debugDescription)}
            let decoder = JSONDecoder()
            var decoderAnswerModel: AnswerModel?
            decoderAnswerModel = try? decoder.decode(AnswerModel.self, from: dataFromURL)
            result(decoderAnswerModel)
        }.resume()
    }
}
