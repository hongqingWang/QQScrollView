//
//  QQHomeMainController.m
//  QQScrollView
//
//  Created by Mac on 05/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeMainController.h"
#import "QQGenneralViewController.h"
#import "QQSliderLabel.h"
#import "QQHomeMainListViewModel.h"
#import "QQChannel.h"

#import "QQHomeAController.h"
#import "QQNewsController.h"
#import "QQNewsAudioController.h"
#import "QQNewsVideoController.h"

#define QQ_HOME_SCREEN_WIDTH                        [UIScreen mainScreen].bounds.size.width
#define QQ_HOME_SCREEN_HEIGHT                       [UIScreen mainScreen].bounds.size.height
#define QQ_HOME_TITLE_SCROLL_VIEW_HEIGHT            30

@interface QQHomeMainController ()<UIScrollViewDelegate>

/// TitleScrollView
@property (nonatomic, strong) UIScrollView *titleScrollView;
/// 分割线
@property (nonatomic, strong) UIView *carveView;
/// ContenScrollView
@property (nonatomic, strong) UIScrollView *contentScrollView;
/// 视图模型
@property (nonatomic, strong) QQHomeMainListViewModel *homeMainListViewModel;
/// 频道
@property (nonatomic, strong) NSMutableArray *channelList;

@end

@implementation QQHomeMainController

#pragma mark - Left Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadChannelList];
}

#pragma mark - loadChannelList
- (void)loadChannelList {
    
    [self.homeMainListViewModel loadChannalListCompletion:^(BOOL isSuccessed) {
        if (!isSuccessed) {
            NSLog(@"未加载到数据");
        }
        
        [self setupUI];
        [self setupContentScrollView];
        [self setupCarveView];
        [self setupTitleScrollView];
        // 添加默认子控制器
        [self setupDefaultViewController];
        
        QQSliderLabel *fistLable = [self.titleScrollView.subviews firstObject];
        fistLable.scale = 1.0;
    }];
}

#pragma mark - SetupUI
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    
    [self.view addSubview:self.titleScrollView];
    [self.view addSubview:self.contentScrollView];
}

#pragma mark - setupContentScrollView
- (void)setupContentScrollView {
    
    QQHomeAController *aVc = [[QQHomeAController alloc] init];
    aVc.title = [self.homeMainListViewModel.homeMainList[0] tname];
    [self addChildViewController:aVc];
    
    QQNewsController *newsVc = [[QQNewsController alloc] init];
    newsVc.title = [self.homeMainListViewModel.homeMainList[1] tname];
    [self addChildViewController:newsVc];
    
    QQNewsAudioController *newsAudioVc = [[QQNewsAudioController alloc] init];
    newsAudioVc.title = [self.homeMainListViewModel.homeMainList[2] tname];
    [self addChildViewController:newsAudioVc];
    
    QQNewsVideoController *newsVideoVc = [[QQNewsVideoController alloc] init];
    newsVideoVc.title = [self.homeMainListViewModel.homeMainList[3] tname];
    [self addChildViewController:newsVideoVc];
    
    QQGenneralViewController *genneralVc = [[QQGenneralViewController alloc] init];
    genneralVc.title = [self.homeMainListViewModel.homeMainList[4] tname];
    [self addChildViewController:genneralVc];
    
    UIViewController *vc01 = [[UIViewController alloc] init];
    vc01.title = [self.homeMainListViewModel.homeMainList[5] tname];
    [self addChildViewController:vc01];
    
    UIViewController *vc02 = [[UIViewController alloc] init];
    vc02.title = [self.homeMainListViewModel.homeMainList[6] tname];
    [self addChildViewController:vc02];
    
    UIViewController *vc03 = [[UIViewController alloc] init];
    vc03.title = [self.homeMainListViewModel.homeMainList[7] tname];
    [self addChildViewController:vc03];
    
    UIViewController *vc04 = [[UIViewController alloc] init];
    vc04.title = [self.homeMainListViewModel.homeMainList[8] tname];
    [self addChildViewController:vc04];
    
    UIViewController *vc05 = [[UIViewController alloc] init];
    vc05.title = [self.homeMainListViewModel.homeMainList[9] tname];
    [self addChildViewController:vc05];
    
    self.contentScrollView.contentSize = CGSizeMake(QQ_HOME_SCREEN_WIDTH * self.childViewControllers.count, 0);
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - setupCarveView
- (void)setupCarveView {
    
    [self.view addSubview:self.carveView];
}

#pragma mark - setupTitleScrollView
- (void)setupTitleScrollView {
    
    NSInteger count = self.childViewControllers.count;
    CGFloat labelY = 0;
    CGFloat labelW = 80;
    CGFloat labelH = 30;
    
    for (NSInteger i = 0; i < count; i++) {
        
        QQSliderLabel *label = [[QQSliderLabel alloc] init];
        label.tag = i;
        [self.titleScrollView addSubview:label];
        
        CGFloat labelX = labelW * i;
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        
        UIViewController *vc = self.childViewControllers[i];
        label.text = vc.title;
        
        // 监听点击
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lableClick:)]];
    }
    
    CGFloat titleContentWidth = labelW * count;
    self.titleScrollView.contentSize = CGSizeMake(titleContentWidth, 0);
}

#pragma mark - Event Response
/**
 * 监听`Lable`的点击
 */
- (void)lableClick:(UITapGestureRecognizer *)recognizer {
    // 1.获得被点击的lable
    QQSliderLabel *lable = (QQSliderLabel *)recognizer.view;
    
    // 2.计算x方向上的偏移量
    CGFloat offsetX = lable.tag * self.contentScrollView.frame.size.width;
    
    // 3.设置偏移量
    [self.contentScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

#pragma mark - setupDefaultViewController
- (void)setupDefaultViewController {
    
    QQHomeAController *vc = (QQHomeAController *)[self.childViewControllers firstObject];
    vc.view.frame = self.contentScrollView.bounds;
    [self.contentScrollView addSubview:vc.view];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    UIViewController *vc = self.childViewControllers[index];
    
    QQSliderLabel *label = self.titleScrollView.subviews[index];
    CGFloat width = self.titleScrollView.frame.size.width;
    CGFloat offsetX = label.center.x - width * 0.5;
    
    // 最大偏移量
    CGFloat maxOffsetX = self.titleScrollView.contentSize.width - width;
    if (offsetX < 0) {
        offsetX = 0;
    } else if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    
    [self.titleScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    [self.titleScrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != index) {
            QQSliderLabel *otherLabel = self.titleScrollView.subviews[idx];
            otherLabel.scale = 0.0;
        }
    }];
    
    // 如果子控制器的view已经在上面,就直接返回(下面这句话暂时注释了,并没有产生什么影响)
    if (vc.view.superview) {
        return;
    }
    
    CGFloat Y = 0;
    CGFloat W = scrollView.frame.size.width;
    CGFloat H = scrollView.frame.size.height;
    CGFloat X = W * index;
    vc.view.frame = CGRectMake(X, Y, W, H);
    [scrollView addSubview:vc.view];
}

/**
 * ScrollView停止滚动调用这个方法(用户手动触发的动画结束,会调用这个方法)
 * 不加的话,滑动的时候就加载不出来下一个页面
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 1.需要进行控制的文字(2个标题)
    // 2.两个标题各自的比例值
    /**********  warning 这里最好取绝对值 (保证计算出来的比例是个非负数)  **********/
    // 偏移量 / 宽度
    CGFloat value = ABS(self.contentScrollView.contentOffset.x / self.contentScrollView.frame.size.width);
    // 左边文字的索引
    NSUInteger leftIndex = (NSUInteger)value;
    // 右边文字的索引
    NSUInteger rightIndex = leftIndex + 1;
    // 右边文字的比例
    CGFloat rightScale = value - leftIndex;
    // 左边文字的比例
    CGFloat leftScale = 1 - rightScale;
    // 取出lable设置大小和颜色
    QQSliderLabel *leftLable = self.titleScrollView.subviews[leftIndex];
    leftLable.scale = leftScale;
    if (rightIndex < self.titleScrollView.subviews.count) {
        QQSliderLabel *rightLable = self.titleScrollView.subviews[rightIndex];
        rightLable.scale = rightScale;
    }
}

#pragma mark - Getters and Setters
- (UIScrollView *)titleScrollView {
    if (_titleScrollView == nil) {
        CGRect frame = CGRectMake(0, 64, QQ_HOME_SCREEN_WIDTH, QQ_HOME_TITLE_SCROLL_VIEW_HEIGHT);
        _titleScrollView = [[UIScrollView alloc] initWithFrame:frame];
        _titleScrollView.bounces = YES;
        _titleScrollView.showsHorizontalScrollIndicator = NO;
        _titleScrollView.showsVerticalScrollIndicator = NO;
    }
    return _titleScrollView;
}

- (UIView *)carveView {
    if (_carveView == nil) {
        _carveView = [[UIView alloc] init];
        _carveView.backgroundColor = [UIColor lightGrayColor];
        _carveView.frame = CGRectMake(0, 64 + QQ_HOME_TITLE_SCROLL_VIEW_HEIGHT, QQ_HOME_SCREEN_WIDTH, 0.5);
    }
    return _carveView;
}

- (UIScrollView *)contentScrollView {
    if (_contentScrollView == nil) {
        CGRect frame = CGRectMake(0, 64 + QQ_HOME_TITLE_SCROLL_VIEW_HEIGHT, QQ_HOME_SCREEN_WIDTH, QQ_HOME_SCREEN_HEIGHT - 64 - QQ_HOME_TITLE_SCROLL_VIEW_HEIGHT - 49);
        _contentScrollView = [[UIScrollView alloc] initWithFrame:frame];
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.bounces = YES;
        _contentScrollView.delegate = self;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
    }
    return _contentScrollView;
}

- (QQHomeMainListViewModel *)homeMainListViewModel {
    if (_homeMainListViewModel == nil) {
        _homeMainListViewModel = [[QQHomeMainListViewModel alloc] init];
    }
    return _homeMainListViewModel;
}

- (NSMutableArray *)channelList {
    if (_channelList == nil) {
        _channelList = [NSMutableArray array];
    }
    return _channelList;
}

@end
