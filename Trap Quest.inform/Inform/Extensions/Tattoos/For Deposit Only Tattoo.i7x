For Deposit Only Tattoo by Tattoos begins here.

for deposit only tattoo is a crotch tattoo. The tattoo-title of for deposit only tattoo is "for deposit only".
Figure of for deposit only tattoo is the file "Items/Tats/tattoo12.png".
Definition: for deposit only tattoo (called A) is drawable:
	if there is a worn crotch tattoo, decide no;
	if diaper quest is 1, decide no;
	if the player is male, decide no;
	decide yes.
Definition: for deposit only tattoo (called T) is eligible:	
	if the noun is squirt dildo or the noun is pink hair, decide yes;
	decide no.
To say tattoo-desc of (T - for deposit only tattoo):
	if images visible is 1, display figure of for deposit only tattoo;
	say "The words 'For Deposit Only' and a red Adulterer 'A' are tattooed in large gothic letters above your [vagina]. You can feel it suppressing your ability to have vaginal orgasms or faint from vaginal soreness.".

[!<TheDepositOnlyTattooBlocksMasturbationRule>+

Prevents masturbation

+!]
This is the deposit only tattoo blocks masturbation rule:
	if for deposit only tattoo is worn:
		if auto is 0, say "Your [ShortDesc of for deposit only tattoo] is somehow preventing you!";
		rule fails.
The deposit only tattoo blocks masturbation rule is listed last in the masturbation restriction rules.		

For Deposit Only Tattoo ends here.
