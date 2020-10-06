//
//  HomeViewController.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/27/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func showExperienceDetails(_ experience: Experience)
}

class HomeViewController: UIViewController {
    private let cellIdentifier = "homeExperienceCell"
    @IBOutlet weak var tableView: UITableView!
    private var experiences : [Experience] = []
    private var educationArray : [Education] = []
    private let controller: HomeController
    weak var delegate: HomeViewControllerDelegate?
    private var hideSection : Bool = false {
        didSet{
            tableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    init(controller: HomeController) {
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTableView()
        experiences = controller.getExperience()
        educationArray = controller.getEducation()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "HomeExperienceTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        setupHeaderTableView()
    }
    
    private func setupHeaderTableView() {
        let profileHeaderController = ProfileHeaderController()
        let profileHeaderViewController = ProfileHeaderViewController(controller: profileHeaderController)
        if let headerView = profileHeaderViewController.view {
            let headerViewContainer = headerView
            headerViewContainer.addCornerRadius(toSide: .Bottom, withRadius: 20)
            headerViewContainer.translatesAutoresizingMaskIntoConstraints = false
            tableView.tableHeaderView = headerViewContainer
            tableView.tableHeaderView?.backgroundColor = Style.Colors.mongo
            headerViewContainer.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor).isActive = true
            headerViewContainer.widthAnchor.constraint(equalTo: self.tableView.widthAnchor).isActive = true
            headerViewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            self.tableView.tableHeaderView?.layoutIfNeeded()
            self.tableView.tableHeaderView = self.tableView.tableHeaderView
        }
    }

}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? experiences.count : educationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeExperienceTableViewCell
        if indexPath.section == 0 {
            let experience = experiences[indexPath.row]
            if let item = experience.dictionary as? [String: String]{
                cell.setupCell(item: item)
            }
        }else {
            let education = educationArray[indexPath.row]
            if let item = education.dictionary as? [String: String]{
                cell.setupCell(item: item)
            }
        }
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 20, y: 0, width: tableView.frame.width - 40, height: 60))
        headerView.backgroundColor = .clear
        let sectionTitle = UILabel(frame: headerView.frame)
        sectionTitle.textColor = Style.Colors.tetarium
        sectionTitle.font = .boldSystemFont(ofSize: 20)
        sectionTitle.text = section == 0 ? "EXPERIENCE" : "EDUCATION"
        headerView.addSubview(sectionTitle)
        return hideSection && section == 0 ? UIView() : headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let experience = experiences[indexPath.row]
            delegate?.showExperienceDetails(experience)
        }
    }
}

extension HomeViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let tableView = scrollView as? UITableView else {return}
        if tableView.contentOffset.y > 0 && !hideSection {
            hideSection = true
        } else if tableView.contentOffset.y < 0 && hideSection {
            hideSection = false
        }
    }
}
