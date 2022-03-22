//
//  Model.swift
//  MVVM app
//
//  Created by Владимир on 22.03.2022.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let title : String?
    }
}
