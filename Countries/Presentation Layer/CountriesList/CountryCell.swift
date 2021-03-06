//
//  CountryCell.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import UIKit
import RxSwift

class CountryCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!

    // MARK: - Private vars

    private let disposeBag = DisposeBag()

    // MARK: - Public and internal methods

    func set(viewModel: CountryCellViewModel) {
        let output = viewModel.transform(input: CountryCellViewModel.Input())
        output.name
            .drive(self.nameLabel.rx.text)
            .disposed(by: self.disposeBag)
        output.population
            .drive(self.populationLabel.rx.text)
            .disposed(by: self.disposeBag)
    }
}
