Conversation by Monster Framework begins here.

A talk-object is a kind of thing.
To consider (T - a talk-object) for (M - a monster):
	do nothing.
To execute (T - a talk-object) for (M - a monster):
	do nothing.

To compute multiple choice conversation of (M - a monster):
	reset multiple choice questions;
	if the player is not able to speak:
		set numerical response 1 to the substituted form of "[gag sounds]";
		set numerical response 0 to "cancel";
		compute multiple choice question;
		if player-numerical-response is 1:
			allocate 3 seconds;
			say "[variable custom style][numerical-response-1][roman type][line break]";
			compute gagged response of M;
	otherwise if M is uninterested or (M is woman-player and M is stranger):
		consider talk-greet for M;
		set numerical response 0 to "cancel";
		compute multiple choice question;
		if player-numerical-response is 1:
			allocate 4 seconds;
			say "[variable custom style][numerical-response-1][roman type][line break]";
			execute talk-greet for M;
		now the printed name of talk-greet is "";
	otherwise:
		repeat with T running through talk-objects:
			consider T for M;
		set numerical response 0 to "cancel";
		compute multiple choice question;
		if player-numerical-response is not 0, compute chosen conversation of M.

To compute gagged response of (M - a monster):
	say "It doesn't seem like [NameDesc of M] [if M is uninterested]knows that you're speaking to [him of M][otherwise]can understand you[end if].".

To compute chosen conversation of (M - a monster):
	let B be a random number from 1 to 4;
	if the class of the player is cheerleader, decrease B by 1;
	if M is intelligent and the player is seductive and (diaper quest is 1 or M is actually seducable) and B < 2: [Bimbo greetings supersede the normal greeting function]
		allocate 4 seconds;
		say BimboSeduce of M;
		if M is friendly, compute BimboSeduced of M;
	otherwise:
		let TXT be the printed name of the chosen numerical response;
		if debugmode > 1, say "TXT is: [TXT][line break]";
		repeat with T running through talk-objects:
			if debugmode > 1, say "Checking against: [printed name of T][line break]";
			if TXT is not "" and the printed name of T matches the text TXT:
				allocate 4 seconds;
				say "[variable custom style][TXT][roman type][line break]";
				now TXT is "";
				execute T for M;
			otherwise:
				if debugmode > 1, say "No match found.";
			now the printed name of T is "".

Chapter 1 Greeting

A monster has a number called greeted-count.
A monster has a number called greet-window. [While this is above 0, the NPC has only recently noticed the player so we can credibly say hello without it being vain]

talk-greet is a talk-object.

To consider (T - talk-greet) for (M - a monster):
	if M is defeated:
		now the printed name of talk-greet is the substituted form of "[DefeatedGreet of M]";
	otherwise if M is unintelligent:
		now the printed name of talk-greet is the substituted form of "[MuteGreeting of M]";
	otherwise if (the greet-window of M > 0 and M is not penetrating a body part and M is not grabbing the player and M is not wrangling a body part) or M is uninterested:
		now the printed name of talk-greet is the substituted form of "[conventional greeting of M]";
	otherwise:
		now the printed name of talk-greet is the substituted form of "[vanity greeting of M]";
	set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-greet) for (M - a monster):
	if M is defeated: [Defeated monsters use a special greeting function]
		if M is uninterested, compute defeated perception of M;
		say DefeatedGreetResponse of M;
	otherwise:
		if M is a friendly interested human monster and breasts is exposed, progress quest of chest-exposing-quest from M;
		if M is unintelligent: [Dumb monsters use a special greeting function]
			say MuteGreetResponse of M;
		otherwise:
			compute basic greeting to M;
	increase the greeted-count of M by 1;
	now the greet-window of M is -1.

[!<SayDefeatedGreetOfMonster>+

Displayed when the player greets a monster that is defeated.

@param <Monster>:<M> The monster being greeted

+!]
To say DefeatedGreet of (M - a monster):
	if M is diaper-enslaved:
		say DiaperEnslavedGreet of M;
	otherwise if M is sex-enslaved:
		say SexEnslavedGreet of M;
	otherwise:
		say FuckedSillyGreet of M.

[!<SayFuckedSillyGreetOfMonster>+

Displayed when the player greets a monster that has been fucked silly.

@param <Monster>:<M> The monster being greeted

+!]
To say FuckedSillyGreet of (M - a monster):
	say "'[one of]Anybody still in there?'[or]Gosh, you've seen better days, haven't you?'[or]Talk about a fall from grace.'[in random order]";

[!<SaySexEnslavedGreetOfMonster>+

Displayed when the player greets a monster that has become a sex slave in trap quest.

@param <Monster>:<M> The monster being greeted

+!]
To say SexEnslavedGreet of (M - a monster):
	say FuckedSillyGreet of M.

[!<SayDiaperEnslavedGreetOfMonster>+

Displayed when the player greets a monster that has become a sex slave in diaper quest.

@param <Monster>:<M> The monster being greeted

+!]
To say DiaperEnslavedGreet of (M - a monster):
	say FuckedSillyGreet of M.

To say DefeatedGreetResponse of (M - a monster):
	if M is intelligent, say "[speech style of M]'[one of]MMMMMmmmnng!'[or]Mmmmmph'[or]Awoooo...'[or]Haaaah!'[in random order][roman type][line break]".

[!<SayMuteGreetingToMonster>+

Displayed when the player greets a monster that does not talk, or does not like to talk.

@param <Monster>:<M> The monster being greeted

+!]
To say MuteGreeting of (M - a monster):
	say "'Hello?'".

[!<SayMuteGreetResponseOfMonster>+

Displayed after the player greets a monster that does not talk, or does not like to talk.

@param <Monster>:<M> The monster being greeted

+!]
To say MuteGreetResponse of (M - a monster):
	say "A telepathic response cuts you off.[line break][speech style of M]'Speech is for humans.'[roman type][line break]".

[!<SayBimboSeduceOfMonster>+

Outputs some special text where the player invites a monster to punish them.

@param <Monster>:<M> The monster being greeted

+!]
To say BimboSeduce of (M - a monster):
	say "[if the class of the player is cheerleader]Unfortunately, the words that come out don't really sound like 'you' at all![otherwise]You try to say one thing, but somehow the words that come out of your mouth are completely different:[end if][line break]";
	if diaper quest is 1:
		if there is a worn pacifier:
			say "[variable custom style][muffled sounds][roman type][line break]";
		otherwise if the class of the player is santa's little helper:
			say "[second custom style]'[one of]Ooh, I'm a bad little elf, punish me!'[or]I've been very naughty this Christmas, I need a [daddy of M] to punish me!'[in random order][roman type][line break]";
		otherwise:
			say "[second custom style]'[one of]Ooh, I'm a bad [boy of the player], punish me!'[or]Please treat me like I deserve!'[or]Do you want to be my [daddy of M]?'[in random order][roman type][line break]";
	otherwise if the class of the player is santa's little helper:
		say "[second custom style]'Santa baby, slip a [if M is male][one of]hard[or]big[or]thick[in random order] cock[otherwise]finger[end if] [if there is a worn christmas dress]under the tree, in me[otherwise]inside of me, or three[end if]...'[roman type][line break]";
	otherwise if the class of the player is cheerleader:
		say CheerSeduce of M;
	otherwise if M is neuter:
		say "[second custom style]'[one of]Ooh, I'm a bad [boy of the player], punish me!'[or]Please fuck me!'[at random][roman type][line break]";
	otherwise if M is male:
		say "[second custom style]'[one of]Ooh, I'm a bad [boy of the player], punish me!'[or]Please fuck me!'[or]Wouldn't it be fun, to like, treat me like a fucktoy?'[or]Mmm, anal is my favourite...'[or]Can I suck your [manly-penis]?'[or]Can I please give you a blowjob?'[or]Hey baby, need a cumdump?'[or]Want to know what the back of my head looks like?'[or]Fuck me, I'm ready right now!'[or][if bukkake fetish is 0]When was the last time you got your [manly-penis] sucked, sexy?'[otherwise]Wouldn't it be fun, to like, jizz on my face?'[end if][or]I do anal.'[or]I'll let you cum inside!'[or]I've been a naughty [boy of the player] and I need a good hard fucking!'[purely at random][roman type][line break]";
	otherwise:
		say "[second custom style]'[one of]Ooh, I'm a bad [boy of the player], punish me!'[or]Let me eat your pussy!'[or]I want to put my tongue in your ass!'[or]I'll go down on you!'[or]Please fuck me!'[or]Please sit on my face!'[or]Wouldn't it be fun, to like, treat me like a fucktoy?'[purely at random][roman type][line break]";
	if M is intelligent raunchy monster, progress quest of greet-quest.

[!<SayBimboSeduceOfMonster>+

Outputs some special text where a cheerleader invites a monster to punish them.

@param <Monster>:<M> The monster being greeted

+!]
To say CheerSeduce of (M - a monster):
	if M is unfriendly:
		say "[second custom style]'[one of]Aren't you like, excited to fuck a super hot cheerleader?[or]I love talking almost as much as I love fucking. And I reeeaally love fucking.'[or]Do you even want to have sex with me? I've been talking pretty long and you're not fucking me yet.'[or]People tell me to shut up all the time, but it's like, I have so many interesting things to say!'[or]My name is [NameBimbo], but most people call me shut up slut!'[or]I'm on the cheerleading team!'[or]Go Team!'[in random order][roman type][line break]";
	otherwise:
		say "[second custom style]'[one of]Want to know why they call me the head cheerleader?'[or]Anal is like, waayy underrated. I can prove it if you want.'[or]Oooooh... I have a great idea. Let's have sex!'[or]I'm on the cheerleading team. Wanna fuck me?'[or]Cheerleading isn't hard, it's easy. Just like meee~'[or]I like to fuck bareback. Figured you would want to know.'[or]Hey cutie, want to be the top of the pyramid?'[at random][roman type][line break]".

[!<ComputeBimboSeducedOfMonster>+

Handles a monster reacting to a seductive greeting from the player.

@param <Monster>:<M> The monster being greeted

+!]
To compute BimboSeduced of (M - a monster):
	if M is not intelligent:
		say "Something seems to suddenly switch in [NameDesc of M][']s demeanour and [his of M] stance becomes aggressive.";
		anger M;
		now the boredom of M is 0;
	otherwise if diaper quest is 0 and M is actually seducable:
		repeat with N running through monsters in the location of the player:
			now N is stalled;
		now M is seduced;
		set up sex length of M in asshole;
		if the class of the player is cheerleader, increase the blue-balls of M by 4; [They really want to fuck a cheerleader!]
		now turns-spent-seducing is 0;
		now another-turn is 1;
		add the core seduction rule to another-turn-rules;
		say "Completely out of your own control, you find yourself grinding your [AssDesc] up against [NameDesc of M][']s crotch. Suddenly, your control over your own body returns to you, but it's clear that [NameDesc of M] wants more...";
	otherwise:
		say "Something seems to suddenly switch in [NameDesc of M][']s head and [his of M] [if M is friendly]friendly[otherwise]idle[end if] smile changes into a devilish grin. Uh-oh...[line break][variable custom style]Was it something I said?![roman type][line break]";
		anger M;
		now the boredom of M is 0.

[!<ComputeBasicGreetingToMonster>+

Handles any special code to be run when the player greets a monster. If the monster has special rules regarding boredom or perception, this function should be replaced.

@param <Monster>:<M> The monster being greeted

+!]
To compute basic greeting to (M - a monster):
	if M is interested and the greet-window of M > 0:
		compute conventional response of M;
	otherwise if M is interested:
		compute vanity response of M;
	otherwise:
		now the boredom of M is 0;
		check guaranteed perception of M.

[!<ComputeVanityGreetingToMonster>+

Handles greeting monsters that are already paying attention to the player.

@param <Monster>:<M> The monster being greeted

+!]
To say vanity greeting of (M - a monster):
	let N be a random unfriendly monster penetrating a body part;
	unless N is monster, now N is a random monster penetrating a body part;
	if M is penetrating a body part:[Greeting for monsters the player is currently having sex with]
		if M is unfriendly:
			say PartnerGreeting to M;
		otherwise:
			say FriendlyPartnerGreeting to M;
	otherwise if N is a monster:[Greeting for when the player is currently having sex]
		if N is unfriendly:
			say HelpGreeting to M with N;[help me out here/help them out!]
		otherwise:
			say AttentionGreeting to M with N;["Please watch!"]
	otherwise if M is unfriendly:
		say UnfriendlyGreeting to M;[either a taunt, or a request to stop]
	otherwise:
		say VanityGreeting to M.["please follow me."]

[!<SayPartnerGreetingToMonster>+

Displayed when the player greets a monster they are currently having rough sex with.

@param <Monster>:<M> The monster being greeted

+!]
To say PartnerGreeting to (M - a monster):
	let F be a random body part penetrated by M;
	if the player is a masochist:
		say FriendlyPartnerGreeting to M;
	otherwise:
		let F be a random fuckhole penetrated by M;
		if the player is feeling dominant and the player is not a pervert:
			if the player is gendered female, say "'[one of]You'll hear from my lawyer[or]Stop it! This is SO unacceptable[or]Stop fucking me, you jerk[in random order]!'";
			otherwise say "'[one of]Get off me!'[or]This isn't cool at all[or]Stop! This is way uncool[or]Dude[as decreasingly likely outcomes]!'";
		otherwise if the player is not a pervert:
			say "'[one of][or]My [F] can't take much more[or]Please! There must be someone else you can do this to[or]Not my [F][in random order]!'";
		otherwise:
			say "'[one of]Cum already[or]Please, just hurry up[or]Ah-ah-fuck[or]Hurry up[in random order]!'".

[!<SayNonEnthusiasmResponseOfMonster>+

Displayed after the player greets a monster they are currently not enjoying having sex with.

@param <Monster>:<M> The monster being greeted

+!]
To say NonEnthusiasmResponse of (M - a monster):
	if M is buddy:
		say MildAnnoyedResponse of M;
	otherwise if M is friendly:
		say AnnoyedResponse of M;
	otherwise:
		compute annoyed punishment of M.

[!<SayEnthusiasmResponseOfMonster>+

Displayed after the player greets a monster they are currently enjoying having sex with.

@param <Monster>:<M> The monster being greeted

+!]
To say EnthusiasmResponse of (M - a monster):
	if M is acquaintance:
		if a random number between -1 and the charisma of the player > 3, FavourUp M;
		say UnAnnoyedResponse of M;
	otherwise if M is friendly:
		say AnnoyedResponse of M;
	otherwise:
		compute annoyed punishment of M.

[!<SayUnAnnoyedResponseOfMonster>+

Displayed after the player greets a monster they are currently having sex with, and the monster was not annoyed by it.

@param <Monster>:<M> The monster being greeted

+!]
To say UnAnnoyedResponse of (M - a monster):
	say "[speech style of M]'Take it you dirty slut!'[roman type][line break]".

[!<SayMildAnnoyedResponseOfMonster>+

Displayed after the player greets a monster they are currently having sex with, and the monster was annoyed by it.

@param <Monster>:<M> The monster being greeted

+!]
To say MildAnnoyedResponse of (M - a monster):
	say "[speech style of M]'Stop ruining the moment!'[roman type][line break]".

[!<SayAnnoyedResponseOfMonster>+

Displayed after the player greets a monster they are currently having sex with, and the monster is close to getting really annoyed.

@param <Monster>:<M> The monster being greeted

+!]
To say AnnoyedResponse of (M - a monster):
	say "[speech style of M]'[one of]Shut up already!'[or]Shut up, you're being so annoying!'[or]Are you ever going to shut up?!'[in random order][roman type][line break]".

[!<ComputeAnnoyedPunishmentOfMonster>+

Handles any code to be run after a monster gets really annoyed with the player.

@param <Monster>:<M> The monster being greeted

+!]
To compute annoyed punishment of (M - a monster):
	let B be a random off-stage fetish appropriate gag;
	if B is actually summonable:
		say "[speech style of M]'Maybe this will shut you up, slut!'[roman type][line break][BigNameDesc of M] pulls out a [printed name of B] and forces it into your mouth!";
		summon B locked;
	otherwise:
		say "[speech style of M]'Shut up already!'[roman type][line break][BigNameDesc of M] backhands you harshly in the face!";
		DelicateUp 1.

[!<SayFriendlyPartnerGreetingToMonster>+

Displayed when the player greets a monster they are currently having gentle sex with.

@param <Monster>:<M> The monster being greeted

+!]
To say FriendlyPartnerGreeting to (M - a monster):
	if the player is a pervert:
		let F be a random fuckhole penetrated by M;
		if the player is feeling submissive:[player is a masochist]
			say "'[one of]HARDER!'[or]FUCK MY [F]! FUCK MY [F]!'[or][if pregnancy fetish is 1 and F is vagina]Breed me!'[otherwise]Make me your fucking bitch!'[end if][or]Oooh! It feels so fucking good!'[or]That feels so fucking good!'[or]Do you like my [F], baby?'[in random order]";
		otherwise:
			say "'[one of]How am I, sexy?'[or]How do you like my fuckhole, baby?'[in random order]";
		Arouse 100;
	otherwise:
		if the player is feeling dominant:
			if the player is gendered male, say "'Don't tell anybody about this!'";
			otherwise say "'Just so you know, this is a one time thing.'";
		otherwise:
			say "'[one of]This is just a one-time thing... unless you really need to go again.'[or]And remember, you can't tell ANYONE about this...'[in random order]".

[!<SayHelpGreetingToMonsterWithMonster>+

Displayed when the player greets a monster whilst having rough sex with another monster. Either asks the first monster for assistance, or asks the first monster to join in.

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having rough sex with the player

+!]
To say HelpGreeting to (M - a monster) with (N - a monster):
	if the player is a masochist:
		let G be nothing;
		if the player is fully occupied, now G is face;
		otherwise now G is a random fuckhole that is not actually occupied;
		say "'[one of]Join in!'[or]Want to make this a gangbang, sexy?'[or]Go ahead...'[or]Don't worry, I can handle another [if M is male]guy[otherwise]girl[end if]!'[or]Don't stand there, take my [G]!'[or]Don't just stand there, my [G] is empty!'[in random order]";
	otherwise:
		if the player is feeling dominant:
			say "'[one of]Are you really going to stand there and watch?'[or]Why are you watching? Do something!'[or]Don't just stand there, idiot! Help me!'[in random order]";
		otherwise if the player is feeling submissive:
			say "'[one of]What are you waiting for? You won't just let this happen, will you?'[or]Help me! Please! I'll do anything!'[or]Please, you can't just let this happen? Y-you'll help right?'[in random order]";
		otherwise:
			say "'[one of]I need help! Please, I'm not ready for this!'[or]HELP! Come on!'[or]Come on, you have to help me!'[in random order]".

[!<SayInvitationResponseOfMonsterWithMonster>+

Displayed after a masochistic player greets a monster whilst having rough sex with another monster. Invites the first monster to join in the sex.

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having rough sex with the player

+!]
To say InvitationResponse of (M - a monster) with (N - a monster):
	FavourDown M;
	FavourDown N;
	if M is willing to shag and (M is unfriendly or the player is seductive):
		if M is friendly, anger M;
		say InvitationAccepted of M with N;
	otherwise:
		say InvitationRejected of M with N.

[!<SayInvitationAcceptedOfMonsterWithMonster>+

Displayed after the player invites a monster to join sex with another monster, and the first monster accepts.

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having rough sex with the player

+!]
To say InvitationAccepted of (M - a monster) with (N - a monster):
	say "[speech style of M]'If you say so...'[roman type][line break]".

[!<SayInvitationRejectedOfMonsterWithMonster>+

Displayed after the player invites a monster to join sex with another monster, and the first monster refuses.

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having rough sex with the player

+!]
To say InvitationRejected of (M - a monster) with (N - a monster):
	say "[speech style of M]'No, thanks.'[roman type][line break]".

[!<SayAssistanceResponseOfMonsterWithMonster>+

Displayed after the player asks a monster for assistance whilst having rough sex with another monster.

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having rough sex with the player

+!]
To say AssistanceResponse of (M - a monster) with (N - a monster):[TODO: monsters can "join" sex on your side or give you something to make it easier]
	say AssistanceRejected of M with N.

[!<SayAssistanceRejectedOfMonsterWithMonster>+

Displayed after the player asks a monster for assistance whilst having rough sex with another monster, and the first monster refuses.

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having rough sex with the player

+!]
To say AssistanceRejected of (M - a monster) with (N - a monster):
	if M is unfriendly:
		say "[speech style of M]'Oh I'll help you all right.'[roman type][line break]";
	otherwise:
		if M is not male, say "[speech style of M]'Help yourself, Skank.'[roman type][line break]";
		otherwise say "[speech style of M]'No.'[roman type][line break]".

[!<SayAttentionGreetingToMonsterWithMonster>+

Displayed when the player greets a monster whilst having gentle sex with another monster

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having sex with the player

+!]
To say AttentionGreeting to (M - a monster) with (N - a monster):
	if the player is broken:
		say "'[one of]Watch me...'[or]Please look at me...'[or]Please watch me...'[in random order]";
	if the player is feeling submissive:
		say "'[one of]Like what you see, baby?'[or]Is this turning you on, sexy?'[or]Do you like what you see?'[or]Enjoying the show, sexy?'[in random order]";
	otherwise:
		say "'[one of]Y-you're still watching, right?'[or]C-could you keep watching? I promise it's important.'[or]H-hey, don't leave. I really need you to watch this.'[in random order]".

[!<SayAttentionResponseOfMonsterWithMonster>+

Displayed after the player greets a monster whilst having gentle sex with another monster. The monster will respond differently depending on how annoyed they are.

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having sex with the player

+!]
To say AttentionResponse of (M - a monster) with (N - a monster):
	FavourDown M;
	if M is unfriendly:
		say AttentionExceeded of M with N;
	otherwise:
		say AttentionAccepted of M with N.

[!<SayAttentionExceededOfMonsterWithMonster>+

Displayed when the player greets a monster whilst having gentle sex with another monster, and the first monster becomes aggressive.

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having sex with the player

+!]
To say AttentionExceeded of (M - a monster) with (N - a monster):
	say "[speech style of M]'I'll do more than watch!'[roman type][line break]";
	unless M is unfriendly, anger M.

[!<SayAttentionExceededOfMonsterWithMonster>+

Displayed when the player greets a monster whilst having gentle sex with another monster, and the first monster does not become aggressive.

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having sex with the player

+!]
To say AttentionAccepted of (M - a monster) with (N - a monster):
	say "[speech style of M]'Looks fun, enjoy!'[roman type][line break]".

[!<SayUnfriendlyGreetingToMonster>+

Displayed when the player greets a monster that is currently aggressive. If the player is a sadist, they will taunt the monster. Otherwise, they will ask the monster to stop attacking.

@param <Monster>:<M> The monster being greeted

+!]
To say UnfriendlyGreeting to (M - a monster):
	if the player is a sadist:
		if the player is gendered male, say "'[one of]I can't wait to tear your [HoleDesc of M] up when I beat you.'[or]Just for this, I'm going in dry.'[or]I can't wait to make you gag on my [sexual-player-penis]!'[in random order]";
		otherwise say "'[one of]I'm pissed off right now, but don't worry. You'll be making it up to me.'[or]Get ready for a long apology!'[or]I can't wait to show you what I have in store for you!'[in random order]";
		say TauntResponse of M;
	otherwise:
		if the player is a masochist:
			say "'[one of]We don't have to fight, do we? Couldn't we do... something else?'[or]Why hit me when you could be hitting me!'[or]I'd rather fuck than fight, really.'[or]All I need to do is get on my knees and you'll forgive me?'[or]Can't you forgive me? I can make it worth your while...'[or]Couldn't we solve this with sex? Why aren't we doing that?'[in random order]";
		otherwise if the player is feeling submissive:
			say "'[one of]Don't hit me!'[or]Don't hurt me!'[or]Please, you don't have to hit me!'[or]Please, I bruise easily!'[or]I'm sorry! Don't hit me!'[in random order]";
		otherwise if the player is feeling dominant:
			if the player is gendered male, say "'[one of]Are you sure you want this fight, man?'[or]I'll kick your ass, man!'[or]I don't think you want to fight me dude.'[in random order]";
			otherwise say "'[one of]Leave me alone, I have my rights!'[or][if M is not male]Fucking bitch,[otherwise]Fucking ape,[end if] leave me alone!'[or]Hit me again and you'll hear from my lawyer.'[in random order]";
		otherwise:
			if the player is gendered male, say "'[one of]Damn, what the fuck did I do to piss you off?'[or]Come on man, we don't have to fight!'[or]Fighting is so uncool!'[in random order]";
			otherwise say "'[one of]Stop hitting me, jerk!'[or]If you hit me again I'm going to hit back.[or]We don't have to fight! Think about this!'[or]Why do we have to fight? This is ridiculous!'[in random order]".

[!<SayTauntResponseOfMonster>+

Displayed after the player taunts a monster. Depending on the monster's annoyance level, and their history with the player, they will be either angry or intimidated.

@param <Monster>:<M> The monster being greeted

+!]
To say TauntResponse of (M - a monster):
	FavourDown M;
	let D be a random number between (the difficulty of M / 2) and 1;
	if D < the dominance of the player and the times-dominated of M > the times-submitted of M:
		compute taunt acceptance effect of M;
		say TauntAccepted of M;
	otherwise:
		compute taunt rejection effect of M;
		say TauntRejected of M.

[!<SayTauntAcceptedOfMonster>+

Displayed after the player taunts a monster, and the monster is intimidated.

@param <Monster>:<M> The monster being greeted

+!]
To say TauntAccepted of (M - a monster):
	say "[speech style of M]'H-hey, there's no need for that. I'll just leave you alone, OK?'[roman type][line break]".

[!<ComputeTauntAcceptanceEffectOfMonster>+

Handles any code to be run when the player intimidates a monster with a taunt. Usually makes the monster want to run away.

@param <Monster>:<M> The monster being greeted

+!]
To compute taunt acceptance effect of (M - a monster):
	now the scared of M is 30;
	Bore M.

[!<SayTauntRejectedOfMonster>+

Displayed after the player taunts a monster, and the monster is angered.

@param <Monster>:<M> The monster being greeted

+!]
To say TauntRejected of (M - a monster):
	say "[speech style of M]'I'll make you eat those words!'[roman type][line break][BigNameDesc of M] seems even more determined to beat you!".

[!<ComputeTauntRejectionEffectOfMonster>+

Handles any code to be run when the player angers a monster with a taunt. By default, causes the monster to lose favour, and regain a small amount of health.

@param <Monster>:<M> The monster being greeted

+!]
To compute taunt rejection effect of (M - a monster):
	FavourDown M by 1;
	if the health of M < the maxhealth of M - 5, increase the health of M by 5.

[!<SayPleadingResponseOfMonster>+

Displayed after the player asks a monster to stop attacking.

@param <Monster>:<M> The monster being greeted

+!]
To say PleadingResponse of (M - a monster):
	[TODO: monsters can say, "I'll leave you alone if you give me your X"]
	say PleadRejected of M.

[!<SayPleadRejectedOfMonster>+

Displayed after the player asks a monster to stop attacking, and the monster refuses.

@param <Monster>:<M> The monster being greeted

+!]
To say PleadRejected of (M - a monster):
	say "[speech style of M]'Shut up.'[roman type][line break]".

[!<SayVanityGreetingToMonster>+

Displayed when the player greets a monster that is already paying attention to them. Usually asks the monster to follow them or keep following them.

@param <Monster>:<M> The monster being greeted

+!]
To say VanityGreeting to (M - a monster):
	if the player is a masochist:
		say "'[one of]Are you getting used to seeing the back of my head?'[or]Maybe you and I should head somewhere more private, hmm?'[or]Where am I taking you, I wonder?'[at random]";
	otherwise:
		say "'[one of]Hey, can you follow me?'[or]Hey, follow me.'[or]Hey, you're following me, right?'[or]Follow me, please.'[at random]".

[!<ComputeVanityResponseOfMonster>+

Displayed after the player greets a monster that is already paying attention to them. Depending on how annoyed the monster is, they will respond differently.

@param <Monster>:<M> The monster being greeted

+!]
To compute vanity response of (M - a monster):
	let N be a random unfriendly monster penetrating a body part;
	unless N is monster, now N is a random monster penetrating a body part;
	if M is penetrating a body part:
		if (M is friendly and the player is a pervert) or the player is a masochist, say EnthusiasmResponse of M;[The player is enjoying it]
		otherwise say NonEnthusiasmResponse of M;[The player is not outwardly enjoying it.]
	otherwise if N is a monster:
		if N is unfriendly:
			if the player is a masochist, say InvitationResponse of M with N;[The player invited M to join]
			otherwise say AssistanceResponse of M with N;[The player asked M to help]
		otherwise:
			say AttentionResponse of M with N;[The player asked M to watch]
	otherwise if M is unfriendly:
		if the player is a sadist, say TauntResponse of M;[The player taunted M]
		otherwise say PleadingResponse of M;[The player asked M for a truce]
	otherwise:
		if M is ally:
			say VanityAccepted of M;
		otherwise if M is acquaintance:
			say VanityAnnoyed of M;
		otherwise:
			favourDown M;
			say VanityRejected of M;
			if M is friendly, bore M.

[!<SayVanityAcceptedOfMonster>+

Displayed after the player greets a monster that is already paying attention to them, and the monster isn't annoyed.

@param <Monster>:<M> The monster being greeted

+!]
To say VanityAccepted of (M - a monster):
	if M is guarding or M is caged:
		say "[speech style of M]'Sorry, I can't.'[roman type][line break]";
	otherwise:
		say "[speech style of M]'Sure, I can follow you.'[roman type][line break]".

[!<SayVanityAnnoyedOfMonster>+

Displayed after the player greets a monster that is already paying attention to them, and the monster is close to getting annoyed.

@param <Monster>:<M> The monster being greeted

+!]
To say VanityAnnoyed of (M - a monster):
	if M is guarding or M is caged or M is unconcerned:
		say "[speech style of M]'Unlike SOME people, I actually have a job to do.'[roman type][line break]";
	otherwise:
		say "[speech style of M]'I'll follow you for a little bit, I guess.'[roman type][line break]".

[!<SayVanityRejectedOfMonster>+

Displayed after the player greets a monster that is already paying attention to them, and the monster is already annoyed.

@param <Monster>:<M> The monster being greeted

+!]
To say VanityRejected of (M - a monster):
	if M is unfriendly, say "[speech style of M]'I've had enough of this. It's time I put you in your place.'[roman type][line break]";
	otherwise say "[speech style of M]'I've had enough. Bye.'[roman type][line break]".

[!<ComputeConventionalGreetingToMonster>+

Handles greeting monsters that are not currently paying attention to the player.

@param <Monster>:<M> The monster being greeted

+!]
To say conventional greeting of (M - a monster):
	let N be a random unfriendly monster penetrating a body part;
	unless N is monster, now N is a random monster penetrating a body part;
	if M is penetrating a body part, now N is M;
	if N is a monster:[the player has special greetings for when they are having sex]
		if N is unfriendly, say InSexGreeting to M with N;
		otherwise say InFriendlySexGreeting to M with N;
	otherwise if the player is a sadist and the times-dominated of M > 0:[the player only taunts if they're a sadist]
		say DominantGreeting to M;
	otherwise if the player is a masochist and the times-submitted of M > 0:[the player only brings up previous sex if they enjoyed it]
		say SubmissiveGreeting to M;
	otherwise if the greeted-count of M is 0:[This should display the first time the player greets a monster.]
		say FirstGreeting to M;
	otherwise:
		say RepeatGreeting to M.

To compute conventional response of (M - a monster):
	let N be a random unfriendly monster penetrating a body part;
	unless N is monster, now N is a random monster penetrating a body part;
	if N is a monster:
		if N is unfriendly:
			if the player is a masochist, say InvitationResponse of M with N;[the player invited M to join]
			otherwise say AssistanceResponse of M with N;[the player asked M to get them free]
		otherwise:
			say AttentionResponse of M with N;[the player asked M to watch]
	otherwise if the player is a sadist and the times-dominated of M > 0:[the player only taunts if they're a sadist]
		say DominantResponse of M;
	otherwise if the player is a masochist and the times-submitted of M > 0:[the player only brings up previous sex if they enjoyed it]
		say SubmissiveResponse of M;
	otherwise if the greeted-count of M is 0: [This should display the first time the player greets a monster.]
		say FirstResponse of M;
	otherwise:
		say RepeatResponse of M.

[!<SayInSexGreetingToMonsterWithMonster>+

Displayed when the player catches the attention of a monster whilst having rough sex with another monster

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having rough sex with the player

+!]
To say InSexGreeting to (M - a monster) with (N - a monster):
	if the player is a masochist:
		let G be nothing;
		if the player is fully occupied, now G is face;
		otherwise now G is a random fuckhole that is not actually occupied;
		if the class of the player is princess:
			say "'[one of][big royal-subject of M]. Every moment my [G] remains empty is a further embarrassment for you.'[or]You there, [royal-subject of M]. You may assist in satisfying me. Chop chop.'[or]Greetings, [royal-subject of M]. I assume you are waiting for an invitation?'[at random]";
		otherwise:
			say "'[one of]Hey there. Wanna join in?'[or]Hey babe. Don't you think [NameDesc of N] could use a hand?'[or]Hey you! Take my [G]!'[at random]";
	otherwise:
		if the class of the player is princess:
			say "'[one of][big royal-subject of M]. I demand assistance.'[or]You there, [royal-subject of M]. I hereby order you to assist me.'[or]You there, [royal-subject of M]. I assume you are ready to assist?'[at random]";
		otherwise if the player is feeling dominant:
			say "'[one of]You there. Help me.'[or]Hey you. Get this [man of N] off me!'[or]Hey, I need some help. You can handle that, right?'[at random]";
		otherwise if the player is feeling submissive:
			say "'[one of]Oh I'm so glad you're here. You'll help me out, right?'[or]Hey, please help me out! Please!'[or]Hey you, help me! Y-you'll do it, right?'[at random]";
		otherwise:
			say "'[one of]Hey, help me out here!'[or]Hey, I need a little help here!'[or]H-hey, I could use some help!'[at random]".

[!<SayInSexGreetingToMonsterWithMonster>+

Displayed when the player catches the attention of a monster whilst having gentle sex with another monster

@param <Monster>:<M> The monster being greeted
@param <Monster>:<N> The monster currently having gentle sex with the player

+!]
To say InFriendlySexGreeting to (M - a monster) with (N - a monster):
	if the class of the player is princess:
		say "'[one of][big royal-subject of M]. I demand that you observe your princess.'[or][big royal-subject of M]. I hereby order you to watch me.'[or]Greetings, [royal-subject of M]. Do you perhaps like what you see?'[at random]";
	otherwise if the player is feeling submissive:
		say "'[one of]Yoo-hoo! Look over here!'[or]Hey, look over here!'[or]Hey, look over here for something fun!'[at random]";
	otherwise:
		say "'[one of]H-hey, could you look at me real quick?'[or]Look, this is really embarrassing, but can you look over here?'[or]Hey, I know this is weird, but I need you to watch this.'[at random]".

[!<SayDominantGreetingToMonster>+

Displayed when a sadistic player greets a monster they have a mostly dominant history with.

@param <Monster>:<M> The monster being greeted

+!]
To say DominantGreeting to (M - a monster):
	if the class of the player is princess:
		say "'[one of][big royal-subject of M]. I am aroused. Get on your knees, NOW.'[or][big royal-subject of M]. Your services are required. On your knees.'[or]Greetings, [royal-subject of M]. I have need of your body. On your knees, chop chop.'[at random]";
	otherwise:
		say "'[one of]Yo, bitch! Stay there, I want to fuck you again.'[or][if the player is possessing a penis]Hey bitch, how did it feel taking my BIG DICK[otherwise]Yo bitch! You might as well just get on your knees now[end if].'[or][if the player is possessing a penis]Hey bitch, how'd you like to suck my [manly-penis][otherwise]Hey bitch. Ready to go again[end if]?'[or]What's up bitch? Ready for round [the times-dominated of M + 1]?'[or]Hey bitch. Up for another round?'[at random]".

[!<SayDominantResponseOfMonster>+

Displayed after a sadistic player greets a monster a mostly dominant history with. Usually the same as a monster's response to taunting.

@param <Monster>:<M> The monster being greeted

+!]
To say DominantResponse of (M - a monster):
	say TauntResponse of M.

[!<SaySubmissveGreetingToMonster>+

Displayed when a masochistic player greets a monster they have a mostly submissive history with.

@param <Monster>:<M> The monster being greeted

+!]
To say SubmissiveGreeting to (M - a monster):
	let N be the times-submitted of M;
	let P be N + 1;
	if diaper quest is 1:
		if the diaper addiction of the player > 8, say "'[one of]Hey there. Are you going to do that thing to me again?'[or]Hey there [daddy of M].'[or][if the player is diapered]Hey [daddy of M]. I wonder if my diaper needs checking[otherwise]Hey you. Remind me, what do you do to naughty babies who are being bad [boy of the player]s and not wearing diapers[end if]...'[at random]";
		otherwise say "'[one of]Uh-oh, it's you again...'[or]Why do we keep meeting at moments like this!'[or][if the player is diapered]Hi there. Yes I'm diapered. No I don't need you to check me[otherwise]Oh look, another [man of M] who's obsessed with making me wear a diaper[end if].'[at random]";
	otherwise if the class of the player is princess and M is bride-consort:
		say "'[one of][big royal-subject of M]. Our previous tryst was most satisfying, I will admit.'[or][big royal-subject of M]. Your status certainly belies your skill in the bedroom.'[or]Greetings, [royal-subject of M]. I would not mind it if you were to ravish me again at a later time.'[at random]";
	otherwise if M is mating:
		say "'[one of][if M is presenting as female]Hey there baby momma!'[otherwise]Hey there baby daddy.'[end if][or]Hey baby. Want to make out?'[or]Hey babe! Let's hold hands!'[or][if M is presenting as female]So, want to be girlfriend girlfriend now that we have a baby together?'[otherwise]Want to be boyfriend girlfriend now that we have a baby together?'[end if][at random]";
	otherwise if the player is not a nympho:
		say "'[one of]Hey there. You sure know how to have a good time.'[or]I can go another round, if you want.'[or]So, want to go again? That last fuck was pretty good.'[or]You sure know how to please a lady. Want to go for round [P]?'[at random]";
	otherwise:
		say "'[one of]Hey baby. Ready to put [if M is male]your [manly-penis][otherwise]something[end if] in me again?'[or]Feel like another round, [if M is male]big boy'[otherwise]sexy?'[end if][or]Hey baby. Do you want to go again?'[or]I'm always up for another round, sexy.'[at random]".

[!<SaySubmissveResponseOfMonster>+

Displayed after a masochistic player greets a monster they have a mostly submissive history with.

@param <Monster>:<M> The monster being greeted

+!]
To say SubmissiveResponse of (M - a monster):
	if diaper quest is 1:
		if M is unfriendly, say "[speech style of M]'Oh good, you're getting used to it, then? Here I come...'[roman type][line break]";
		otherwise say "[speech style of M]'Oh look, it's my favourite baby!'[roman type][line break]";
	otherwise if M is unfriendly:
		say "[speech style of M]'Time for another round!'[roman type][line break]";
	otherwise:
		if a random number between -1 and the charisma of the player > 3, FavourUp M;
		say "[speech style of M]'I'm always ready for another round, slut!'[roman type][line break]".

[!<SayFirstGreetingToMonster>+

Displayed when the player greets a monster for the first time.

@param <Monster>:<M> The monster being greeted

+!]
To say FirstGreeting to (M - a monster):
	if the class of the player is santa's little helper:
		say "'Merry Christmas!'";
	otherwise if the class of the player is princess:
		say "'[one of]Greetings. I am princess [NameBimbo].'[or]Good morrow, [royal-subject of M]. My name is princess [NameBimbo].'[at random]";
	otherwise:
		say DefaultFirstGreeting to M.

[!<SayFirstGreetingToMonster>+

Displayed when the player greets a monster for the first time, and there are no special rules for the greeting to follow.

@param <Monster>:<M> The monster being greeted

+!]
To say DefaultFirstGreeting to (M - a monster):
	if bimbo of the player < 4:
		if the player is gendered female:
			if M is neuter or M is male:
				say "'[one of]Hello.'[or]Hello, my name is [NameBimbo].'[or]Hello. I have something I want to ask you.'[at random]";
			otherwise:
				say "'[one of]Hi there, pleased to meet you.'[or]Hello, my name is [NameBimbo].'[or]I can't say I'm glad to meet another woman here, but hello anyway.'[at random]";
		otherwise:
			if M is neuter:
				say "'Hello there.'";
			otherwise if M is male:
				say "'[one of]Yo.'[or]Sup Dude.'[or]Hey man.'[at random]";
			otherwise:
				say "'[one of]Hey baby! What's going on?'[or]Sup girl? I'm [NameBimbo].'[or]Hey. What's up baby?'[at random]";
	otherwise if bimbo of the player < 7:
		if the player is gendered female:
			if M is neuter or M is male:
				say "'[one of]Hi. What's your name?'[or]Hello, I'm [NameBimbo].'[or]Hi! Do you have time to talk?'[at random]";
			otherwise:
				say "'[one of]Hi there, do you know if there's a way out?'[or]Hello, I'm [NameBimbo].'[or]Hello! I'm glad to see another woman here... you know what I mean.'[at random]";
		otherwise:
			if M is neuter:
				say "'Hi there.'";
			otherwise if M is not male:
				say "'[one of]Hello, I'm [NameBimbo].'[or]Hey. Are you trapped in here too?'[or]Hey, what's up?'[at random]";
			otherwise:
				say "'[one of]Hey man. Got some time?'[or]Hey, I'm [NameBimbo].'[or]Hey, do you have a minute?'[at random]";
	otherwise if bimbo of the player < 10:
		if M is neuter or M is male, say "'[one of]Hey there!'[or]Hi!'[at random]";
		otherwise say "'[one of]Hey girlfriend!'[or]What's going on, girlfriend?'[or]Hey girl!'[at random]";
	otherwise if bimbo of the player < 12:
		if M is not male, say "'[one of]Hey there cutie.'[or]Hey there. *wink*'[or]Hi. You're totally hot!'[at random]";
		otherwise say "'[one of]Hey there.'[or]Hey there cutie.'[or]Hey. Your muscles are really big.'[at random]'";
	otherwise if bimbo of the player < 15:
		say "'[one of]Mmm, I've never met you before, sexy.'[or]Hi there sexy.'[or]Hey sexy. I think I'd remember meeting you before...'[at random]";
	otherwise:
		say "'[one of]Hey there sexy. My name is [NameBimbo].'[or]Hey cutie. You want to get out of here?'[or]Hey sweetie. Looking for a good time?'[at random]".

[!<SayFirstResponseOfMonster>+

Displayed after the player greets a monster for the first time.

@param <Monster>:<M> The monster being greeted

+!]
To say FirstResponse of (M - a monster):
	say "[speech style of M]'Hello.'[roman type][line break]".

[!<SayRepeatGreetingToMonster>+

Displays when the player greets a monster they have already met.

@param <Monster>:<M> The monster being greeted

+!]
To say RepeatGreeting to (M - a monster):
	if the class of the player is princess:
		say "'[one of]Greetings, [royal-subject of M].'[or]Good morrow, [royal-subject of M].'[at random]";
	otherwise if the class of the player is santa's little helper:
		say "'Merry Christmas!'";
	otherwise:
		say DefaultGreeting to M.

[!<SayDefaultGreetingToMonster>+

Displays when the player greets a monster they have already met, and there are no special rules for greetings that the player must follow.

@param <Monster>:<M> The monster being greeted

+!]
To say DefaultGreeting to (M - a monster):
	if bimbo of the player < 4:
		if the player is gendered female:
			if M is neuter or M is male:
				say "'[one of]Hello. Again[or]Oh. You again[or]Hello[at random].'";
			otherwise:
				say "'[one of]Hi! Glad to see you again[or]Hello, glad to see you're still managing to stay alive in this hell-hole[or]Hello again. It's nice to see you[at random].'";
		otherwise:
			if M is neuter:
				say "'Hi there.'";
			otherwise if M is male:
				say "'[one of]Hey dude[or]Sup Dude[or]Hey man[at random].'";
			otherwise:
				say "'[one of]Hey baby! What's going on[or]Yo yo! Feeling lonely, baby[or]Hey, what's up baby[at random]?'";
	otherwise if bimbo of the player < 7:
		if the player is gendered female:
			if M is neuter or M is male:
				say "'[one of]Hey there[or]Hello[or]Hi[at random]!'";
			otherwise:
				say "'[one of]Hello again. At least I'm not the only one stuck here.'[or]Hello again.'[or]Hello! We met before, right?'[at random]";
		otherwise:
			if M is neuter or M is male:
				say "'[one of]Hi. It's always nice to see a friendly face.'[or]Hey, remember me? I'm [NameBimbo].'[or]Hey, do you have a minute?'[at random]";
			otherwise:
				say "'[one of]Hello again. At least I'm not the only one stuck here.'[or]Hello again.'[or]Hello! We met before, right?'[or]Hey, remember me? I'm [NameBimbo].'[at random]";
	otherwise if bimbo of the player < 10:
		if M is neuter:
			say "'Hi there.'";
		otherwise if M is not male:
			say "'[one of]Hi! You're pretty!'[or]Hello, I'm [NameBimbo].'[or]Hi. Nice to meet you again!'[at random]";
		otherwise:
			say "'[one of]Hey there. You're kind of cute.'[or]You can call me [NameBimbo]. Can I call you anything?'[or]Hi! You look smart.'[at random]";
	otherwise if bimbo of the player < 12:
		if M is neuter:
			say "'Hi there.'";
		otherwise if M is not male:
			say "'[one of][or]Hey there cutie.'[or]Hey there. *wink*'[at random]";
		otherwise:
			say "'[one of]Hey there.'[or]Hey there cutie.'[or]Hi! There's a pair big sexy shoulders I haven't seen in a while!'[at random]";
	otherwise if bimbo of the player < 15:
		if M is neuter:
			say "'Hi there.'";
		otherwise:
			say "'[one of]Hi. We should really get to know each other better.'[or]Hi there sexy. I know a fun way to pass some time.'[or]Hey sexy. Want to meet me somewhere?'[at random]";
	otherwise:
		if M is neuter:
			say "'Hi there.'";
		otherwise:
			say "'[one of]Hey there sexy. Up for a good time?'[or]Hey there big boy.'[or]Hey sexy. I know a fun way to pass some time.'[at random]".

[!<SayRepeatResponseOfMonster>+

Displayed after the player greets a monster they have already met.

@param <Monster>:<M> The monster being greeted

+!]
To say RepeatResponse of (M - a monster):
	say FirstResponse of M.

Chapter 2 Skill Questioning

talk-teach is a talk-object.
the player has a number called skillCooldown.

To consider (T - talk-teach) for (M - a monster):
	if M is not defeated and M is intelligent and the skillCooldown of the player <= 0:
		now the printed name of talk-teach is the substituted form of "[TeachQuestion of M]";
		set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-teach) for (M - a monster):
	compute teaching of M.

To reset skill cooldown:
	if the skillCooldown of the player <= 0, say "That took a lot of concentration! You feel like you're going to need to wait a while before you can learn another skill from someone you meet.";
	now the skillCooldown of the player is 1000.

A time based rule (this is the skill cooldown rule):
	if the skillCooldown of the player > 0:
		decrease the skillCooldown of the player by 2 + the intelligence of the player;
		if the skillCooldown of the player <= 0:
			now the skillCooldown of the player is 0;
			say "[bold type]You feel ready to learn another skill.[roman type][line break]".

To compute teaching of (M - a monster):
	compute default teaching of M.

To compute default teaching of (M - a monster):
	say "[BigNameDesc of M] teaches you a fun magic trick. You're amazed and impressed at how much one can do with simple finesse! You feel a bit more nimble.";
	DexUp 1;
	reset skill cooldown.

[Skill question. This is in case there's an npc that wants this to be modular]
To say TeachQuestion of (M - a monster):
	say "'Can you teach me anything useful?'";

Chapter 3 Drink Requesting

talk-drink-request is a talk-object.

To consider (T - talk-drink-request) for (M - a monster):
	if M is intelligent and the player is thirsty:
		if M is defeated:
			now the printed name of T is the substituted form of "[DefeatedDrinkRequest of M]";
		otherwise:
			now the printed name of T is the substituted form of "[DrinkRequest of M]";
		set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-drink-request) for (M - a monster):
	if M is defeated:
		say DefeatedDrinkResponse of M;
	otherwise if M is willing to urinate and watersports fetish is 1 and a random number between 1 and 20 < the urine taste addiction of the player:
		compute M urinating;
	otherwise if the semen taste addiction of the player > 5 and M is willing to do oral and (M is male or M is wench):
		now the player-reaction of the player is submitting;
		now presented-orifice is face;
		humiliate 225;
		check consensual submissive sex of M;
	otherwise if M is friendly:
		compute friendly drink of M;
	otherwise:
		compute unfriendly drink of M.

To say DrinkRequest of (M - a monster):
	if the class of the player is santa's little helper:
		say "'I'm thirsty. Got any mulled wine?'";
	otherwise if watersports fetish is 1 and the urine taste addiction of the player > 5 and the urine taste addiction of the player >= the semen taste addiction of the player and M is willing to urinate:
		say "[if the urine taste addiction of the player < 9]Please, do you have anything I could drink? I would even drink your pee if you wanted...'[otherwise if the urine taste addiction of the player < 12]Please, do you have anything I could drink from? I'll even drink your [urine] if you'll let me.'[otherwise if the urine taste addiction of the player < 15]I'd love to drink your [urine] if you'll let me. Anything will do though, I'm very thirsty.'[otherwise]Please may I have the privilege of being your toilet? I promise I'll savour every last drop.'[end if]";
	otherwise if the semen taste addiction of the player > 5 and M is willing to do oral and (M is male or M is wench):
		say "[if the semen taste addiction of the player < 9]Please, do you have anything I could drink? I would even drink your cum if you wanted...'[otherwise if the semen taste addiction of the player < 12]Please, do you have anything I could drink from? I'll even drink your [semen] if you'll let me.'[otherwise if the semen taste addiction of the player < 15]I'd love to drink your [semen] if you'll let me. Anything will do though, I'm very thirsty.'[otherwise if M is male]Please may I have the privilege of sucking your cock? I promise I'll savour every last drop.'[otherwise]Please may I have the privilege of drinking from your [']tap[']? You seem to have a lot to spare...'[end if]";
	otherwise if the bimbo of the player < 3:
		say "Please, do you have anything I could drink?'";
	otherwise if the bimbo of the player < 6:
		say "Excuse me, I am really thirsty, do you have anything I could drink?'";
	otherwise if the bimbo of the player < 9:
		say "Please, do you have anything I could drink from?'";
	otherwise if the bimbo of the player < 12:
		say "I'd do anything for something to drink.'";
	otherwise if the bimbo of the player < 15:
		say "I just really need something to wet my throat...'";
	otherwise:
		say "I just need something to suck on... I'll swallow anything you give me...'".

To compute friendly drink of (M - a monster):
	say "[speech style of M]'Sorry, I don't have anything.'[roman type][line break]".

To compute unfriendly drink of (M - a monster):
	if M is not willing to shag:
		say "[speech style of M]'No way! Get your own drink.'[roman type][line break]";
	otherwise:
		say "[speech style of M]'I'll give you something to drink all right!'[roman type][line break]";
		now the boredom of M is 0;
		now M is interested.

[To compute desperate drinking to (M - a monster):
	say "You [if the player is upright]drop to your knees and [end if]beg [NameDesc of M] to give you something to drink.";
	now the stance of the player is 1;
	if M is unfriendly:
		compute unfriendly drink of M;
	otherwise:
		compute friendly drink of M.]

To say DefeatedDrinkRequest of (M - a monster):
	if M is diaper-enslaved:
		say DiaperEnslavedDrinkRequest of M;
	otherwise if M is sex-enslaved:
		say SexEnslavedDrinkRequest of M;
	otherwise:
		say FuckedSillyDrinkRequest of M.

To say FuckedSillyDrinkRequest of (M - a monster):
	say "'Any chance you've got something I could drink?'".

To say SexEnslavedDrinkRequest of (M - a monster):
	say FuckedSillyDrinkRequest of M.

To say DiaperEnslavedDrinkRequest of (M - a monster):
	say FuckedSillyDrinkRequest of M.

To say DefeatedDrinkResponse of (M - a monster):
	say DefeatedGreetResponse of M.

Chapter 4 Food Requesting

talk-food-request is a talk-object.

To consider (T - talk-food-request) for (M - a monster):
	if M is intelligent and the player is hungry:
		if M is defeated:
			now the printed name of T is the substituted form of "[DefeatedFoodRequest of M]";
		otherwise:
			now the printed name of T is the substituted form of "[FoodRequest of M]";
		set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-food-request) for (M - a monster):
	if M is defeated:
		say DefeatedFoodResponse of M;
	otherwise if M is friendly:
		compute friendly food of M;
	otherwise if M is unfriendly:
		compute unfriendly food of M.

To say FoodRequest of (M - a monster):
	if the bimbo of the player < 3:
		say "'Please, do you have anything I could eat?'";
	otherwise if the bimbo of the player < 6:
		say "'Excuse me, I am really hungry, do you have anything I could eat?'";
	otherwise if the bimbo of the player < 9:
		say "'Please, do you have anything I could eat from?'";
	otherwise if the bimbo of the player < 12:
		say "'I'd do anything for something to eat.'";
	otherwise if the bimbo of the player < 15:
		say "'I just really need something to fill my stomach...'";
	otherwise:
		say "'I just need something to put in my mouth... I'll swallow anything you give me...'".

Definition: a monster is willing to give snacks: decide no.

To compute friendly food of (M - a monster):
	if M is willing to give snacks:
		let C be a random off-stage standard tier candy;
		if there is held food or there is on-stage candy:
			say FriendlyFoodRefuseFlav of M;
		otherwise if C is candy:
			say "[FriendlyFoodAgreeFlav of M][line break][BigNameDesc of M] gives you a [C], which you eat immediately.";
			now C is held by the player;
			try TQeating C;
		otherwise:
			say FriendlyFoodEmptyFlav of M;
	otherwise:
		say FriendlyFoodApologiseFlav of M.

To say FriendlyFoodRefuseFlav of (M - a monster):
	say "[speech style of M]'Seems to me that you have food of your own. Why don't you eat that first?'[roman type][line break]".

To say FriendlyFoodAgreeFlav of (M - a monster):
	say "[speech style of M]'I guess you can have this.'[roman type]".

To say FriendlyFoodEmptyFlav of (M - a monster):
	say "[speech style of M]'I do not have anything for you.'[roman type][line break]".

To say FriendlyFoodApologiseFlav of (M - a monster):
	say "[speech style of M]'Sorry, I don't have anything.'[roman type][line break]".

To say UnfriendlyFoodRefuseFlav of (M - a monster):
	say "[speech style of M]'No way! Get your own food.'[roman type][line break]".

To say UnfriendlyFoodLewdFlav of (M - a monster):
	say "[speech style of M]'I'll give you something to eat all right!'[roman type][line break]".

To compute unfriendly food of (M - a monster):
	if M is not willing to shag:
		say UnfriendlyFoodRefuseFlav of M;
	otherwise:
		say UnfriendlyFoodLewdFlav of M;
		now M is interested;
		now the boredom of M is 0.

To compute desperate eating to (M - a monster): [Currently unused]
	say "You [if the player is upright]drop to your knees and [end if]beg [NameDesc of M] to give you something to eat.";
	now the stance of the player is 1;
	if M is unfriendly:
		compute unfriendly food of M;
	otherwise:
		now M is interested;
		compute friendly food of M.

To say DefeatedFoodRequest of (M - a monster):
	if M is diaper-enslaved:
		say DiaperEnslavedFoodRequest of M;
	otherwise if M is sex-enslaved:
		say SexEnslavedFoodRequest of M;
	otherwise:
		say FuckedSillyFoodRequest of M.

To say FuckedSillyFoodRequest of (M - a monster):
	say "'Um, I guess you don't have any food?'".

To say SexEnslavedFoodRequest of (M - a monster):
	say FuckedSillyFoodRequest of M.

To say DiaperEnslavedFoodRequest of (M - a monster):
	say FuckedSillyFoodRequest of M.

To say DefeatedFoodResponse of (M - a monster):
	say DefeatedGreetResponse of M.

Chapter 5 Dismissal

dismissalConvincingPower is a number that varies.

Definition: a monster is dismissable:
	if it is unleashed or it is unconcerned, decide yes;
	decide no. [Some NPCs can't be told to leave even when they're friendly, like the shopkeeper and witch]

To say undismissable of (M - a monster):
	say "[BigNameDesc of M] raises an eyebrow.[line break][speech style of M]'[one of]I'm staying right here. You are free to leave my presence whenever you want...'[or]As if I'd pay attention to you, [NameBimbo].'[or]Don't try to give me orders!'[or]Why on Earth do you think I'd take orders from someone like you?'[in random order][roman type][line break]".

speakingOutLoud is a number that varies. [For tracking whether the player chose to speak out loud rather than wave goodbye]

talk-dismiss is a talk-object.

To consider (T - talk-dismiss) for (M - a monster):
	if M is intelligent and M is interested and M is not caged:
		if M is defeated:
			now the printed name of T is the substituted form of "[DefeatedDismissal of M]";
		otherwise:
			now dismissalConvincingPower is -100;
			now the printed name of T is the substituted form of "[DismissalRequest of M]";
		set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-dismiss) for (M - a monster):
	[let F be the favour of M;
	let U be 0;
	if M is interested, now U is 1;
	if speakingOutLoud is 2:
		follow the speech penalties rules;
	if speakingOutLoud is 2 and (the favour of M is not F or (U is 0 and M is interested) or (U is 1 and M is not interested) or M is grabbing the player or M is penetrating a body part or M is not in the location of the player):
		do nothing;] [NPC has already reacted]
	if M is defeated:
		say "[BigNameDesc of M] stops following you around.";
		bore M;
	otherwise if M is friendly and M is not robot and M is not hellhound:
		if M is dismissable, compute friendly dismissal of M;
		otherwise say undismissable of M;
	otherwise:
		compute unfriendly dismissal of M.

Definition: yourself is thinking of relieving themselves:
	if the location of the player is use-the-floor, decide no;
	if watersports mechanics is 1 and (the player is male or the location of the player is not urinals), decide yes;
	if the total squirtable fill of belly > 0 and the location of the player is toilets, decide yes;
	decide no.

To say DismissalRequest of (M - a monster):
	[now speakingOutLoud is 0;
	if the player is able to speak:
		now speakingOutLoud is 1;
	otherwise if the player is silently able to manually speak:
		say "Do you want to speak out loud? [if incontinent-when-speaking tattoo is worn]If you do, you might soil yourself. [end if]If you don't, you won't be able to explain [italic type]why[roman type] you want [him of M] to leave.";
		if the player is bimbo consenting, now speakingOutLoud is 2;
	if speakingOutLoud > 0:]
	if M is robot or M is hellhound:
		say "'I don't suppose you'll leave me alone if I ask you to?'";
	otherwise if M is unfriendly:
		if the class of the player is princess, say DismissalDemandRoyal of M;
		otherwise say DismissalDemandDefault of M;
	otherwise if the class of the player is princess:
		now dismissalConvincingPower is the DismissalPowerRoyal of M;
		say DismissalRequestRoyal of M;
	otherwise if the class of the player is vixen:
		now dismissalConvincingPower is the DismissalPowerVixen of M;
		say DismissalRequestVixen of M;
	otherwise if the player is in danger:
		now dismissalConvincingPower is the DismissalPowerCombat of M;
		say DismissalRequestCombat of M;
	otherwise if the player is thinking of relieving themselves:
		now dismissalConvincingPower is the DismissalPowerToilet of M;
		say DismissalRequestToilet of M;
	otherwise if the player is bursting or the player is feeling full or the total squirtable fill of belly > 0:
		now dismissalConvincingPower is the DismissalPowerBursting of M;
		say DismissalRequestBursting of M;
	otherwise if the player is very horny and the player is able to automatically masturbate:
		now dismissalConvincingPower is the DismissalPowerHorny of M;
		say DismissalRequestHorny of M;
	otherwise if the friendly boredom of M > 10:
		now dismissalConvincingPower is the DismissalPowerStalker of M;
		say DismissalRequestStalker of M;
	otherwise:
		now dismissalConvincingPower is the DismissalPowerDefault of M;
		say DismissalRequestDefault of M;
	[otherwise:
		say "You try to [if the player is feeling dominant]aggressively shoo [NameDesc of M] out of the room[otherwise if the player is feeling submissive]politely wave goodbye to [NameDesc of M][otherwise]gesture to [NameDesc of M] that it's time for [him of M] to leave[end if].";
		now dismissalConvincingPower is 0.]

To decide which number is the DismissalPowerRoyal of (M - a monster):
	decide on 1.

To say DismissalDemandDefault of (M - a monster):
	say "'Fuck off!'";

To say DismissalDemandRoyal of (M - a monster):
	say "Enough of this! Begone, peasant!";

To say DismissalRequestRoyal of (M - a monster):
	say "'[if M is royal guard]Sir[otherwise]Citizen[end if], you are dismissed.'".

To decide which number is the DismissalPowerVixen of (M - a monster):
	decide on 2.

To say DismissalRequestVixen of (M - a monster):
	say "'[if the player is a nympho and diaper quest is 0]Look! Over there! That chick is totally fucking herself[otherwise if the player is a nympho]Look! Over there! That chick is totally wetting herself[otherwise if the intelligence of the player < 6]Look, over there! A distraction[otherwise][one of]Quick quick, you're needed over there[or]It's an emergency, please, quick, right over there[or]Oh my god, there's something CRAZY going on right over there! Go check it out right now[in random order][end if]!'".

To decide which number is the DismissalPowerToilet of (M - a monster):
	if the diaper-duration of M > 0, decide on -100;
	decide on 2.

To say DismissalRequestToilet of (M - a monster):
	if diaper quest is 0, say "'[if the player is feeling dominant]Give me some privacy in here, [fucker of M]!'[otherwise if the player is feeling submissive]Please [stud of M], would I be allowed to erm, you know, in private?'[otherwise if the player is a pervert]I'm about to relieve myself, hun. So unless that turns you on, perhaps you should probably look the other way?'[otherwise]Um, are you a pervert or something? Do you always watch people when they're trying to relieve themselves?'[end if]";
	otherwise say "'[if the diaper-duration of M > 0]Could you PLEASE just leave me alone in this room for a minute? I want to do... something.'[otherwise if the player is feeling dominant]Give me some privacy in here, [fucker of M]!'[otherwise if the player is feeling submissive]Please [stud of M], would I be allowed to go potty in private?'[otherwise if the player is a pervert]I'm about to relieve myself, hun. So unless that turns you on, perhaps you should probably look the other way?'[otherwise]Um, are you a pervert or something? Do you always watch people when they're trying to relieve themselves?'[end if]".

To decide which number is the DismissalPowerBursting of (M - a monster):
	if diaper quest is 1, decide on -1;
	decide on 2.

To say DismissalRequestBursting of (M - a monster):
	if diaper messing >= 3 and (the player is feeling full or the total squirtable fill of belly > 0):
		say "'[if the diaper addiction of the player > 14]Uh-oh, [NameBimbo] [one of]needs to doo-doo[or]gotta make poopies[or]gonna make mush[in random order]! Are you... going to watch me?'[otherwise]Fuck dude, I'm gonna do something really nasty soon, I can feel it coming! You should leave.'[end if]";
	otherwise if the player is bursting:
		say "'[if the diaper addiction of the player > 14][NameBimbo][']s gonna go tinkles... do you wanna watch?'[otherwise]Hey I gotta pee soon, please could you give me some privacy?'[end if]";
	otherwise:
		say "'[if the player is a nympho]Ooh fuck, it's coming out soon... Are you sure you wanna be here to watch this?'[otherwise]I can't hold it in for much longer, please, don't look!'[end if]".

To decide which number is the DismissalPowerHorny of (M - a monster):
	decide on 1.

To say DismissalRequestHorny of (M - a monster):
	if the player is a nympho:
		say "'Look honey, I'm so fucking horny I'm about to [if the size of penis > 2]jack[otherwise]jill[end if] myself raw, are you sure you want to be around for that?'";
	otherwise if the player is feeling submissive:
		say "'Please [stud of M], can I have permission to make myself cum? And erm, [if the player is disgraced]do you have to watch[otherwise]would you mind looking the other way[end if]?'";
	otherwise:
		say "'I need to see to some... needs... Would you please kindly [if the player is feeling dominant]fuck off and come back later[otherwise]allow me the decency of some privacy[end if]?'".

To decide which number is the DismissalPowerCombat of (M - a monster):
	decide on 2.

To say DismissalRequestCombat of (M - a monster):
	if the player is a nympho:
		say "'This might get [']messy['], are you sure you want to stick around?'";
	otherwise if the player is prone:
		say "'[if M is shameless]If you want to watch, that's okay, but please don't think you have to indulge in my shame[otherwise]Please, I don't want you to watch this[end if]...'";
	otherwise:
		say "'Hey, I'm a little busy kicking butt right now, [if M is not guardian]so if you're not going to help [end if]can you come back later?'".

To decide which number is the DismissalPowerStalker of (M - a monster):
	decide on 1.

To say DismissalRequestStalker of (M - a monster):
	if the player is a nympho:
		say "'Aren't there other sluts around here you need to spend some time stalking? Or is it just me?'";
	otherwise if the player is feeling submissive:
		say "'Thank you [literalMistress of M] for following me around and making sure that I [if diaper quest is 1]follow the rules[otherwise]don't get up to mischief[end if], but do you have to do it forever?'";
	otherwise:
		say "'[if the player is feeling dominant]Could you fuck off? You're beginning to feel like a stalker.'[otherwise]Don't you ever get bored of following me around?'[end if]".

To decide which number is the DismissalPowerDefault of (M - a monster):
	decide on 0.

To say DismissalRequestDefault of (M - a monster):
	if the player is feeling submissive:
		say "'[one of]Am I dismissed[or]Am I free to go[or]Please may I have some alone time[in random order], [stud of M]?'";
	otherwise if the player is a nympho and diaper quest is 0:
		say "'Sorry hun, I've got stuff to fuck, can we continue this later?'";
	otherwise if the player is feeling dominant and M is not buddy:
		say "'[one of]What, are we an item now? Get your own friends, weirdo[or]Do you mind?! I didn't ask you to follow me around, you know[or]Give me some privacy[in random order].'";
	otherwise:
		say "'[one of]Erm, would you mind giving me some privacy please?'[or]Are we travelling companions now? I was kind of planning to explore ahead on my own.'[or]I'm going to go on alone from here, I hope that's okay. See you later!'[in random order]".

To decide which number is the dismissalResistance of (M - a monster):
	let D be the difficulty of M;
	decrease D by a random number between 1 and 5;
	decrease D by (the favour of M - the aggro limit of M) / 3;
	if D < 1, now D is 1;
	decide on the square root of D - 1.

To compute friendly dismissal of (M - a monster):
	if the dismissRefused of M >= dismissalConvincingPower + 1:
		say DismissalResponseRefused of M;
	otherwise:
		let DCP be dismissalConvincingPower + the charisma of the player;
		let DR be the dismissalResistance of M;
		if debuginfo > 0, say "[input-style]Dismissal check: good excuse rating ([dismissalConvincingPower]) [if dismissalConvincingPower >= 100](Automatic success)[otherwise]+ charisma rating ([charisma of the player]) = [DCP] | ([DR - 1].5) NPC dismissal resistance[end if][roman type][line break]";
		if DCP >= DR or dismissalConvincingPower >= 100:
			bore M;
			if dismissalConvincingPower is 0, FavourDown M; [There was no good reason]
		say DismissalResponse of M;
		if M is not interested:
			if dismissalConvincingPower > 0, check motion of M; [They head off and they don't move again this turn]
			otherwise say "[BigNameDesc of M] stops following you around.";
		otherwise:
			now the dismissRefused of M is dismissalConvincingPower + 1;
			now the friendly boredom of M is 0.

To say DismissalResponse of (M - a monster):
	if the player is able to speak:
		if the class of the player is princess:
			say DismissalResponseRoyal of M;
		otherwise if the class of the player is vixen:
			say DismissalResponseVixen of M;
		otherwise if the player is in danger:
			say DismissalResponseCombat of M;
		otherwise if the player is thinking of relieving themselves:
			say DismissalResponseToilet of M;
		otherwise if the player is bursting or the player is feeling full or the total squirtable fill of belly > 0:
			say DismissalResponseBursting of M;
		otherwise if the player is very horny and the player is able to automatically masturbate:
			say DismissalResponseHorny of M;
		otherwise if the friendly boredom of M > 10:
			say DismissalResponseStalker of M;
		otherwise:
			say DismissalResponseDefault of M;
	otherwise:
		say DismissalResponseDefault of M.

To say DismissalResponseRefused of (M - a monster):
	say "[speech style of M]I've already said no.'[roman type][line break]".

To say DismissalResponseRoyal of (M - a monster):
	say DismissalResponseDefault of M.

To say DismissalResponseVixen of (M - a monster):
	say "[speech style of M]'[if M is interested]Hmph. I'm not falling for that one.'[otherwise]What? Where?!'[end if][roman type][line break]".

To say DismissalResponseToilet of (M - a monster):
	if diaper quest is 0, say "[speech style of M]'[if M is interested]Come on, just hold it in for a couple more minutes.'[otherwise]Oh. Um, I'll see you later then.'[end if][roman type][line break]";
	otherwise say "[speech style of M]'[if the diaper-duration of M > 0]Now now, we wouldn't be thinking of trying to use a grown-up potty, would we? You're to stay in diapers until you can prove you can stay dry, so if you really can't hold it, you'll just have to have an accident like a real baby.'[otherwise if M is not interested]Oh sorry, I didn't realise. Well done for making it in time!'[otherwise if the player is feeling submissive]Permission denied. Prove to me you can hold it in. If you really are a big [boy of the player], that is...'[otherwise]Pfft. Come on, surely you can hold it in for at least a couple more minutes? Unless you're just a big baby in disguise?'[end if][roman type][line break]".

To say DismissalResponseBursting of (M - a monster):
	if diaper messing >= 3 and (the player is feeling full or the total squirtable fill of belly > 0):
		say "[speech style of M]'[if M is interested]I don't believe it. Surely you would never do something as disgraceful as that right in front of me. You've got to be kidding.'[otherwise]Wait, seriously?! Fuck, I'm out of here!'[end if][roman type][line break]";
	otherwise if the player is bursting:
		if the diaper addiction of the player > 14, say "[speech style of M]'[if M is interested and there is a worn diaper]I would respect you more if you could hold it in. But I'm not leaving you alone, no.'[otherwise if M is interested]I think the question is, do you want to face the consequences?'[otherwise]Ugh! No, I think not.'[end if][roman type][line break]";
		otherwise say "[speech style of M]'[if diaper quest is 1 and M is interested]No, no, no! You hold it or you disgrace yourself. Up to you, [honey of M].[otherwise if M is interested]Privacy? No, I don't want to miss watching a silly [boy of the player] pissing [himself of the player] in front of me, that sounds hilarious!'[otherwise if there is a worn diaper]Hmm, well at least you're safely padded, I guess. See you in a bit.'[otherwise]I assume you know where the toilets are. See you later.'[end if][roman type][line break]";
	otherwise:
		if the player is a nympho, say "[speech style of M]'[if M is interested and there is a worn diaper]I would respect you more if you could hold it in. But I'm not leaving you alone, no.'[otherwise if M is interested]I think the question is, why can't you hold it in until I'm ready to leave you be?'[otherwise]Oh. No thank you. Nope.'[end if][roman type][line break]";
		otherwise say "[speech style of M]'[if M is interested and diaper lover > 0]Really? Only the biggest baby would really lose hold of their enema while in polite company!'[otherwise if M is interested]If you expel the contents of your belly in front of me, there will be consequences, young [man of the player].'[otherwise]Oh. I have no desire to see that right now, thank you very much.'[end if][roman type][line break]".

To say DismissalResponseCombat of (M - a monster):
	if the player is a nympho or M is prone:
		say "[speech style of M]'[if M is interested]A good-for-nothing slut like you doesn't need privacy to do something like that, I'm sure[otherwise]Ugh. No, I guess I don't[end if].'[roman type][line break]";
	otherwise:
		say "[speech style of M]'Hmm. [if M is interested]I think I'll stay and watch[otherwise]Best of luck, then[end if].'[roman type][line break]".

To say DismissalResponseHorny of (M - a monster):
	if the player is a nympho:
		say "[speech style of M]'[if M is interested]A good-for-nothing slut like you doesn't need privacy to do something like that, I'm sure[otherwise]Ugh. No, I guess I don't[end if].'[roman type][line break]";
	otherwise if the player is feeling submissive:
		say "[speech style of M]'[if M is interested]If you are going to do such a naughty thing, you'll have to do it while I watch[otherwise]Hmm, I'm feeling kind right now. Enjoy yourself[end if].'[roman type][line break]";
	otherwise:
		say "[speech style of M]'Hmm. [if M is interested]No, I don't think so[otherwise]Until next time, then[end if].'[roman type][line break]".

To say DismissalResponseStalker of (M - a monster):
	say "[speech style of M]'[if M is interested][one of]What can I say, it's fun to watch your adventure[or]I'm enjoying this, I think I'll stay for a while longer[in random order][otherwise][one of]Fine, I can take a hint[or]Don't flatter yourself. Obviously I don't want to hang out with you either[in random order][end if].'[roman type][line break]".

To say DismissalResponseDefault of (M - a monster):
	if the player is feeling submissive:
		say "[speech style of M]'Hmm. [if M is interested]No, I don't think so[otherwise]If you must[end if].'[roman type][line break]";
	otherwise if the player is a nympho and diaper quest is 0:
		say "[speech style of M]'[if M is interested]What? No[otherwise]Eww. Fine[end if].'[roman type][line break]";
	otherwise if the player is feeling dominant and M is not buddy:
		say "[speech style of M]'How rude. [if M is interested]You know what, I'm going to follow you around for even longer now[otherwise]And here I thought we were having a good time. I'll go then[end if].'[roman type][line break]";
	otherwise:
		say "[speech style of M]'[if M is interested]Huh? No, we're having fun, aren't we?'[otherwise if M is buddy]Oh, you don't like hanging out with me? I thought we were friends. I guess not.'[otherwise]What are you trying to imply? I'm not following you around.'[end if][roman type][line break]".

To compute unfriendly dismissal of (M - a monster):
	say "[BigNameDesc of M] [if M is penetrating a body part or M is grabbing the player]just chuckles[otherwise]ignores you[end if].".

To say DefeatedDismissal of (M - a monster):
	say "'Leave me be, now.'".

Chapter - Fluff Questions

Definition: a monster is fluff-question-appropriate:
	if it is undefeated and it is intelligent and it is interested and it is friendly, decide yes;
	decide no. [Can they be asked fluff questions?]

talk-mute-question is a talk-object.

To consider (T - talk-mute-question) for (M - a monster):
	if M is unintelligent:
		now the printed name of T is the substituted form of "[MuteQuestion of M]";
		set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-mute-question) for (M - a monster):
	if the printed name of T matches the text "morality", say SexDollExplanation of M;
	otherwise say MuteResponse of M.

To say MuteQuestion of (M - a monster):
	say "'Are you [if the bimbo of the player < 10]sentient[otherwise]aware of what's going on and stuff[end if]?'".

To say MuteResponse of (M - a monster):
	say "The response comes telepathically.[line break][speech style of M]'Yes I am sentient. Yes I am of sexual [maturity] for my species. No more questions.'[roman type][line break]".

To say SexDollQuestion of (M - a monster):
	say "'So, should I be worried about the morality of engaging in sex with this thing?'".

To say SexDollExplanation of (M - a monster):
	say "The response comes telepathically from the Nintendolls, directly into your head.[line break][second custom style]'It's simply an animated object, controlled via magic. Just consider it like you would a very high-tech sex doll.'[roman type][line break]".

talk-where-question is a talk-object.

Definition: a monster is where-question-appropriate:
	if it is fluff-question-appropriate, decide yes;
	decide no.

To consider (T - talk-where-question) for (M - a monster):
	if M is where-question-appropriate:
		now the printed name of T is the substituted form of "[WhereQuestion of M]";
		set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-where-question) for (M - a monster):
	say WhereAnswer of M.

To say WhereQuestion of (M - a monster):
	say "'[if the class of the player is santa's little helper]Hmm, this isn't Lapland. [end if]Where [one of]are we?'[or]am I?'[at random]".
To say WhereAnswer of (M - a monster):
	say "[speech style of M]'We're here. Obviously.'[roman type][line break]".

talk-who-question is a talk-object.

Definition: a monster is who-question-appropriate:
	if it is fluff-question-appropriate, decide yes;
	decide no.

To consider (T - talk-who-question) for (M - a monster):
	if M is who-question-appropriate:
		now the printed name of T is the substituted form of "[WhoQuestion of M]";
		set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-who-question) for (M - a monster):
	say WhoAnswer of M.

To say WhoQuestion of (M - a monster):
	if the bimbo of the player < 11:
		say "'Who are you?'";
	otherwise:
		say "'Got a name, [if M is male]big boy?'[otherwise]sexy?'[end if]".

To say WhoAnswer of (M - a monster):
	say "[speech style of M]'Why, I'm Generic the npc!'[roman type][line break]".

talk-story-question is a talk-object.

Definition: a monster is story-question-appropriate:
	if it is fluff-question-appropriate, decide yes;
	decide no.

To consider (T - talk-story-question) for (M - a monster):
	if M is story-question-appropriate:
		now the printed name of T is the substituted form of "[StoryQuestion of M]";
		set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-story-question) for (M - a monster):
	say StoryAnswer of M.

To say StoryQuestion of (M - a monster):
	if the class of the player is santa's little helper:
		say "'How did you come to be here this Christmas?'";
	otherwise:
		say "'What's your story?'".

To say StoryAnswer of (M - a monster):
	say "[speech style of M]'Trapquest.'[roman type][line break]".

talk-escape-question is a talk-object.

Definition: a monster is escape-question-appropriate:
	if it is fluff-question-appropriate, decide yes;
	decide no.

To consider (T - talk-escape-question) for (M - a monster):
	if M is escape-question-appropriate:
		now the printed name of T is the substituted form of "[EscapeQuestion of M]";
		set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-escape-question) for (M - a monster):
	say EscapeAnswer of M.

To say EscapeQuestion of (M - a monster):
	if the class of the player is santa's little helper:
		say "'I need to get back to Santa's grotto. Any ideas?'";
	otherwise:
		say "'How do I get out of here safely?'".

To say EscapeAnswer of (M - a monster):
	say "[speech style of M]'Close the window.'[roman type][line break]".

talk-advice-question is a talk-object.

Definition: a monster is advice-question-appropriate:
	if it is fluff-question-appropriate, decide yes;
	decide no.

To consider (T - talk-advice-question) for (M - a monster):
	if M is advice-question-appropriate:
		now the printed name of T is the substituted form of "[AdviceQuestion of M]";
		set next numerical response to the substituted form of "[printed name of T]".

To execute (T - talk-advice-question) for (M - a monster):
	say AdviceAnswer of M.

[This should make it easier to add more classes to this function in the future.]
To say AdviceQuestion of (M - a monster):
	if the class of the player is santa's little helper:
		say "'Any advice for [if the bimbo of the player > 6]a naughty[otherwise]an innocent[end if] little helper?'";
	otherwise if the class of the player is princess:
		say "'Any advice for an adventurous princess?'";
	otherwise if the class of the player is maid:
		say "'Any advice for a cunning maid?'";
	otherwise if the bimbo of the player > 13:
		say "'Any advice for a lonely girl?'";
	otherwise if the intelligence of the player > 10:
		say "'Any advice for an intrepid adventurer?'";
	otherwise:
		say "'Any advice for a brave explorer?'".

To say AdviceAnswer of (M - a monster):
	if watersports fetish is 1:
		say "[speech style of M]'Don't eat yellow snow. Unless you get off on it or something.'[roman type][line break]";
	otherwise:
		say "[speech style of M]'Don't eat yellow snow.'[roman type][line break]".

Conversation ends here.
