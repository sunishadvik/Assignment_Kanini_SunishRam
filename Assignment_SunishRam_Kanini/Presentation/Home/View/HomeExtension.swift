//
//  HomeExtension.swift
//  Assignment_SunishRam_Kanini
//
//  Created by Sunish Ram on 18/12/24.
//

import Foundation
import UIKit

extension HomeViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return viewModel.person.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: HomeTvc.cellIdentifier(), for: indexPath) as! HomeTvc
       cell.personData = viewModel.person[indexPath.row]
       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 200
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let personToDelete = viewModel.person[indexPath.row]
                viewModel.deletePerson(id: personToDelete.id)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        passViewDataToSliptView(indexPath, viewModel.person)
    }
}
extension HomeViewController
{
    func passViewDataToSliptView(_ index : IndexPath , _ person : [Person]?)
    {
        HomeViewController.configureSplitViewController(
            on: self, storyboardName: CommonStringValue.main,
            splitVCIdentifier: SplitViewController.storyboardId(),
            masterType: PersonListVC.self,
            detailType: ManagePersonDetailsVC.self,
            configureMaster: { masterVC in
                masterVC.viewmodel.person = person?[index.row]
            },
            configureDetail: { detailVC in
                detailVC.viewModel.person = person?[index.row]
                detailVC.viewModel.isUpdate = true
            }
        )
    }
    func didTapAddNewPerson()
    {
        presentSplitViewController(
            on: self, storyboardName: CommonStringValue.main,
            splitVCIdentifier: SplitViewController.storyboardId(),
            splitVCType: SplitViewController.self
        )
    }
}
