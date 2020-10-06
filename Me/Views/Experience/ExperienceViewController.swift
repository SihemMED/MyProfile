//
//  ExperienceViewController.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/30/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit
protocol ExperienceViewControllerDelegate: class {
    func showDetails(experience: Experience)
}

class ExperienceViewController: UIViewController {
    
    private let controller: ExperienceController
    private var experienceArray: [Experience] = []
    private let cellIdentifier = "experienceCell"
    weak var delegate: ExperienceViewControllerDelegate?
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        var filterItem : ExperienceFilter = .all
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            filterItem = .professional
        case 2:
            filterItem = .internship
        default:
            filterItem = .all
        }
        controller.filterExperienceBy(filterItem) { (items) in
            self.experienceArray = items
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    init(controller: ExperienceController) {
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupSegmentedControl()
        setupTableView()
        experienceArray = controller.getExperience()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "ExperienceTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }

    private func setupSegmentedControl() {
        self.segmentedControl.setTitle("All", forSegmentAt: 0)
        self.segmentedControl.setTitle("Professional", forSegmentAt: 1)
        self.segmentedControl.setTitle("Internship", forSegmentAt: 2)
        if #available(iOS 13.0, *) {
            segmentedControl.selectedSegmentTintColor = Style.Colors.mongo
        } else {
            segmentedControl.tintColor = Style.Colors.mongo
        }
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Style.Colors.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Style.Colors.black], for: .normal)
        segmentedControl.selectedSegmentIndex = 0
    }
}

extension ExperienceViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experienceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ExperienceTableViewCell
        let item = experienceArray[indexPath.row]
        cell.setupCell(item)
        return cell
    }
    
}

extension ExperienceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let experience = experienceArray[indexPath.row]
        delegate?.showDetails(experience: experience)
    }
}
