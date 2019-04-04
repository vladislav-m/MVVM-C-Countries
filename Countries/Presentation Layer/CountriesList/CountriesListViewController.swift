//
//  CountriesListViewController.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import UIKit
import RxSwift

private typealias ItemsBinder = (_ source: Observable<[CountryCellViewModel]>)
    -> (_ configureCell: @escaping (Int, CountryCellViewModel, CountryCell) -> Void)
    -> Disposable

class CountriesListViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!

    var viewModel: CountriesListViewModel?

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        let countrySelected = self.tableView.rx.modelSelected(CountryCellViewModel.self).asDriver()
        let output = self.viewModel?.transform(input: CountriesInput(countrySelected: countrySelected))

        let itemsBinder: ItemsBinder = self.tableView.rx.items(cellIdentifier: "CountryCell",
                                                               cellType: CountryCell.self)
        output?.countriesList.asObservable()
            .bind(to: itemsBinder) { index, model, cell in
                cell.set(viewModel: model)
            }.disposed(by: self.disposeBag)
    }
}
