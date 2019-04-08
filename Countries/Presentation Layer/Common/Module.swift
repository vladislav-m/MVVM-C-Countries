//
//  Module.swift
//  Countries
//
//  Created by Vladislav Myakotin on 07/04/2019.
//  Copyright © 2019 Vladislav Myakotin. All rights reserved.
//

import UIKit

struct Module<V: UIViewController, VM> {
    let view: V
    let viewModel: VM
}
