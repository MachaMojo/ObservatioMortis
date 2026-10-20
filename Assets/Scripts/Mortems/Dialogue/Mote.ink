VAR mood = 0
VAR maxMood = 0
VAR studied = false
VAR empPhysHealth = 0
VAR empMentHealth = 0
VAR employeePresent = false
VAR clean = 0

-> main 

=== main ===
"MOTE" #mortem:entry:0
{
    - employeePresent != true: No one was assigned to Mote today. #mortem:moodupdate:-1
    {
        - mood < (maxMood * 0.4): Mote seems to be getting a bit lonely. #mortem:soil:1.5
        - else: Mote is perfectly fine with this. They know someone will come see them tomorrow. #mortem:soil:1.5
    }
    {
        - clean == 0: -> BadConditions ->
    }
    -> END
}
<>Your employee enters the containment unit. #mortem:moodupdate:0.5 #mortem:spriteupdate:0 
{
    - mood < (maxMood * 0.4): Mote seems a little bit down, but bounds up to the employee regardless.
    "Finally! Someone in Mote's chamber!"
    "It was getting kinda lonely..."
    - else: Mote hops up to the employee, barely taller than the employee's knee.
    "Yay! Another employee!"
    "Mote is so excited to play with you!"
}
{
    - clean == 0: -> BadConditions ->
}
How will you proceed?
+ [Check] -> Check
+ [Work] -> Work

=== Check ===
What would you like to check?
+ [Mote] -> CheckMortem
+ [The chamber] -> CheckUnit

=== CheckMortem ===
{
    - mood < (maxMood * 0.4): <>Mote's smile is as bright as ever, but they're clearly a bit starved for some proper playtime.
    - else: <>Mote seems ecstatic for the employee to begin their work. They can hardly contain their fuzzy self.
}
-> Return

=== CheckUnit ===
{
    - clean == 0: <>The unit is covered in Mote's dust, to the point of almost being hard to breathe.
    It could use a good cleaning.
    - else: <>The unit seems fine. There's a layer of dust coating every surface, but it can't be helped in Mote's presence.
}
-> Return

=== Return ===
How will you proceed?
+ [Check] -> Check
+ [Work] -> Work


=== Work ===
Which type of work would you like to perform?
+ [Maintenance] -> Maintenance
+ [Understanding] -> Understanding
+ [Empathy] -> Empathy

=== Maintenance ===
{
    - mood < (maxMood * 0.4): <>Mote seems to be shedding a bit more than normal.
    The employee cleans up the chamber regardless, with Mote seeming extra eager to follow behind them.
    It almost seems to be trying to help with the process.
    Is it out of kindness? Or shame? #mortem:research:8 #mortem:clean:0
    - else: <>The employee cleans Mote's dusty chamber from top to bottom.
    Mote doesn't leave the employee's side for a moment, constantly attempting to ask about the employee's life.
    It's impossible for them to resist divulging as they work. #mortem:research:5 #mortem:clean:0
}
-> Conclusion

=== Understanding ===
{
    - mood < (maxMood * 0.4): <>"Wha?"
    "You're here just to do more research?"
    "T-that's ok! Mote will help how Mote can!"
    Mote clearly seems disappointed, and only halfhearted helps the employee in their research.
    Not much gets done. #mortem:research:10 #mortem:moodupdate:-1 #mortem:soil:1.5
    - else: <>"Research on Mote?"
    "Silly human! Mote already told you everything about Mote!"
    "But Mote can always tell you more!"
    Conversing with Mote allowed the employee to figure out a few of the finer details regarding them. #mortem:research:40 #mortem:moodupdate:-0.3 #mortem:soil:1
}
-> Conclusion

=== Empathy ===
{
    - mood < (maxMood * 0.4): <>Even by just offering to play with Mote, their spirits lift drastically. #mortem:moodupdate:5
    "Yay! Yippee! Play with Mote!"
    "Mote's been waiting for so long to play again!"
    Of all the ways to spend a workday, playing with an excited Mote is perhaps one of the best.
    The employee's mood lifts almost as much as Mote's does. #employee:mentdamage:-30 #mortem:soil:1
    - else: <>Mote beams with excitement at the proposal to play. #mortem:moodupdate:5
    "Mote tells Augustus to find out all he can..."
    "...but playing with Mote is just as good!"
    The play session lifts the moods of both Mote and the employee. #employee:mentdamage:-15 #mortem:soil:1
}
-> Conclusion 


=== ResearchEvent ===
"Wait! Before you go today!"
Mote bounds inbetween the employee and the door, their fuzzy body blocking their path.
"Mote should tell Augustus something!"
"...And you too, employee!"
"Sometimes, when you get to know a Mortem well enough,"
"They might break the normal flow of research and do something totally different!"
"These times are the BEST! They show who a Mortem really is deep inside!"
"Mote calls them Heart Bearings! They're really important for finding out EVERYTHING about a Mortem!"
"Be on the lookout for moments like that!"
+ ["Thank you Mote!"] -> ResearchThank
+ ["How can I get these moments to occur?"] -> ResearchHow
+ ["What happens in one of these moments?"] -> ResearchWhat
+ ["So is this your Heart Bearing?"] -> ResearchBear


=== ResearchThank ===
"It's all Mote's pleasure!"
"Mote wants to do all Mote can to help!"
Mote moves aside to let the employee out, giving them a nuzzle goodbye as they do. #employee:mentdamage:-15 #mortem:moodupdate:1 #mortem:realize:0 #mortem:soil:1
-> END

=== ResearchHow ===
"Once a Mortem has been researched enough and gotten used to the employees,"
"If you do something that specifically draws that Mortem's attention, it'll have its Heart Bearing!"
"It can come from something as simple as entering the unit, or doing something specific to that Mortem."
"Some might be really tough to figure out how to bear their heart, even when you feel like you know everything about them."
"Not Mote though! Mote will always bear Mote's heart for you, Augustus!"
"...and you too, person in my chamber!"
"Anything else you wanna ask?"
+ ["Thank you Mote!"] -> ResearchThank
+ ["What happens in one of these moments?"] -> ResearchWhat
+ ["So is this your Heart Bearing?"] -> ResearchBear

=== ResearchWhat ===
"It depends on the Mortem!"
"Some Mortems will just act a little differently than normal,"
"But others will do something totally new to communicate!"
"A few might even talk for the only time!"
"That said..."
"There are some Mortems that might get really dangerous during their Heart Bearing."
"Just be careful, OK?"
"Anything else you wanna ask?"
+ ["Thank you Mote!"] -> ResearchThank
+ ["How can I get these moments to occur?"] -> ResearchHow
+ ["So is this your Heart Bearing?"] -> ResearchBear


=== ResearchBear ===
Mote tilts their head, trying to think of a proper answer.
"Kinda?"
"Mote guesses that this isn't usually what happens in Mote's chamber..."
"But Mote always has Mote's heart beared!"
"Is there something Mote hasn't told you?"
+ ["Where did you really come from?"] -> ResearchCome
+ ["Who died to make you?"] -> ResearchDied
+ ["What do you know of the Beast of Blasphemy?"] -> ResearchBeast
+ ["I suppose not."] -> ResearchSuppose


=== ResearchCome ===
Mote seems to shift nervously. Their voice breaks just a little as they respond.
"L-like Mote said before, Mote doesn't know!"
"One day Mote wasn't real, and the next Mote was in this unit!"
"Mote doesn't understand it either... B-but Mote is happy to be alive!"
Of all strange phenomenon to come of the Beast of Blasphemy's death, spontaneous generation wasn't one of them.
Still, Mote seems insistent.
+ [Leave the topic] -> ResearchLeave
+ [Press further] -> ResearchPress

=== ResearchDied ===
Mote seems to shift nervously. Their voice breaks just a little as they respond.
"N-no Mortem knows who made them!"
"We don't get to know what formed us or made us the way that we are."
"That's why Mote wants to help so much! Mote wants to find out what made Mote!"
Every Mortem has a subconscious belief that moulds their form, so Mote said back when they were first encountered.
However, what possible belief could have made Mote?
Still, Mote seems insistent.
+ [Leave the topic] -> ResearchLeave
+ [Press further] -> ResearchPress

=== ResearchBeast ===
Mote seems to shift nervously. Their voice breaks just a little as they respond.
"M-Mote doesn't know anything about it! Mote wasn't even real when it appeared!"
"But Mote heard a lot about it, and it sounds very scary..."
"Mote wants to know all Mote can about it! That way, we can make it so that it will never ever come back!
"S-sorry Mote can't give any other help on that..."
Mote seems to know everything regarding Mortems as a whole.
However, it is odd that the origin of Mortems acts as a notable lapse in their knowledge.
Still, Mote seems insistent.
+ [Leave the topic] -> ResearchLeave
+ [Press further] -> ResearchPress

=== ResearchSuppose ===
Mote beams with pride at the employee's response.
"Yay! Mote is happy you can trust Mote!"
"Mote hopes you'll bear lots of other Mortem hearts!"
Mote moves aside to let the employee out, giving them a nuzzle goodbye as they do. #employee:mentdamage:-15 #mortem:moodupdate:1 #mortem:realize:0 #mortem:soil:1
-> END

=== ResearchLeave ===
The employee apologizes to Mortem for the inquiry. Mote perks back up, eager to reassure them.
"Don't worry! Mote will help all Mote can!"
"And when Mote learns something, Mote will make sure you learn it too!"
Mote moves aside to let the employee out, giving them a somewhat timid nuzzle goodbye as they do. #employee:mentdamage:-8 #mortem:moodupdate:0.5 #mortem:realize:0 #mortem:soil:2
-> END

=== ResearchPress ===
The employee refuses to let the topic go, attempting to press the matter further.
Suddenly, Mote seems to curl up on the floor, quivering slightly. #mortem:moodupdate:-5 #mortem:soil:4
"M-Mote is just trying to help... Please don't hurt Mote..."
There was no inclination that any harm would come to Mote.
Regardless, upon the employee continuing their query, Mote only gave the same batch of responses.
"Don't hurt Mote... Mote just wants to help..."
Realizing that nothing can be gained from Mote in a state like this, the employee leaves the chamber.
For once, Mote does not nuzzle them goodbye.
-> END


=== Conclusion ===
{
    -studied: 
        -> ResearchEvent
}

Before the employee can leave, Mote bounds up to them one last time.
"Mote had so much fun today! Mote hopes you did too!"
As Mote nuzzles them goodbye, the employee takes solace in the fact that out of every monstrosity in the Observatio, they got to work with Mote. #employee:mentdamage:-15 #mortem:moodupdate:1
-> END

=== BadConditions ===
Mote's chamber has reached its limit on how much dust it can accumulate.
It looks like it's starting to affect Mote. #mortem:moodupdate:-1
->->