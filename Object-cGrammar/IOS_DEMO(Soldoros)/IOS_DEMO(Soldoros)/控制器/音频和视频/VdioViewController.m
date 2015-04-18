//=========================================
//=========================================


//音频和视频


//=========================================
//=========================================

#import "VdioViewController.h"
#import "MoviesViewController.h"
#import <AVFoundation/AVFoundation.h>
@import AudioToolbox;

@interface VdioViewController ()
{
    NSTimer *_timer;
    UILabel *label;
    AVAudioPlayer  *_audioPlayer;
    NSMutableArray *_musicNames;
    NSInteger _currentMusicIndex;     //当前播放歌曲
    UISlider *_progressIndicator;
    BOOL _shouldUpdataProcess;
    
    SystemSoundID _systemSoundID;
}

//增加属性
@property(retain , nonatomic)AVAudioPlayer *audioPlayer;

@end

@implementation VdioViewController

-(id)init
{
    if(self == [super init])
    {
        _currentMusicIndex = 0;
        _shouldUpdataProcess = YES;
        self.title = [NSString stringWithFormat:@"%@",[self class]];
    }
    return self;
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeAppearence];
}


-(void)setAudioPlayer:(AVAudioPlayer *)audioPlayer
{
    if(_audioPlayer!=audioPlayer)
    {
        [_audioPlayer stop];
        _audioPlayer = audioPlayer;
    }
}


-(void)initializeDataSource
{
    _musicNames = [[NSMutableArray alloc]init];
    
    //导入音乐的时候无需用扩展名
    [_musicNames addObjectsFromArray:@[@"Ascendance",@"Beyond the Veil",@"Night Vision",@"Take Flight"]];
    
    
    
    //初始化音效ID
    
    NSURL *url = [[NSBundle mainBundle]URLForAuxiliaryExecutable:@"SystemSound"];
    
    AudioServicesCreateSystemSoundID((__bridge CFTypeRef)url, &_systemSoundID);
    
}



-(void)initializeAppearence
{
    
    label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.bounds = CGRectMake(0, 0, 250, 40);
    label.center = CGPointMake(160, 150);
    label.text = @"HelloWorld";
    label.font = [UIFont systemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
    
    
    //创建三个播放控制的按钮   播放/暂停   上一曲 下一曲
    
    
    UIButton *playPause = [UIButton buttonWithType:UIButtonTypeCustom];
    playPause.bounds = CGRectMake(0, 0, 50, 50);
    playPause.center = CGPointMake(160, 400);
    [playPause setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [playPause setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateSelected];
    [playPause addTarget:self action:@selector(butttonPressde:)
        forControlEvents:UIControlEventTouchUpInside];
    playPause.tag = 10;
    [self.view addSubview:playPause];
    
    
    
    UIButton *lastButton = [UIButton buttonWithType:UIButtonTypeCustom];
    lastButton.bounds = CGRectMake(0, 0, 50, 50);
    lastButton.center = CGPointMake(40, 400);
    [lastButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [lastButton addTarget:self action:@selector(butttonPressde:)
         forControlEvents:UIControlEventTouchUpInside];
    lastButton.tag = 11;
    [self.view addSubview:lastButton];
    
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.bounds = CGRectMake(0, 0, 50, 50);
    nextButton.center = CGPointMake(280, 400);
    [nextButton setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(butttonPressde:)
         forControlEvents:UIControlEventTouchUpInside];
    nextButton.tag = 12;
    [self.view addSubview:nextButton];
    
    
    //进度条
    _progressIndicator = [[UISlider alloc]init];
    _progressIndicator.bounds = CGRectMake(0, 0, 200, 200);
    _progressIndicator.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2,
                                            CGRectGetHeight(self.view.bounds)/2);
    [_progressIndicator setThumbImage:[UIImage imageNamed:@"indicator"] forState:UIControlStateNormal];
    _progressIndicator.minimumTrackTintColor = [UIColor yellowColor];
    _progressIndicator.maximumTrackTintColor = [UIColor redColor];
    
    
    [_progressIndicator addTarget:self action:@selector(procseeSliderTouchDown:) forControlEvents:UIControlEventTouchDown];
    
    [_progressIndicator addTarget:self action:@selector(procseeSliderTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:_progressIndicator];
    
    

    
    // 播放器的初始化
    
    [self playMusicWithName:_musicNames[_currentMusicIndex] shouldAutoPlay:NO];
    
    

    
}


//控制播放/暂停  上一曲  下一曲
-(void)butttonPressde:(UIButton *)sender
{
    //播放音效
    AudioServicesPlaySystemSound(_systemSoundID);
    
    
    
    
    NSInteger index = sender.tag - 10;
    switch (index)
    {
        case 0:[self processPlayingState:sender];
            break;
        case 1:[self previousMusic];
            break;
        case 2:[self nextMusic];
            break;
        default:
            break;
    }
}

//播放/暂停
-(void)processPlayingState:(UIButton *)sender
{
    //判断当前的播放状态
    _audioPlayer.playing?([_audioPlayer pause],[self pauseTimer]):([_audioPlayer play],[self statrtTimer]);
    sender.selected = !sender.selected;
    
    
}

//上一曲
-(void)previousMusic
{
    
    [self playMusicWithName:_musicNames[[self actualMusicIndexWithIndex:--_currentMusicIndex]]shouldAutoPlay:_audioPlayer.playing];
    
}

//下一曲
-(void)nextMusic
{
    [self playMusicWithName:_musicNames[[self actualMusicIndexWithIndex:++_currentMusicIndex]]shouldAutoPlay:_audioPlayer.playing];
    
}


//配置音乐播放  (音乐的名字  是否自动播放)
-(BOOL)playMusicWithName:(NSString *)name shouldAutoPlay:(BOOL)autoPlay
{
    
    if([name length] == 0)
    {
        return NO;
    }
    
    //初始化AVAudioPlayer
    NSURL *url = [[NSBundle mainBundle]URLForResource:name withExtension:@"m4a"];
    
    NSError *error = nil;
    
    
    //完全停止 并清理上衣播放器
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    if(error)
    {
        NSLog(@"播放音频的初始化失败");
        [error localizedDescription];
        return NO;
    }
    
    //配置播放的次数
    _audioPlayer.numberOfLoops = -1;
    
    //准备播放
    [_audioPlayer prepareToPlay];
    
    //是否自动播放
    if(autoPlay)
    {
        //开始播放
        [_audioPlayer play];
    }
    
    [self updataAppearenceWithMusicName:name];
    
    return YES;
    
}

-(void)updataAppearenceWithMusicName:(NSString *)name
{
    if([name length] == 0)
    {
        return;
    }
    
    label.text = name;
    
    //更新进度条指示器
    _progressIndicator.value = _audioPlayer.currentTime;  //单位是秒
    _progressIndicator.maximumValue = _audioPlayer.duration;
    _progressIndicator.minimumValue = 0;
}


//计算真实索引 (避免在搜索歌曲的时候造成越界)
-(NSInteger)actualMusicIndexWithIndex:(NSInteger)index
{
    NSInteger maximumIdex = [_musicNames count];
    return (index>=0)?index%maximumIdex:(2-index);
}



#pragma mark   ----procseeint  methods

//启动
-(void)statrtTimer
{
    if(!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(processTimer:) userInfo:nil repeats:YES];
        
    }
    
    _timer.fireDate = [NSDate date];
}

//暂停
-(void)pauseTimer
{
    _timer.fireDate = (_timer && _timer.isValid)?[NSDate distantFuture]:_timer.fireDate;
}

//停止
-(void)stopTimer
{
    if (_timer && _timer.isValid)
    {
        [_timer invalidate];
        _timer = nil;
    }
    
    
}

//响应
-(void)processTimer:(NSTimer *)timer
{
    if (_shouldUpdataProcess)
    {
        _progressIndicator.value = _audioPlayer.currentTime;
    }
    
}

-(void)procseeSliderTouchDown:(UISlider *)sender
{
    _shouldUpdataProcess = NO;
}
-(void)procseeSliderTouchUpInside:(UISlider *)sender
{
    _shouldUpdataProcess = YES;
    
    //更新播放进度
    _audioPlayer.currentTime = sender.value;
}


//父类事件重载
-(void)next
{
    MoviesViewController *move = [[MoviesViewController alloc]init];
    [self.navigationController pushViewController:move animated:YES];
}










@end
