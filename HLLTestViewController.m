//
//  HLLTestViewController.m
//  TAG
//
//  Created by CouldHll on 13-11-25.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#import "HLLTestViewController.h"

@interface HLLTestViewController ()

@end

@implementation HLLTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设定 ScrollView 的 Frame，逐页滚动时，如果横向滚动，按宽度为一个单位滚动，纵向时，按高度为一个单位滚动
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 0, 210, 100)];
    scrollView.backgroundColor = [UIColor grayColor]; // ScrollView 背景色，即 View 间的填充色
    
    //向 ScrollView 中加入第一个 View，View 的宽度 200 加上两边的空隙 5 等于 ScrollView 的宽度
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(5,5,200,90)];
    view1.backgroundColor = [UIColor redColor];
    [scrollView addSubview:view1];
    
    //第二个 View，它的宽度加上两边的空隙 5 等于 ScrollView 的宽度，两个 View 间有 10 的间距
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(215,5,200,90)];
    view2.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:view2];
    
    //第三个 View
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(425,5,200,90)];
    view3.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:view3];
    
    [self.view addSubview:scrollView];
    
    //这个属性很重要，它可以决定是横向还是纵向滚动，一般来说也是其中的 View 的总宽度，和总的高度
    //这里同时考虑到每个 View 间的空隙，所以宽度是 200x3＋5＋10＋10＋5＝630
    //高度上与 ScrollView 相同，只在横向扩展，所以只要在横向上滚动
    scrollView.contentSize = CGSizeMake(630, 100);
    
    //用它指定 ScrollView 中内容的当前位置，即相对于 ScrollView 的左上顶点的偏移
    scrollView.contentOffset = CGPointMake(210, 0);
    
    //按页滚动，总是一次一个宽度，或一个高度单位的滚动
    scrollView.pagingEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
