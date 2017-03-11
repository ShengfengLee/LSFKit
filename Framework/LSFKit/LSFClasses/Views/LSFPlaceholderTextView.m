//
//  LSFPlaceholderTextView.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/22.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFPlaceholderTextView.h"

@implementation LSFPlaceholderTextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
    }
    return self;
}



- (void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeholderLabel.font = font;
}

- (void)setText:(NSString *)text{
    [super setText:text];
    [self textDidChangeed];
}

- (void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    [self textDidChangeed];
}

- (void)setPlaceholderEdgeInsets:(UIEdgeInsets)placeholderEdgeInsets{
    _placeholderEdgeInsets = placeholderEdgeInsets;
    [self.placeholderLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(_placeholderEdgeInsets);
    }];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

- (void)setUp{
    [self addSubview:self.placeholderLabel];
    self.placeholderEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeed) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)textDidChangeed{
    
    if (![self isFirstResponder]) {
        return;
    }
    
    if (self.text.length > 0) {
        self.placeholderLabel.hidden = self.hasText;
    }
    else{
        self.placeholderLabel.hidden = NO;
    }
}

- (UILabel *)placeholderLabel{
    
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] init];
        _placeholderLabel.font = self.font;
        _placeholderLabel.backgroundColor = [UIColor clearColor];
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.textColor = [UIColor lightGrayColor];
    }
    return _placeholderLabel;
}

- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
