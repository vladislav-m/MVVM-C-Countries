//
//  CountriesListViewController.swift
//  Countries
//
//  Created by Vladislav Myakotin on 04/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

private typealias ItemsBinder = (_ source: Observable<[CountryCellViewModel]>)
    -> (_ configureCell: @escaping (Int, CountryCellViewModel, CountryCell) -> Void)
    -> Disposable

class CountriesListViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Private vars

    private let disposeBag = DisposeBag()

    // MARK: - Public and internal vars

    var viewModel: CountriesListViewModel?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        self.tableView.refreshControl = refreshControl
        refreshControl.beginRefreshing()

        let countrySelected = self.tableView.rx.modelSelected(CountryCellViewModel.self).asDriver()
        let output = self.viewModel?.transform(input: CountriesInput(countrySelected: countrySelected, refresh: refreshControl.rx.controlEvent(.valueChanged).asDriver()))

        let itemsBinder: ItemsBinder = self.tableView.rx.items(cellIdentifier: "CountryCell",
                                                               cellType: CountryCell.self)
        output?.countriesList.asObservable()
            .bind(to: itemsBinder) { index, model, cell in
                cell.set(viewModel: model)
            }.disposed(by: self.disposeBag)

        output?.isLoading
            .drive(refreshControl.rx.isRefreshing)
            .disposed(by: self.disposeBag)

        output?.errors.asObservable().subscribe(onNext: { [weak self] error in
            self?.display(error: error)
        }).disposed(by: self.disposeBag)
    }
}
