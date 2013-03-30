//
//  YahtzeeController.h
//  Yazhtzee
//
//  Created by Jessica Thrasher on 5/25/06.
//  Copyright 2006
//

#import <Cocoa/Cocoa.h>

@interface YahtzeeController : NSObject 
{
	IBOutlet NSWindow *main;
	IBOutlet NSButton *rollButton;
    IBOutlet NSImageView *dieOne;
    IBOutlet NSImageView *dieTwo;
	IBOutlet NSImageView *dieThree;
	IBOutlet NSImageView *dieFour;
	IBOutlet NSImageView *dieFive;
	IBOutlet NSButton *hold1, *hold2, *hold3, *hold4, *hold5;
	IBOutlet NSButton *bonusY1, *bonusY2, *bonusY3;
	NSImage *one, *two, *three, *four, *five, *six;

	int rollCount;
	int currentRoll[5];
	
	IBOutlet NSButton *aces, *twos, *threes, *fours, *fives, *sixes;
	IBOutlet NSTextField *acesScore, *twosScore, *threesScore, *foursScore,
		*fivesScore, *sixesScore;
	
	IBOutlet NSTextField *upperSubtotal, *upperTotal, *lowerTotal, *bonusField, *grandTotal;
	
	IBOutlet NSButton *threeKind, *fourKind, *fullHouse, *smStraight, *lgStraight, *chance,
		*yahtzee;
	IBOutlet NSTextField *threeKindScore, *fourKindScore, *fullHouseScore, *smStraightScore,
		*lgStraightScore, *chanceScore, *yahtzeeScore, *yahtzeeBonusScore, *rollCountField;
	
}

- (void)newGame:(id)sender;
- (void)roll:(id)sender;
- (BOOL)setDie:(int)die type:(int)type;
- (void)toggleHold:(id)sender;
- (void)resetHolds;
- (void)cleanUpForNewRoll:(id)sender;
- (BOOL)checkUpper;
- (BOOL)checkLower;
- (void)bonusYahtzeeCheck:(id)sender;

- (void)useAces:(id)sender;
- (void)useTwos:(id)sender;
- (void)useThrees:(id)sender;
- (void)useFours:(id)sender;
- (void)useFives:(id)sender;
- (void)useSixes:(id)sender;


- (void)use3Kind:(id)sender;
- (void)use4Kind:(id)sender;
- (void)useFullHouse:(id)sender;
- (void)useSmStr:(id)sender;
- (void)useLgStr:(id)sender;
- (void)useChance:(id)sender;
- (void)useYahtzee:(id)sender;

@end