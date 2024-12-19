//
//  HomeViewController.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 18/12/24.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    @IBOutlet weak var tblHome: UITableView!
    
    let viewModel = HomeViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.retrievePersonInfo()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.$person
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tblHome.reloadData()
            }
            .store(in: &cancellables)
    }
    
    @IBAction func didTapCreateNewPerson(_ sender: UIBarButtonItem) {
        didTapAddNewPerson()
    }
}
