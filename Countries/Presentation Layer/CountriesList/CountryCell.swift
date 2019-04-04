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

    private let disposeBag = DisposeBag()

    func set(viewModel: CountryCellViewModel) {
        guard let textLabel = self.textLabel, let detailLabel = self.detailTextLabel else { return }

        let output = viewModel.transform(input: CountryCellViewModel.Input())
        output.name
            .drive(textLabel.rx.text)
            .disposed(by: self.disposeBag)
        output.population
            .drive(detailLabel.rx.text)
            .disposed(by: self.disposeBag)
    }
}
