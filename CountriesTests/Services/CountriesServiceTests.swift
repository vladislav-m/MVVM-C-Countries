//
//  CountriesServiceTests.swift
//  CountriesTests
//
//  Created by Vladislav Myakotin on 08/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import XCTest
import RxSwift
@testable import Countries

class CountriesServiceTests: XCTestCase {

    private var countriesService: CountriesServiceImp!
    private var disposeBag: DisposeBag!

    private let defaultExpectationTimeout: TimeInterval = 0.05

    override func setUp() {
        self.countriesService = CountriesServiceImp(api: APIComponentMock())
        self.disposeBag = DisposeBag()
    }

    override func tearDown() {
        self.countriesService = nil
        self.disposeBag = nil
    }

    func test_countriesService_returns_excactly_one_country() {
        let expectation = XCTestExpectation(description: "")
        self.countriesService.countries().subscribe(onSuccess: { countries in
            XCTAssert(countries.count == 1, "number of countries in mock response is less or more then 1")
            expectation.fulfill()
        }) { error in
            XCTFail("failed to get countries list")
        }.disposed(by: self.disposeBag)

        self.wait(for: [expectation], timeout: self.defaultExpectationTimeout)
    }
}


private class APIComponentMock: APIComponent {
    func getData(for request: APIRequest) -> Single<Data> {
        if case .countriesList = request {
            return Single.just(request.sampleData)
        } else {
            return Single.just(Data())
        }
    }
}
