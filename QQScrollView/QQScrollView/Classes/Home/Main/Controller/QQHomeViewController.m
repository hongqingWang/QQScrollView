//
//  QQHomeViewController.m
//  QQScrollView
//
//  Created by Mac on 01/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeViewController.h"
#import "QQRecommendViewController.h"
#import "QQGenneralViewController.h"

#define QQ_HOME_SCREEN_WIDTH                        [UIScreen mainScreen].bounds.size.width
#define QQ_HOME_SCREEN_HEIGHT                       [UIScreen mainScreen].bounds.size.height
#define QQ_HOME_TITLE_SCROLL_VIEW_HEIGHT            30

static NSString *const cellId = @"aaa";

@interface QQHomeViewController ()<UIScrollViewDelegate>

/// TitleScrollView
@property (nonatomic, strong) UIScrollView *titleScrollView;
/// ContenScrollView
@property (nonatomic, strong) UIScrollView *contentScrollView;
/// 频道
@property (nonatomic, strong) NSArray *channelList;

@end

@implementation QQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setupChildViewControllers];
    [self setupTitles];
    // 添加默认子控制器
    [self setupDefaultViewController];
}

#pragma mark - SetupUI
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    
    [self.view addSubview:self.titleScrollView];
    [self.view addSubview:self.contentScrollView];
}

#pragma mark - setupChildViewControllers
- (void)setupChildViewControllers {
    
    QQRecommendViewController *recommendVc = [[QQRecommendViewController alloc] init];
    recommendVc.title = self.channelList[0];
    [self addChildViewController:recommendVc];
    
    QQGenneralViewController *genneralVc = [[QQGenneralViewController alloc] init];
    genneralVc.view.frame = CGRectMake(0, 64, QQ_HOME_SCREEN_WIDTH, QQ_HOME_SCREEN_HEIGHT);
    genneralVc.title = self.channelList[1];
    [self addChildViewController:genneralVc];
    
    UIViewController *vc01 = [[UIViewController alloc] init];
    vc01.title = self.channelList[2];
    [self addChildViewController:vc01];
    
    UIViewController *vc02 = [[UIViewController alloc] init];
    vc02.title = self.channelList[3];
    [self addChildViewController:vc02];
    
    UIViewController *vc03 = [[UIViewController alloc] init];
    vc03.title = self.channelList[4];
    [self addChildViewController:vc03];
    
    UIViewController *vc04 = [[UIViewController alloc] init];
    vc04.title = self.channelList[5];
    [self addChildViewController:vc04];
    
    UIViewController *vc05 = [[UIViewController alloc] init];
    vc05.title = self.channelList[6];
    [self addChildViewController:vc05];
    
    self.contentScrollView.contentSize = CGSizeMake(QQ_HOME_SCREEN_WIDTH * self.childViewControllers.count, 0);
}

#pragma mark - setupTitles
- (void)setupTitles {
    
    NSInteger count = self.childViewControllers.count;
    CGFloat labelY = 0;
    CGFloat labelW = 80;
    CGFloat labelH = 30;
    
    for (NSInteger i = 0; i < count; i++) {
        
        UILabel *label = [[UILabel alloc] init];
        [self.titleScrollView addSubview:label];
        
        CGFloat labelX = labelW * i;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        label.userInteractionEnabled = YES;
        
        UIViewController *vc = self.childViewControllers[i];
        label.text = vc.title;
    }
    
    CGFloat titleContentWidth = labelW * count;
    self.titleScrollView.contentSize = CGSizeMake(titleContentWidth, 0);
}

#pragma mark - setupDefaultViewController
- (void)setupDefaultViewController {
    
    QQRecommendViewController *vc = (QQRecommendViewController *)[self.childViewControllers firstObject];
    vc.view.frame = self.contentScrollView.bounds;
    [self.contentScrollView addSubview:vc.view];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    UIViewController *vc = self.childViewControllers[index];
    NSLog(@"%ld", index);
    
    // 如果子控制器的view已经在上面,就直接返回(下面这句话暂时注释了,并没有产生什么影响)
//    if (vc.view.superview) {
//        return;
//    }
    
    CGFloat Y = 10;
    CGFloat W = scrollView.frame.size.width;
    CGFloat H = scrollView.frame.size.height;
    CGFloat X = W * index;
    NSLog(@"%f", W);
    NSLog(@"%f", H);
    NSLog(@"%f", X);
    vc.view.frame = CGRectMake(X, Y, W, H);
    [scrollView addSubview:vc.view];
}

/**
 scrollView停止滚动调用这个方法(用户手动触发的动画结束,会调用这个方法)
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

#pragma mark - Getters and Setters
- (UIScrollView *)titleScrollView {
    if (_titleScrollView == nil) {
        CGRect frame = CGRectMake(0, 64, QQ_HOME_SCREEN_WIDTH, QQ_HOME_TITLE_SCROLL_VIEW_HEIGHT);
        _titleScrollView = [[UIScrollView alloc] initWithFrame:frame];
        _titleScrollView.bounces = YES;
//        _titleScrollView.backgroundColor = [UIColor redColor];
    }
    return _titleScrollView;
}

- (UIScrollView *)contentScrollView {
    if (_contentScrollView == nil) {
        CGRect frame = CGRectMake(0, 64 + QQ_HOME_TITLE_SCROLL_VIEW_HEIGHT, QQ_HOME_SCREEN_WIDTH, QQ_HOME_SCREEN_HEIGHT - 64 - QQ_HOME_TITLE_SCROLL_VIEW_HEIGHT);
        _contentScrollView = [[UIScrollView alloc] initWithFrame:frame];
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.bounces = YES;
        _contentScrollView.delegate = self;
//        _contentScrollView.showsHorizontalScrollIndicator = NO;
    }
    return _contentScrollView;
}

- (NSArray *)channelList {
    if (_channelList == nil) {
        _channelList = @[
                         @"推荐",
                         @"常识",
                         @"智慧",
                         @"音频",
                         @"视频",
                         @"资讯",
                         @"直播"
                         ];
    }
    return _channelList;
}

@end
