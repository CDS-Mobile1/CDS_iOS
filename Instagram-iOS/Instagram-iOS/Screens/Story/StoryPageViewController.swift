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
    
    private let allMemberStoryViewControllers: [StoryContentViewController] = []
    
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
        
        
    }
    
    // MARK: - Setting
    
    private func setPageViewController() {
        
    }
    
    private func setAllMembersStory() {
        
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
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
