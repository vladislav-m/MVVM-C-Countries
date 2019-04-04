//
//  CountryViewController.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import UIKit
import RxSwift

class CountryViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var neighboursLabel: UILabel!
    @IBOutlet weak var currenciesLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    private var disposeBag = DisposeBag()

    var viewModel: CountryViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.name
            .drive(self.nameLabel.rx.text)
            .disposed(by: self.disposeBag)
        self.viewModel?.capitalName
            .drive(self.capitalLabel.rx.text)
            .disposed(by: self.disposeBag)
        self.viewModel?.population
            .drive(self.populationLabel.rx.text)
            .disposed(by: self.disposeBag)
        self.viewModel?.neighbours
            .drive(self.neighboursLabel.rx.text)
            .disposed(by: self.disposeBag)
        self.viewModel?.currencies
            .drive(self.currenciesLabel.rx.text)
            .disposed(by: self.disposeBag)

        self.viewModel?.isLoading
            .map { !$0 }
            .drive(self.loadingIndicator.rx.isHidden)
            .disposed(by: self.disposeBag)

        self.viewModel?.isLoading
            .drive(self.loadingIndicator.rx.isAnimating)
            .disposed(by: self.disposeBag)

        self.viewModel?.errors.asObservable().subscribe(onNext: { [weak self] error in
            self?.display(error: error)
        }).disposed(by: self.disposeBag)
    }

}
