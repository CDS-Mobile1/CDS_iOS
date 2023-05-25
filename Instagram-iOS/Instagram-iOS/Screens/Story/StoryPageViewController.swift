//
//  StoryPageViewController.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/23.
//

import UIKit

import SnapKit
import Kingfisher

final class StoryPageViewController: UIPageViewController {
    
    // TODO: 아마 여기서 각 멤버의 스토리 다 받아와야 할 듯 ??
    // TODO: - 받아온 모든 api 로 각 VC 만들고 이 VC 로 page 구성
    // TODO: - VC 터치 시 다음 이미지 보이기
    // TODO: - VC 스와이프 시 다음 사람 스토리 띄우기
    // TODO: - 한 사람의 스토리 다 확인했으면 터치 시 다음 사람 스토리 띄우기
    
    // MARK: - Property
    
    // TODO: MainFeed 에서 몇 번째 스토리를 누르냐에 따라 달라짐
    private var currentUserIndex = 0
    private lazy var userCount = storyList.count
    
    private var userStoryList = UserWithStory.dummyData()
    private var storyList = Story.dummyData()
    
    private var pageViewControllerData: [StoryContentViewController] = []
    
    // MARK: - UI Property
    
    
    
    // MARK: - Life Cycle
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setPageViewControllerData()
        setPageViewController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Setting
    
    private func setDelegate() {
        self.delegate = self
        self.dataSource = self
    }
    
    private func setPageViewController() {
        let currentViewController = pageViewControllerData[currentUserIndex]
        self.setViewControllers([currentViewController], direction: .forward, animated: true)
        self.didMove(toParent: self)
    }
    
    private func setPageViewControllerData() {
        for i in 0..<userStoryList.count {
            let storyViewController = StoryContentViewController(userId: userStoryList[i].memberID, storyCount: storyList[i].count)
            pageViewControllerData.append(storyViewController)
        }
    }
    
    func setAllMembersStory() {
        
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    func moveToNextUserStory() {
        guard let currentViewController = viewControllers?.first,
              let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController)
        else { return }
        setViewControllers([nextViewController], direction: .forward, animated: true)
    }
    
    func moveToPreviousUserStory() {
        guard let currentViewController = viewControllers?.first,
              let previousViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController)
        else { return }
        setViewControllers([previousViewController], direction: .reverse, animated: true)
    }
    
    // MARK: - API
    
    // TODO: 인스타그램 보면 사람간의 스토리 넘길 때 딜레이가 없음
    // TODO: 한 번에 모두의 스토리를 받아오는게 아닐까라는 추측
    // TODO: 스토리 있는 멤버 리스트 받아오고, 그 멤버들의 스토리 내용 받아와 전달하는 식으로 진행
    
    private func fetchAllMembers() {
        // TODO: 스토리 있는 멤버 리스트 받아오기
    }
    
    private func fetchSingleMemberStory() {
        // TODO: 개인의 스토리 받아오기
    }
    
}


// MARK: - UIPageViewControllerDelegate extension

extension StoryPageViewController: UIPageViewControllerDelegate {}


// MARK: - UIPageViewControllerDataSource extension

extension StoryPageViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return userStoryList.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? StoryContentViewController,
              let currentIndex = pageViewControllerData.firstIndex(of: vc)
        else { return nil }
        return pageViewControllerData[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? StoryContentViewController,
              let currentIndex = pageViewControllerData.firstIndex(of: vc)
        else { return nil }
        return pageViewControllerData[currentIndex + 1]
    }
    
}
