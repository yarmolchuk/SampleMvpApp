//
//  PersonViewController.swift
//  SampleMvpApp
//
//  Created by Dima Yarmolchuk on 3/1/18.
//  Copyright © 2018 Dima Yarmolchuk. All rights reserved.
//

import UIKit

final class PersonViewController: UIViewController {
    
    @IBOutlet weak var emptyView: UIView?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    private let personPresenter = PersonPresenter(personService: PersonServiceFactory.default())
    private var personsToDisplay = [PersonViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
        
        activityIndicator?.hidesWhenStopped = true
        
        personPresenter.attachView(view: self)
        personPresenter.getPerson()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configureNavigationBar() {
        self.title = "Riders"
    }
}

extension PersonViewController: PersonView {
    
    func startLoading() {
        activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator?.stopAnimating()
    }
    
    func setPersons(persons: [PersonViewData]) -> Void {
        personsToDisplay = persons
        tableView?.isHidden = false
        emptyView?.isHidden = true;
        tableView?.reloadData()

    }
    
    func setEmptyPersons() {
        tableView?.isHidden = true
        emptyView?.isHidden = false;
    }
}

extension PersonViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "PersonCell")
        let personViewData = personsToDisplay[indexPath.row]
        cell.textLabel?.text = personViewData.name
        cell.detailTextLabel?.text = personViewData.age
        return cell
    }
}

extension PersonViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
