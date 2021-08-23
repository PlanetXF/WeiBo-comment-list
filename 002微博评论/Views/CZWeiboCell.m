//
//  CZWeiboCell.m
//  002微博评论
//
//  Created by 谢飞 on 2021/8/19.
//

#import "CZWeiboCell.h"
#import "CZWeibo.h"

@interface CZWeiboCell ()

@property (nonatomic, weak) UIImageView *imgViewIcon;
@property (nonatomic, weak) UILabel *lblNickName;
@property (nonatomic, weak) UIImageView *imgViewVip;
@property (nonatomic, weak) UILabel *lblText;
@property (nonatomic, weak) UIImageView *imgViewPicture;

@end

@implementation CZWeiboCell

#pragma mark - 重写单元格的initWithStyle方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建5个子控件
        
        //1.头像
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        self.imgViewIcon = imgViewIcon;
        [self.contentView addSubview:imgViewIcon];
        //2.昵称
        UILabel *lblNickName = [[UILabel alloc] init];
        self.lblNickName = lblNickName;
        [self.contentView addSubview:lblNickName];
        //3.会员
        UIImageView *imgViewVip = [[UIImageView alloc] init];
        imgViewVip.image = [UIImage imageNamed:@"vip"];
        self.imgViewVip = imgViewVip;
        [self.contentView addSubview:imgViewVip];
        //4.正文
        UILabel *lblText = [[UILabel alloc] init];
        self.lblText = lblText;
        [self.contentView addSubview:lblText];
        //5.配图
        UIImageView *imgViewPicture = [[UIImageView alloc] init];
        self.imgViewPicture = imgViewPicture;
        [self.contentView addSubview:imgViewPicture];
    }
    return self;
}

#pragma mark - 重写weibo属性的set方法
- (void)setWeibo:(CZWeibo *)weibo
{
    _weibo = weibo;
    
    //1.设置数据
    [self settingData];
    //2.设置frame
    [self settingFrame];
}

//设置数据的方法
- (void)settingData
{
    CZWeibo *model = self.weibo;
    //1.头像
    self.imgViewIcon.image = [UIImage imageNamed:model.icon];
    //2.昵称
    self.lblNickName.text = model.name;
    //4.正文
    self.lblText.text = model.text;
    //5.配图
    if (model.picture) {
        self.imgViewPicture = [UIImage imageNamed:model.picture];
        self.imgViewPicture.hidden = NO;
    } else {
        //当没有配图时，隐藏图片框
        self.imgViewPicture.hidden = YES;
    }
    
}
//设置frame的方法
- (void)settingFrame
{
    //统一间距
    CGFloat margin = 10;
    
    //1.头像
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    self.imgViewIcon.frame = CGRectMake(margin, margin, iconW, iconH);
    //2.昵称
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
