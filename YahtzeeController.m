//
//  YahtzeeController.m
//  Yazhtzee
//
//  Created by Jessica Thrasher on 5/25/06.
//

#import "YahtzeeController.h"
#include <AppKit/AppKit.h>

@implementation YahtzeeController

- (void)awakeFromNib
{	
	// Initialize the images
	one = [NSImage imageNamed:@"one.jpg"];
	two = [NSImage imageNamed:@"two.jpg"];
	three = [NSImage imageNamed:@"three.jpg"];
	four = [NSImage imageNamed:@"four.jpg"];
	five = [NSImage imageNamed:@"five.jpg"];
	six = [NSImage imageNamed:@"six.jpg"];
	
	[aces setEnabled:NO];
	[twos setEnabled:NO];
	[threes setEnabled:NO];
	[fours setEnabled:NO];
	[fives setEnabled:NO];
	[sixes setEnabled:NO];
	[threeKind setEnabled:NO];
	[fourKind setEnabled:NO];
	[fullHouse setEnabled:NO];
	[smStraight setEnabled:NO];
	[lgStraight setEnabled:NO];
	[chance setEnabled:NO];
	[yahtzee setEnabled:NO];
	
	[hold1 setEnabled:NO];
	[hold2 setEnabled:NO];
	[hold3 setEnabled:NO];
	[hold4 setEnabled:NO];
	[hold5 setEnabled:NO];
	
	rollCount = 0;
}

- (void)roll:(id)sender;
{
	[hold1 setEnabled:YES];
	[hold2 setEnabled:YES];
	[hold3 setEnabled:YES];
	[hold4 setEnabled:YES];
	[hold5 setEnabled:YES];
	
	if (rollCount == 0)
	{
		++rollCount;
		[aces setEnabled:YES];
		[twos setEnabled:YES];
		[threes setEnabled:YES];
		[fours setEnabled:YES];
		[fives setEnabled:YES];
		[sixes setEnabled:YES];
		[threeKind setEnabled:YES];
		[fourKind setEnabled:YES];
		[fullHouse setEnabled:YES];
		[smStraight setEnabled:YES];
		[lgStraight setEnabled:YES];
		[chance setEnabled:YES];
		[yahtzee setEnabled:YES];
	}
	
	[rollCountField setIntValue:rollCount];
	
	if (rollCount == 3)
		[rollButton setEnabled:NO];
	
	srandom((int)[[NSDate date] timeIntervalSince1970]);
	
	int aRandom = 0;
	int newDie = 0;	
	int i;
	for (i = 1; i <= 5; i++)
	{
		aRandom = random();
		
		newDie = aRandom % 6;
		if ([self setDie:i type:newDie])
			currentRoll[i-1] = newDie + 1;
	}

	rollCount++;
	
	[self bonusYahtzeeCheck:sender];
}

- (void)bonusYahtzeeCheck:(id)sender
{
	if (![yahtzee isEnabled] && [yahtzeeScore intValue] == 50)
	{
		BOOL isYahtzee = YES;
        
		int die = currentRoll[0];
		for (int i = 1; i < 5; i++)
		{
			if (die != currentRoll[i])
			{
				isYahtzee = NO;
				break;
			}
		}
	
		if (isYahtzee)
		{
			if ([bonusY1 state] == 0)
			{
				[bonusY1 setState:1];
				[yahtzeeBonusScore setEnabled:YES];
				[yahtzeeBonusScore setIntValue:100];
			}
			else if ([bonusY2 state] == 0)
			{
				[bonusY2 setState:1];
				[yahtzeeBonusScore setEnabled:YES];
				[yahtzeeBonusScore setIntValue:200];
			}
			else if ([bonusY3 state] == 0)
			{
				[bonusY3 setState:1];
				[yahtzeeBonusScore setEnabled:YES];
				[yahtzeeBonusScore setIntValue:300];
			}
			
			[self cleanUpForNewRoll:sender];
		}
	}
}

- (void)toggleHold:(id)sender
{
	NSButton *current = sender;
	
	if ([current state] == 1) 
		[current setTitle:@"Unhold"];
	else
		[current setTitle:@"Hold"];
}


- (BOOL)setDie:(int)die type:(int)type
{
	if (die == 1 && [hold1 state] == 0)
	{
		if (type == 0)
			[dieOne setImage:one];
		else if (type == 1)
			[dieOne setImage:two];
		else if (type == 2)
			[dieOne setImage:three];
		else if (type == 3)
			[dieOne setImage:four];
		else if (type == 4)
			[dieOne setImage:five];
		else
			[dieOne setImage:six];
		return true;
	}
	else if (die == 2 && [hold2 state] == 0)
	{
		if (type == 0)
			[dieTwo setImage:one];
		else if (type == 1)
			[dieTwo setImage:two];
		else if (type == 2)
			[dieTwo setImage:three];
		else if (type == 3)
			[dieTwo setImage:four];
		else if (type == 4)
			[dieTwo setImage:five];
		else
			[dieTwo setImage:six];
		return true;
	}
else if (die == 3 && [hold3 state] == 0)
	{
		if (type == 0)
			[dieThree setImage:one];
		else if (type == 1)
			[dieThree setImage:two];
		else if (type == 2)
			[dieThree setImage:three];
		else if (type == 3)
			[dieThree setImage:four];
		else if (type == 4)
			[dieThree setImage:five];
		else
			[dieThree setImage:six];
		return true;
	}
	else if (die == 4 && [hold4 state] == 0)
	{
		if (type == 0)
			[dieFour setImage:one];
		else if (type == 1)
			[dieFour setImage:two];
		else if (type == 2)
			[dieFour setImage:three];
		else if (type == 3)
			[dieFour setImage:four];
		else if (type == 4)
			[dieFour setImage:five];
		else
			[dieFour setImage:six];
		return true;
	}
	else if (die == 5 && [hold5 state] == 0)
	{
		if (type == 0)
			[dieFive setImage:one];
		else if (type == 1)
			[dieFive setImage:two];
		else if (type == 2)
			[dieFive setImage:three];
		else if (type == 3)
			[dieFive setImage:four];
		else if (type == 4)
			[dieFive setImage:five];
		else
			[dieFive setImage:six];
		return true;
	}
	
	return false;
}


- (void)useAces:(id)sender
{
	int aceCount = 0;
	
	int i; 
	for (i = 0; i < 5; i++)
	{
		if (currentRoll[i] == 1)
			aceCount++;
	}
	
	[acesScore setIntValue:aceCount];
	[aces setEnabled:NO];
	
	[upperSubtotal setIntValue:(aceCount + [upperSubtotal intValue])];
	
	[self cleanUpForNewRoll:sender];
}

- (void)useTwos:(id)sender;
{
	int twosCount = 0;
	
	int i; 
	for (i = 0; i < 5; i++)
	{
		if (currentRoll[i] == 2)
			twosCount+=2;
	}
	
	[twosScore setIntValue:twosCount];
	[twos setEnabled:NO];
	
	[upperSubtotal setIntValue:(twosCount + [upperSubtotal intValue])];
	
	[self cleanUpForNewRoll:sender];
}

- (void)useThrees:(id)sender
{
	int threesCount = 0;
	
	int i; 
	for (i = 0; i < 5; i++)
	{
		if (currentRoll[i] == 3)
			threesCount+=3;
	}
	
	[threesScore setIntValue:threesCount];
	[threes setEnabled:NO];
	
	[upperSubtotal setIntValue:(threesCount + [upperSubtotal intValue])];
	
	[self cleanUpForNewRoll:sender];
}

- (void)useFours:(id)sender
{
	int foursCount = 0;
	
	int i; 
	for (i = 0; i < 5; i++)
	{
		if (currentRoll[i] == 4)
			foursCount+=4;
	}
	
	[foursScore setIntValue:foursCount];
	[fours setEnabled:NO];
	
	[upperSubtotal setIntValue:(foursCount + [upperSubtotal intValue])];
	
	[self cleanUpForNewRoll:sender];
}

- (void)useFives:(id)sender
{
	int fivesCount = 0;
	
	int i; 
	for (i = 0; i < 5; i++)
	{
		if (currentRoll[i] == 5)
			fivesCount+=5;
	}
	
	[fivesScore setIntValue:fivesCount];
	[fives setEnabled:NO];
	
	[upperSubtotal setIntValue:(fivesCount + [upperSubtotal intValue])];
	
	[self cleanUpForNewRoll:sender];
}

- (void)useSixes:(id)sender
{
	int sixesCount = 0;
	
	int i; 
	for (i = 0; i < 5; i++)
	{
		if (currentRoll[i] == 6)
			sixesCount+=6;
	}
	
	[sixesScore setIntValue:sixesCount];
	[sixes setEnabled:NO];
	
	[upperSubtotal setIntValue:(sixesCount + [upperSubtotal intValue])];
	
	[self cleanUpForNewRoll:sender];
}


- (void)cleanUpForNewRoll:(id)sender
{
	[rollButton setEnabled:YES];
	rollCount = 1;
	[self resetHolds];
	[self roll:sender];
	
	if ([self checkUpper] && [self checkLower])
	{
		[grandTotal setIntValue:([upperTotal intValue] + [lowerTotal intValue])];
		[rollButton setEnabled:NO];
	}
	
}

- (BOOL)checkUpper
{
	if ([aces isEnabled] || [twos isEnabled] || [threes isEnabled] || 
		[fours isEnabled] || [fives isEnabled] || [sixes isEnabled])
		return false;
	
	int total = [upperSubtotal intValue];
	
	if (total >= 63)
	{
		[bonusField setEnabled:YES];
		total += 35;
	}
	
	[upperTotal setIntValue:total];
	
	return true;
}

- (BOOL)checkLower
{
	if ([threeKind isEnabled] || [fourKind isEnabled] || [smStraight isEnabled] ||
		[lgStraight isEnabled] || [fullHouse isEnabled] || [chance isEnabled] ||
		[yahtzee isEnabled])
		return false;
	
	int total = 0;
	
	total += [threeKindScore intValue];
	total += [fourKindScore intValue];
	total += [fullHouseScore intValue];
	total += [smStraightScore intValue];
	total += [lgStraightScore intValue];
	total += [chanceScore intValue];
	total += [yahtzeeScore intValue];
	total += [yahtzeeBonusScore intValue];
	
	[lowerTotal setIntValue:total];
	
	return true;
}

- (void)use3Kind:(id)sender
{
	int j,k;
	int counter = 0;
	BOOL hasThree = NO;
	
	for (j = 0; j < 3; j++)
	{
		int current = currentRoll[j];
		
		for (k = 0; k < 5; k++)
		{
			if (currentRoll[k] == current)
				counter++;
		}
		
		if (counter == 3)
			hasThree = YES;
		
		counter = 0;
	}
	
	if (hasThree)
	{
		int total = 0;
		for (j = 0; j < 5; j++)
			total += currentRoll[j];
		
		[threeKindScore setIntValue:total];
	}
	else
		[threeKindScore setIntValue:0];
	
	[threeKind setEnabled:NO];
	[self cleanUpForNewRoll:sender];
}

- (void)use4Kind:(id)sender
{
	int j,k;
	int counter = 0;
	BOOL hasFour = NO;
	
	for (j = 0; j < 2; j++)
	{
		int current = currentRoll[j];
		
		for (k = 0; k < 5; k++)
		{
			if (currentRoll[k] == current)
				counter++;
		}
		
		if (counter == 4)
			hasFour = YES;
		
		counter = 0;
	}
	
	if (hasFour)
	{
		int total = 0;
		for (j = 0; j < 5; j++)
			total += currentRoll[j];
		
		[fourKindScore setIntValue:total];
	}
	else
		[fourKindScore setIntValue:0];
	
	[fourKind setEnabled:NO];
	[self cleanUpForNewRoll:sender];
}

- (void)useFullHouse:(id)sender
{
	BOOL hasPair = NO;
	BOOL hasTriple = NO;
	int counter = 0;
	int curr = 0;
	
	int j,k;
	for (j = 0; j < 4; j++)
	{
		if (currentRoll[j] != curr)
		{
			curr = currentRoll[j];
		
			for (k = 0; k < 5; k++)
			{
				if (curr == currentRoll[k])
					counter++;
			}
		
			if (counter == 3)
				hasTriple = YES;
			if (counter == 2)
				hasPair = YES;
			counter = 0;
		}
	}
	
	
	if (hasPair && hasTriple)
		[fullHouseScore setIntValue:25];
	else
		[fullHouseScore setIntValue:0];
	
	[fullHouse setEnabled:NO];
	[self cleanUpForNewRoll:sender];
}

- (void)useSmStr:(id)sender
{
	BOOL isStraight = NO;
	int j,k,l;
	for (j = 0; j < 5; j++)
	{
		int curr = currentRoll[j];
		
		for (k = 1; k <= 3; k++)
		{
			for (l = 0; l < 5; l++)
			{
				if (currentRoll[l] == (curr + k))
					isStraight = YES;
			}
			
			if (isStraight != YES)
				break;
			if (k != 3)
				isStraight = NO;
		}
		if (isStraight)
			break;
	}
	
	if (isStraight)
		[smStraightScore setIntValue:30];
	else
		[smStraightScore setIntValue:0];
	
		
	[smStraight setEnabled:NO];
	[self cleanUpForNewRoll:sender];
}

- (void)useLgStr:(id)sender
{
	int j,k;
	BOOL isStraight = YES;
	for (j = 0; j < 4; j++)
	{
		int curr = currentRoll[j];
		
		for (k = j+1; k < 5; k++)
		{
			if (currentRoll[k] == curr)
			{
				isStraight = NO;
				break;
			}
		}
	}
	
	if (isStraight)
		[lgStraightScore setIntValue:40];
	else
		[lgStraightScore setIntValue:0];
	
	[lgStraight setEnabled:NO];
	[self cleanUpForNewRoll:sender];
}

- (void)useChance:(id)sender
{
	int i, total;
	total = 0;
	for (i = 0; i < 5; i++)
		total += currentRoll[i];
	
	[chanceScore setIntValue:total];
	[chance setEnabled:NO];
	[self cleanUpForNewRoll:sender];
}

- (void)useYahtzee:(id)sender
{
	int i, die;
	die = currentRoll[0];
	for (i = 1; i < 5; i++)
	{
		if (die != currentRoll[i])
		{
			die = 0;
			break;
		}
	}
	
	if (die != 0)
		[yahtzeeScore setIntValue:50];
	else
		[yahtzeeScore setIntValue:0];
		
	[yahtzee setEnabled:NO];
	[self cleanUpForNewRoll:sender];
}

// Sets all hold buttons to unpressed with "Hold" as text
- (void)resetHolds
{
	[hold1 setState:0];
	[hold1 setTitle:@"Hold"];
	[hold2 setState:0];
	[hold2 setTitle:@"Hold"];
	[hold3 setState:0];
	[hold3 setTitle:@"Hold"];
	[hold4 setState:0];
	[hold4 setTitle:@"Hold"];
	[hold5 setState:0];
	[hold5 setTitle:@"Hold"];
}

- (void)newGame:(id)sender
{		
	[aces setEnabled:YES];
	[acesScore setIntValue:0];
	[twos setEnabled:YES];
	[twosScore setIntValue:0];
	[threes setEnabled:YES];
	[threesScore setIntValue:0];
	[fours setEnabled:YES];
	[foursScore setIntValue:0];
	[fives setEnabled:YES];
	[fivesScore setIntValue:0];
	[sixes setEnabled:YES];
	[sixesScore setIntValue:0];
	
	[upperSubtotal setIntValue:0];
	[upperTotal setIntValue:0];
	[grandTotal setIntValue:0];
	[lowerTotal setIntValue:0];
	
	[threeKindScore setIntValue:0];
	[threeKind setEnabled:YES];
	[fourKindScore setIntValue:0];
	[fourKind setEnabled:YES];
	[fullHouse setEnabled:YES];
	[fullHouseScore setIntValue:0];
	[smStraight setEnabled:YES];
	[lgStraight setEnabled:YES];
	[smStraightScore setIntValue:0];
	[lgStraightScore setIntValue:0];
	[chance setEnabled:YES];
	[chanceScore setIntValue:0];
	[yahtzee setEnabled:YES];
	[yahtzeeScore setIntValue:0];
	[yahtzeeBonusScore setIntValue:0];
	[bonusY1 setState:0];
	[bonusY2 setState:0];
	[bonusY3 setState:0];
	
	[rollButton setEnabled:YES];
	rollCount = 1;
	[self resetHolds];
	[self roll:sender];
}

@end