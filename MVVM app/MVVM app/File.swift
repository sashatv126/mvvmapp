//
//  File.swift
//  MVVM app
//
//  Created by Владимир on 22.03.2022.
//

import UIKit

protocol BuilderProtocol {
   static func builtModule() -> UIViewController
}

class Builder: BuilderProtocol {
   static func builtModule() -> UIViewController {
        let view = ViewController()
        let network = Network()
        let viewModel = ViewModel(network: network)
        view.viewModel = viewModel
        return view
    }
}
