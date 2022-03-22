//
//  ViewController.swift
//  MVVM app
//
//  Created by Владимир on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var kabel: UILabel!
    var viewModel : ViewModelProtocol!
    var viewData : ViewData = .initial {
        didSet {
            switch viewData {
            case .initial:
                update(viewData: nil, isHiden: true)
            case .loading(let loading):
                update(viewData: loading, isHiden: false)
            case .success(let success):
                update(viewData: success, isHiden: false)
            case.failure(let failure):
                update(viewData: failure, isHiden: false)
            break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    private func updateView() {
        viewModel.updateViewData = {[weak self ] viewData in
            self?.viewData = viewData
        }
    }

    @IBAction func buttonTap(_ sender: Any) {
        viewModel.startFetch()
    }
    private func update(viewData : ViewData.Data?, isHiden : Bool) {
        kabel.text = viewData?.title
    }
    }


