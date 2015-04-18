//=========================================
//=========================================


//  IOS_DEMO(Soldoros)


//=========================================
//=========================================


#import "RootViewController.h"
#import "BaseViewController.h"


@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *classNames;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *mainView;

@end

@implementation RootViewController

- (id)init
{
    if (self = [super init])
    {
        self.title = @"主题";
        [self initMainView];
        [self initTitles];
        [self initClassNames];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];//COLOR_a;
    [self initTableView];
}

#pragma mark - Initialization

-(void)initMainView
{
    self.mainView = [[UIView alloc]initWithFrame:CGRM(0, 0, 320, 568)];
    self.mainView.backgroundColor =COLOR_a;
    [self.view addSubview: self.mainView];
    
    
    
}

- (void)initTitles
{
    self.titles = @[@"HELLO WORLD",
                    @"状态栏",
                    @"模型视图控制器",
                    @"按钮",
                    @"文字展示框",
                    @"文字输入框",
                    @"开关",
                    @"滑动条",
                    @"多选框",
                    
                    @"导航控制器",
                    @"低级动画",
                    @"滚动视图",
                    @"初级表格视图",
                    @"高级表格视图",
                    @"标签控制器",
                    @"音视频播放",
                    
                    @"网络请求与解析",
                    @"高级动画",
                    @"多线程与消息",
                    @"地图与定位",
                    @"第三方网络请求+异步下载",
                    @"数据持久化一",
                    @"数据持久化二",
                    @"SpriteKit游戏入门",
                    
                    //以下部分为睿锋培训课程之外新增技术
                    @"及时通讯",
                    @"手机管理",
                    @"手势",
                    @"IOS8新技术",
                    @"CoreText",
                    @"CoreImage",
                    @"国际化",
                    @"XMLJson",
                    @"ICloud服务和应用",
                    @"Quarz2D",
                    @"自动布局",
                    @"Swift混合编程",
                    @"推送机制",
                    @"加速计与陀螺仪",
                    @"Block的使用",
                    @"表单刷新与加载(MJ第三方)",
                    @"二维码扫描",
                    @"时间选取器",
                    @"版本更新检测",
                    @"拍照"
                    ];
    
}

- (void)initClassNames
{
    self.classNames = @[@"HelloWorldViewController",
                        @"StatusBarViewController",
                        @"MVCViewController",
                        @"ButtonViewController",
                        @"LabelViewController",
                        @"TextFieldViewController",
                        @"SwitchViewController",
                        @"SliderViewController",
                        @"SegmentedViewController",
                        
                        @"NavigationViewController",
                        @"ViewAnimationViewController",
                        @"ScrollViewController",
                        @"TableViewControllerOne",
                        @"TableViewControllerTwo",
                        @"TabBarViewController",
                        @"VdioViewController",
                        
                        @"Post_GetViewController",
                        @"AnimationTwoViewController",
                        @"MultithreadingViewController",
                        @"MapLitViewController",
                        @"AFNetWorkingViewController",
                        @"DataSourceOneViewController",
                        @"DataSourceTwoViewController",
                        @"SpriteKitViewController",
                        
                        //以下部分为睿锋培训课程之外新增技术
                        @"QQController",
                        @"ManagePhoneController",
                        @"GestureController",
                        @"IOS8Controller",
                        @"CoreTextController",
                        @"CoreImgController",
                        @"InternationalController",
                        @"XmlJsonController",
                        @"ICloundController",
                        @"Quarz2DController",
                        @"AutoLayoutController",
                        @"SwfitController",
                        @"NSNotiController",
                        @"MoveGravityController",
                        @"BlockController",
                        @"MJRefreshViewController",
                        @"TwoDidCodeScanViewController",
                        @"UIPickerViewController",
                        @"SearchVesonViewController",
                        @"PhotoViewController"
                        ];
}

- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRM(0, 0, 320, 568) style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    //隐藏分割线
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.mainView addSubview:self.tableView];
    
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

//返回该组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.titles count];
}

//定制cell 重用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mainCellIdentifier = @"mainCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mainCellIdentifier];
        //添加箭头提示
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    cell.backgroundColor = indexPath.row%2==0?COLOR(255, 233, 208, 1):[UIColor whiteColor];
    
    cell.textLabel.text = [self.titles objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text = [self.classNames objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

//选中cell时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *className = self.classNames[indexPath.row];
    BaseViewController *subViewController = [[NSClassFromString(className) alloc]init];
    [self.navigationController pushViewController:subViewController animated:YES];
}


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.toolbarHidden = YES;
}






@end









//
