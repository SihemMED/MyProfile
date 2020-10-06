//
//  SkillsViewController.swift
//  Me
//
//  Created by Sihem MOHAMED on 10/4/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellIdentifier = "skillCollectionViewCell"
    private var skills: [Skill] = []
    private var timer: Timer = Timer()
    private var currentIndexPath: IndexPath = IndexPath(row: -1, section: 0)
    private let controller: SkillsController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    init(controller: SkillsController) {
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupCollectionView()
        setupTimer()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "SkillCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        skills = controller.getSkills()
    }
    
    private func setupTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(animateCollectionView), userInfo: nil, repeats: true)
    }

    @objc private func animateCollectionView() {
        let row = currentIndexPath.row
        let rowsCount = skills.count
//        if let cell = collectionView.cellForItem(at: currentIndexPath) as? SkillCollectionViewCell {
//            cell.currentSelectedView.backgroundColor = .clear
//        }
        if row < rowsCount - 1 {
            currentIndexPath = IndexPath(row: row+1, section: 0)
            collectionView.scrollToItem(at: currentIndexPath, at: .right, animated: true)
        }else if row == rowsCount - 1 {
            currentIndexPath = IndexPath(row: 0, section: 0)
            collectionView.scrollToItem(at: currentIndexPath, at: .left, animated: true)
            currentIndexPath = IndexPath(row: -1, section: 0)
        }
        
//        if let cell = collectionView.cellForItem(at: currentIndexPath) as? SkillCollectionViewCell {
//            cell.currentSelectedView.backgroundColor = Style.Colors.mongo
//        }else if row == rowsCount - 1 {
//            if let cell = collectionView.cellForItem(at: IndexPath(row: row, section: 0)) as? SkillCollectionViewCell {
//                cell.currentSelectedView.backgroundColor = Style.Colors.mongo
//            }
//        }
    }
}

extension SkillsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skills.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SkillCollectionViewCell
        let skill = skills[indexPath.row]
        cell.setupCell(skill)
        return cell
    }
}

extension SkillsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
