VAR mood = 0
VAR maxMood = 0
VAR studied = false
VAR empName = ""
VAR body = 0
VAR mind = 0
VAR heart = 0
VAR employeePresent = false
VAR peek = false
VAR bodyStrength = 0
VAR mindStrength = 0

-> main 

=== main ===
PEEKING #mortem:peekcheck:0 #mortem:entry:0
{
    - employeePresent != true: No one was assigned to Peeking today.
    If no one can be present to not see it, it has no purpose. #mortem:moodupdate:-1
    -> END
}
<>{empName} tentatively enters the containment unit. #mortem:spriteupdate:0
{
    - mood < (maxMood * 0.4): The glint of Peeking's fangs seem to reflect off of {empName}'s eyes. Its bloodlust is palpable.
    - peek: Out the corner of their eye, they spy the slightest blur of movement. They do their best to ignore it.
    - else: The unaware could be convinced that this containment chamber is empty. {empName} knows better than this.
}
How will they proceed?
+ [Check] -> Check
+ [Work] -> Work

=== Check ===
What should be checked?
+ [Peeking] -> CheckMortem
+ [The chamber] -> CheckUnit

=== CheckMortem ===
{
    - mood < (maxMood * 0.4): <>Peeking is more visible than it's ever been today, clearly starved of attention. {empName} feels a sense of imminent doom. #employee:scare:0
    - peek: <>Peeking seems to be tempted {empName}'s curiousity, giving them just the slightest glimpse of its figure. Approaching would be unwise. #employee:scare:0
    - else: <>Peeking is remaining completely hidden today. Curiousity untempted, your employee seems relatively safe.
}
-> Return

=== CheckUnit ===
The unit looks fine.
-> Return

=== Return ===
How will they proceed?
+ [Check] -> Check
+ [Work] -> Work


=== Work ===
Which type of work should {empName} perform?
+ [Maintenance] -> Maintenance
+ [Understanding] -> Understanding
+ [Empathy] -> Empathy
* {heart <= 35} [Ignore] -> Ignore


=== Maintenance ===
{
    - mood < (maxMood * 0.4): <>Normally, Peeking would not be ravenous enough to attack the employee while they're only conducting maintenance. 
    However, starved of inattention, even the slightest glance back is enough for Peeking to strike. #employee:scare:0
    -> Death
    - peek: <>Peeking does their best to gain {empName}'s curiousity, making it seem as though they are right behind them.
    {empName} does their best to focus on the task at hand, cleaning the many scratches and leftover fur from the unit.
    Still, Peeking's apparent omnipresence just out of view takes a mental toll. #mortem:research:10 #employee:mentdamage:25 #mortem:moodupdate:-0.5 #employee:addbody:5
    ~ mind -= 25
    -> check_conditions ->
    - else: <>{empName} ensures that Peeking's rock and the rest of the chamber are in pristine condition.
    Peeking behaves themselves well today, doing very little to tempt the employee to peer around the other side of the rock.
    Although its presence can be felt, it only acts as a minor stressor. #mortem:research:5 #employee:mentdamage:5 #employee:addbody:5
    ~ mind -= 5
    -> check_conditions ->
}
-> END

=== Understanding ===
{
    - mood < (maxMood * 0.4): <>The employee barely has a chance to conduct their research before Peeking seizes upon their curiousity. #employee:scare:0 
    -> Death
    - peek: <>{empName} voluntarily uses this time to investigate the nature and living of Peeking.
    Foolishly, they stray far to close to the rock, all too consumed by fervant curiousity.
    To discover the full form of Peeking is to discover oblivion.
    -> Death
    - else: <>Devoid of Peeking's omnipresent eyes, {empName} is free to conduct a full analysis of Peeking and their chamber.
    It is impossible to discern Peeking's full form without straying too close to the backside of the rock.
    Even so, the scraps it leaves behind and the claw marks it has left about its environment tell {empName} more than enough.
    It is unlikely Peeking will always be this kind to such wanton curiousity. #mortem:research:65 #mortem:moodupdate:-1 #employee:addmindres:0.45
}
-> END

=== Empathy ===
{
    - mood < (maxMood * 0.4): <>Beads of saliva have pooled on the floor nearby Peeking's rock, the Mortem clearly ready to pounce at a moment's notice.
    Aware of this but still trying to abade the creature, {empName} feigns interest, keeping at just a large enough distance to remain safe.
    Peeking still attempts to claw at them, drawing a not-insignificant amount of blood. #employee:physdamage:30
        ~ body -= 30
        -> check_conditions ->
    It seems to have satiated Peeking's need to punish curiousity. #mortem:moodupdate:2 #mortem:research:15 #employee:addbody:2 #employee:adjustheart:-10
    - peek: <>Remaining careful, {empName} strays closer to the rock than normal, feigning a desire to see Peeking in their full form.
    Eyes brimming with bloodlust, Peeking meets this false curiousity with fang and claw, only for the employee to remain barely out of reach.
    The game of nondiscovery seems to be one that Peeking enjoys. The same cannot be said of the employee. #employee:mentdamage:15 #mortem:moodupdate:1.5 #mortem:research:10 #employee:adjustheart:-5
    ~ body -= 15
    -> check_conditions ->
    - else: <>{empName} strays close enough to Peeking's rock to tempt it out, faking an interest in straying even further.
    Peeking does not emerge. It lies in wait, tempting the employee to stray even closer to gain a response.
    {
        - heart >= 65: Feeling almost bad for the creature, {empName} steps just a bit closer.
        This turns out to be a painful mistake, as an errant claw swipe winds up leaving a huge gash on {empName}'s arm. #employee:physdamage:30
        ~ body -= 30
        -> check_conditions ->
        A coarse laugh can be heard from behind the rock. #mortem:moodupdate:1 #employee:addbody:1
        - else: The employee does not oblige. #mortem:moodupdate:0.5
    }
}
-> END

=== Ignore ===
{
    -studied: 
        -> ResearchEvent
    - mood < (maxMood * 0.4): <>The employee correctly determines that no productive work can occur in Peeking's chamber while they are in this state. #mortem:ignore:0
    They walk directly out of the chamber, making sure that Peeking is able to see them do this.
    Closing the door behind them, they can hear Peeking fruitlessly claw as it, frustrated at the lack of any foolhardy curiousity.
    Eventually, it tuckers itself out.
    It will likely be better behaved next time it is worked on. #mortem:moodupdate:5
    - peek: <>The shining eyes of Peeking, peering around the edge of its rock, bode poorly.
    The employee leaves, deciding to work on Peeking another time. #mortem:ignore:0
    Seeing that it was far too blatant in its bait, Peeking reconsiders their strategy. #mortem:moodupdate:1.5
    - else: <>The employee, believing that no good can come of a Mortem that massacres those who dare to investigate it, leaves.
    In its dormant state however, this only seems to aggravate Peeking even more. #mortem:moodupdate:-1.5
}
-> END


=== ResearchEvent ===
<>The employee turns around to leave the chamber and avoid tempting Peeking, a voice growls from behind them. #mortem:ignore:0
"WAIT."
Peeking has never spoken up to this point, but has chosen now to try and pull the employee in one more time.
"YOU. STUDY ME. YES?"
"YOU WANT. KNOW ME. SEE ME."
"WHY LEAVE?"
Facing away from the chamber, the employee has a chance to respond.
+ ["Because I am afraid of you."] -> ResearchAfraid
+ ["Because I'm not stupid enough to come any closer."] -> ResearchStupid
+ ["I don't know."] -> ResearchKnow
+ ["..."] -> ResearchSilent


=== ResearchAfraid ===
"HOW. YOU AFRAID?"
"ONLY HEAR ME."
"NEVER SEE ME."
{empName} can hear Peeking's rock shift mightily. The voice seems to be coming closer.
+ ["I've heard what you've done to other people."] -> ResearchOther
+ ["You only want to devour me."] -> ResearchDevour
+ [Turn around] -> ResearchTurn

=== ResearchOther ===
"THEY LIE."
"ONLY. ONE WAY. TO KNOW. FOR YOURSELF."
The voice is right behind them now. {empName} can feel the breath of something massive on their neck.
+ [TURN AROUND] -> ResearchTurn
+ [TURN AROUND] -> ResearchTurn
+ [TURN AROUND] -> ResearchTurn
+ ["..."] -> ResearchScaredSilent

=== ResearchDevour ===
"WON'T. DEVOUR YOU."
"WANT TO. FINALLY BE SEEN."
The voice is right behind them now. {empName} can feel the breath of something massive on their neck.
+ [TURN AROUND] -> ResearchTurn
+ [TURN AROUND] -> ResearchTurn
+ [TURN AROUND] -> ResearchTurn
+ ["..."] -> ResearchScaredSilent

=== ResearchTurn ===
{empName} turns to see what is approaching behind them-
"YOU LOOKED."
They barely get a chance to see Peeking's full form before it strikes.
-> Death

=== ResearchScaredSilent ===
{empName} knows full and well that if they turn around or say another word, they're dead.
Peeking looms behind them a moment more, then stomps off angerly.
"YOU FIND OUT. EVERYTHING ON US."
"ON MORTEMS."
"BUT NEVER ME."
"I HOPE. IT HURTS."
{empName} manages to leave with their life intact.
They are content with having one piece of information be forever missing.
A greater understanding of Peeking has been acquired. #mortem:realize:0
-> END


=== ResearchStupid ===
"NOT YOU."
"YOU. VERY SMART."
"WANT GET. SMARTER?"
{empName} can hear Peeking's rock shift mightily. The voice seems to be coming closer.
+ ["Always."] -> ResearchAlways
+ ["Not really."] -> ResearchReally
+ [Turn around] -> ResearchTurn

=== ResearchAlways ===
"THEN. HERE I AM."
{empName} can hear Peeking's massive footsteps getting closer by the second. They can feel its breath on their neck.
"ALL. YOU HAVE. TO DO."
IS LOOK.
{empName}'s legs refuse to move.
+ [TURN AROUND] -> ResearchTurn
+ [TURN AROUND] -> ResearchTurn
+ [TURN AROUND] -> ResearchTurn
+ ["..."] -> ResearchScaredSilent

=== ResearchReally ===
Peeking's footsteps cease momentarily, confused by such a response.
"WHY. HERE THEN?"
After a moment, {empName} gives their actual reasonings for working here.
YOU fearfully tune out the reminder of humanity.
When {empName} has finished giving their empassioned response, Peeking seems to shirk back behind its rock.
"I. SEE."
"NO POINT. IN TEMPTING."
"BUT. SOMEONE WILL COME."
"SOMEONE. ALWAYS DOES."
{empName} goes back to being a mindless drone, and Peeking goes back to baiting others in with offers of forbidden knowledge.
A greater understanding of Peeking has been acquired. #mortem:realize:0
-> END


=== ResearchKnow ===
"YOU DON'T?"
"THEN. COME BACK."
"I WANT. SEE YOU."
{empName} can hear Peeking's tree shift mightily. The voice seems to be coming closer.
+ ["You'll kill me if I do."] -> ResearchKillMe
+ ["I don't want to see you."] -> ResearchSee
+ [Turn around] -> ResearchTurn

=== ResearchKillMe ===
"PROMISE. I WON'T"
"IT. SO LONELY. IN HERE."
"JUST WANT. TO BE SEEN."
The voice is right behind them now. {empName} can feel the breath of something massive on their neck.
+ [TURN AROUND] -> ResearchTurn
+ [TURN AROUND] -> ResearchTurn
+ [TURN AROUND] -> ResearchTurn
+ ["..."] -> ResearchScaredSilent

=== ResearchSee ===
"WHY NOT?"
"I. SEE YOU."
"ONLY. FAIR."
The voice is right behind them now. {empName} can feel the breath of something massive on their neck.
+ [TURN AROUND] -> ResearchTurn
+ [TURN AROUND] -> ResearchTurn
+ [TURN AROUND] -> ResearchTurn
+ ["..."] -> ResearchScaredSilent

=== ResearchSilent ===
{empName} doesn't give any sort of response, acting as if they heard nothing.
Peeking still tries to garner a response.
"YOU. HEAR ME."
"NEVER. HEAR ME. BEFORE."
"NOW. WHY LEAVE?"
+ ["Because I am afraid of you."] -> ResearchAfraid
+ ["Because I'm not stupid enough to come any closer."] -> ResearchStupid
+ ["I don't know."] -> ResearchKnow
+ ["..."] -> ResearchSilent2

=== ResearchSilent2 ===
{empName}'s continued silence only enrages Peeking even more.
There's a sudden rush of footsteps, to the point where the employee can feel Peeking breathing down their neck.
"YOU. HEAR!"
"DON'T LEAVE ME!"
"STAY HERE!"
Peeking's voice breaks in desperation.
+ [Turn around] -> ResearchTurn
+ [Remain silent] -> ResearchScaredSilent

=== Death ===
{empName}'s mangled corpse is swiftly dragged behind the rock, never to be seen again. #game:kill:0 #mortem:moodupdate:5 #mortem:kill:0
-> END

=== MentalDeath ===
Suddenly, in a moment of stress and panic, {empName} can't resist the urge any longer.
They take a full look around the rock, desperate to finally know what they've been working with all this time.
One look is all it takes to seal their fate.
-> Death

=== check_conditions ===
{
    - body <= 0:
        -> Death
    - mind <= 15:
        -> MentalDeath
}
    
->->