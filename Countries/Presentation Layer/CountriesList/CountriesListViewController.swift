//
//  CountriesListViewController.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import UIKit
import RxSwift

class CountriesListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var viewModel: CountriesListViewModel?

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        let countrySelected = self.tableView.rx.modelSelected(CountryCellViewModel.self).asDriver()
        let output = self.viewModel?.transform(input: CountriesInput(countrySelected: countrySelected))
        output?.countriesList.asObservable()
            .bind(to: self.tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { index, model, cell in
                //                cell.set(viewModel: model)

            }.disposed(by: self.disposeBag)
    }
}
