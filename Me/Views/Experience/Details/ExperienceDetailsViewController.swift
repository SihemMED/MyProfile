//
//  ExperienceDetailsViewController.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/1/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

protocol ExperienceDetailsViewControllerDelegate: class {
    func showAppOnStore(_ itemUrl: String)
}

class ExperienceDetailsViewController: UIViewController {
    private let experience: Experience
    weak var delegate: ExperienceDetailsViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    init(experience: Experience) {
        self.experience = experience
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "HomeExperienceTableViewCell", bundle: nil), forCellReuseIdentifier: "homeExperienceCell")
        tableView.register(UINib(nibName: "AchievementTableViewCell", bundle: nil), forCellReuseIdentifier: "achievementCell")
        tableView.register(UINib(nibName: "ApplicationTableViewCell", bundle: nil), forCellReuseIdentifier: "applicationCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }


}

extension ExperienceDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return experience.job.description.count == 0 ? 0 : 1
        case 2:
            return experience.job.keyAchievement.count == 0 ? 0 : 1
        case 3:
            return experience.applications.count == 0 ? 0 : experience.applications.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeExperienceCell", for: indexPath) as! HomeExperienceTableViewCell
            if let item = experience.dictionary as? [String: String] {
               cell.setupCell(item: item)
            }
            
            return cell
        case 1, 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "achievementCell", for: indexPath) as! AchievementTableViewCell
            let item = indexPath.section == 1 ? experience.job.description : experience.job.keyAchievement
            cell.setupCell(items: item, section: indexPath.section)
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "applicationCell", for: indexPath) as! ApplicationTableViewCell
            let application = experience.applications[indexPath.row]
            cell.setupCell(application)
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
}

extension ExperienceDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            //view App on store
            let application = experience.applications[indexPath.row]
            delegate?.showAppOnStore(application.url)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 3 && experience.applications.count != 0 {
            let headerView = UIView(frame: CGRect(x: 16, y: 0, width: tableView.frame.width - 32, height: 30))
            headerView.backgroundColor = .clear
            let sectionTitle = UILabel(frame: headerView.frame)
            sectionTitle.textColor = Style.Colors.black
            sectionTitle.font = .boldSystemFont(ofSize: 17)
            sectionTitle.text = "Published Applications"
            headerView.addSubview(sectionTitle)
            return headerView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 3 ? 30 : 0
    }
}
