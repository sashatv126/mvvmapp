//
//  ViewModel.swift
//  MVVM app
//
//  Created by Владимир on 22.03.2022.
//

import Foundation

protocol ViewModelProtocol {
    var updateViewData : ((ViewData)->())? {get set}
    var network : NetworkProtocol {get set }
    func startFetch()
}

final class ViewModel : ViewModelProtocol {
    var network: NetworkProtocol
    
    
   public var updateViewData: ((ViewData) -> ())?

    
    init(network : NetworkProtocol) {
        updateViewData?(.initial)
        self.network = network
    }
    
   public func startFetch() {
    updateViewData?(.loading(ViewData.Data(title: nil)))
        network.getData(completion: {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let comment) :
                    self?.updateViewData?(.loading(ViewData.Data(title: comment?.first?.body)))
                case .failure(_):
                    self?.updateViewData?(.failure(ViewData.Data(title: "ERROR")))
                }
            }
        })
    }
    
    
}
