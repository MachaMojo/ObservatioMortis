VAR mood = 0
VAR maxMood = 0
VAR copies = 0
VAR studied = false
VAR body = 0
VAR mind = 0
VAR heart = 0
VAR empName = ""
VAR employeePresent = false

-> main 

=== main ===
MITOSIS RABBIT #mortem:entry:0
{
    - employeePresent != true: No one was assigned to Mitosis Rabbit today.
    It mills about its containment unit, unable to engage in the life it so desperately wants. #mortem:moodupdate:-0.5
    -> Conclusion
}

<>{empName} enters the containment unit.
Mitosis Rabbit looks up at them expectantly. It's impossible to tell whether it's out of affection or out of hunger.
How will they proceed?
+ [Check] -> Check
+ [Work] -> Work

=== Check ===
What should be checked?
+ [Mitosis Rabbit] -> CheckMortem
+ [The chamber] -> CheckUnit

=== CheckMortem ===
{
    - copies == 1: <>The two Mitosis Rabbits seem to be moving just barely off-sync. They seem to be feeling well.
    - copies == 2: <>The four Mitosis Rabbits glide throughout the chamber, almost in perfect unison. They seem to be feeling well.
    - copies == 3: <>The chamber is beginning to feel crowded due to the number of Mitosis Rabbits. Despite this, they seem to be feeling well.
    - copies == 4: <>The chamber is nearly overflowing with Mitosis Rabbits, all of which are keeping their eyes trained on the employee. There's an eerie stillness in the air. #employee:scare:0
    - mood >= (maxMood * 0.4): <>{~Mitosis Rabbit's surface glistens in the light.|Mitosis Rabbit is "hopping" about its containment unit.} It seems to be feeling well.
    - else: <>{~They're hunched over, looking up at the employee with a slight hunger in its eyes.|Mitosis Rabbit's "ears" are pressed tightly to its back, its stature shrewd.} It seems unwell.
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
+ [Cull Numbers] -> Cull

=== Maintenance ===
{
    - copies == 4: <>{empName} barely has time to react before the hoard of Mitosis Rabbits all surge at once. #employee:scare:0
        -> Death
    - copies == 0: 
    {
        - mood < (maxMood * 0.4): <>As soon as {empName} steps inside, the agitated Mitosis Rabbit lunges for their throat. #employee:scare:0
        -> Death
        - else: <>{empName} cleans the chamber, removing all of the residue that had accumulated on the walls.
        Throughout the process, Mitosis Rabbit occasionally takes a bite or two out of the employee. #employee:physdamage:35 #mortem:moodupdate:-0.5
        ~ body -= 35
        -> check_conditions ->
        It's only natural. Everything has to eat, after all. #mortem:research:10 #employee:addbody:8
    }
    - else: <>{empName} cleans the chamber, removing all of the residue that had accumulated on the walls.
    Throughout the process, Mitosis Rabbit occasionally takes a bite or two out of the employee. #employee:physdamage:35 #mortem:moodupdate:-0.5
    ~ body -= 35
    -> check_conditions ->
    It's only natural. Everything has to eat, after all. #mortem:research:10 #employee:addbody:8
}
-> Conclusion

=== Understanding ===
{
    - copies == 4: <>{empName} barely has time to react before the hoard of Mitosis Rabbits all surge at once. #employee:scare:0
        -> Death
    - copies == 0:
    {
        - mood < (maxMood * 0.4): <>As soon as {empName} steps inside, the agitated Mitosis Rabbit lunges for their throat. #employee:scare:0
            -> Death
        - else: <>{empName} observes Mitosis Rabbit within its false habitat.
        The task is rather banal, as this particular Mortem truly is a simple creature. 
        All it seems to ever do is eat the food provided for it, never leaving a single crumb, then idling the rest of its time away. 
        To some, this lifestyle is rather enviable. #mortem:research:40 #mortem:moodupdate:-1.2 #employee:mentdamage:15 #employee:addmindres:0.4f
        ~ mind -= 15
        -> check_conditions ->
    }
    - else: <>{empName} observes Mitosis Rabbit within its false habitat.
    The task is rather banal, as this particular Mortem truly is a simple creature. 
    All it seems to ever do is eat the food provided for it, never leaving a single crumb, then idling the rest of its time away. 
    To some, this lifestyle is rather enviable. #mortem:research:40 #mortem:moodupdate:-1.2 #employee:mentdamage:15 #employee:addmindres:0.4f
    ~ mind -= 15
    -> check_conditions ->
}
-> Conclusion

=== Empathy ===
{
    - copies == 4: <>{empName} hesitates at first, a little pinprick in the back of their mind begging them to walk further into the chamber.
        When that one pinprick turns into a hundred more, they finally succumb.
        {empName} allows themselves to become sustenance for the perfect lifeform.
            -> Death
    - mood < (maxMood * 0.4): <>Mitosis Rabbit seems tempted to make a meal out of {empName} at first. In fact, it even tries to take a few bites. #employee:physdamage:30
         ~ body -= 30
        -> check_conditions ->
        However, upon realizing that the employee has come bearing heaps of food, that anger quickly fades. #mortem:moodupdate:3
        Its purpose restored, it makes the fullest use of every single morsel. For a moment, it's easy to forget that it's even a Mortem. #employee:adjustheart:10
        However, when it follows this up by rapidly dividing into a copy of itself, the employee returns to reality. #mortem:multiply:0 #mortem:spriteupdate:0 #mortem:research:30
    - else: <>Today, {empName} gives Mitosis Rabbit an extra helping of food. #mortem:moodupdate:3
        It absorbs every last crumb directly into its body, quickly dissolving away into nothingness.
        {
            - heart >= 75: Seeing how pleased the Mortem is with their additional serving, {empName} winds up giving them yet another.
            The sheer amount of food is enough to cause Mitosis Rabbit to split once, even before finishing their third serving. #mortem:multiply:0 #mortem:spriteupdate:0 #mortem:research:20
            Still, it looks so adorable in its current state that {empName} hardly minds, even as it splits an additional time. #mortem:multiply:0 #mortem:spriteupdate:0 #employee:adjustheart:10
            - heart <= 15: Knowing exactly what this Mortem is capable of, {empName} takes away the extra serving just before Mitosis Rabbit eats enough to split. #mortem:moodupdate:-0.8
            The false rabbit seems disappointed in this development. {empName} doesn't care in the slightest. #employee:adjustheart:-5 #employee:addmindres:0.3f #mortem:research:5
            - else: When the employee has finished giving Mitosis Rabbit its much needed affection, the moment their back is turned, its body writhes and splits. #mortem:multiply:0 #mortem:spriteupdate:0
            Thus, the circle of life continues. #mortem:research:15
        }
}
-> END

=== Cull ===
{
    - copies == 0: <>There are no copies to cleanse.
        Even so, Mitosis Rabbit doesn't seem to appreciate the gesture. #employee:physdamage:30 #mortem:moodupdate:-1.5
        ~ body -= 30
        -> check_conditions ->
    - studied:
        -> ResearchEvent
    - 1 <= copies <= 3: <>The employee sets aside one of the Mitosis Rabbits. Whether it was the original or not doesn't matter.
    // ENDED HERE
    { heart >= 65: {empName} hesitates at carrying out the next step. It doesn't feel like these rabbits are doing any actual harm.}
    { heart >= 65: {empName} Still, {empName} does as they are told.} #employee:adjustheart:-15
        With a heaping dose of salt, the other rabbits are quickly removed from this world, their bodies shrivelling up as they expell their contents.
        The copies try their hardest to tear the employee to shreds in response, fighting for their lives. It hurts like hell. #employee:physdamage:55
        ~ body -= 55
        -> check_conditions ->
        Despite everything, as all of this is unfolding, the last one doesn't seem to respond at all. #mortem:moodupdate:2 #mortem:cull:0 
        It's not going to be culled, of course. Why should it care? #mortem:research:20 #employee:addbody:10
    - copies == 4: <>The employee sets aside one of the Mitosis Rabbits. Whether it was the original or not doesn't matter.
        They stand their ground as best as they can, dousing the hoard with as much salt as possible.
        It's a herculean task as the mass of Mitosis Rabbits surges against them. Their skin is badly burned in the process, their body nearly torn to complete shreds. #employee:physdamage:70
         ~ body -= 70
        -> check_conditions ->
        When everything is over, the hoard is dispatched, and the last remaining Mitosis Rabbit happily absorbs the spilt blood. #mortem:moodupdate:3 #mortem:cull:0 #mortem:research:25 #employee:addbody:12
    - else: <>Somehow, there isn't a proper number listed here.
}
-> END


=== ResearchEvent ===
<>{empName} sets aside one of the rabbits and retrieves the salt, as usual.
Normally, whenever Mitosis Rabbit's numbers need to be culled, the lone member doesn't react at all to the massacre of its offspring.
This time however, just before the culling starts, it bumps up against the employee's leg to get their attention.
This Mortem is incapable of speech, but its expressions are enough to inuit some meaning.
It gives the employee a quizzical glance.
"Why does this have to be done?" it seems to ask. "Have I done something wrong?"
The employee has a chance to respond.
+ ["You've done nothing wrong."] -> ResearchNothing
+ ["Your very existence is wrong."] -> ResearchExist
+ ["Why should you care?"] -> ResearchCare
+ ["..."] -> ResearchSilent


=== ResearchNothing ===
The rabbit's glance only seems to grow more puzzled. #employee:adjustheart:10
"I don't understand," it seems to suggest. "If there's nothing wrong about what I'm doing, why do you want to stop it?"
+ ["I don't want to stop it."] -> ResearchDontWant
+ ["Because you're simply too efficient."] -> ResearchTooEfficient
+ ["..."] -> ResearchSilent2

=== ResearchDontWant ===
"Then this all seems quite silly," the rabbit thinks.
"If you don't want this, then it would be much better to help instead. Wouldn't it?"
There's a sudden, overwhelming psychic pressure that overtakes the employee. 
Every single nerve in their body suddenly urges them to submit themselves as nothing more than sustenance to a far more deserving creature.
+ [Feed them] -> Death
+ [Feed them] -> Death
+ [Feed them] -> Death
+ [Feed them] -> Death

=== ResearchTooEfficient ===
"Too efficient?" the rabbit ponders. "All I'm doing is living."
"Perhaps you fear me so much that by simply being alive, you think I am a threat to you."
Before the employee can respond, Mitosis Rabbit hops off, giving the employee one more look.
"I suppose this is your one way of keeping yourselves safe."
"Safe from something so much better at living than you."
It goes back to its usual demeanor, not reacting at all as its bretheren are killed. #employee:physdamage:55 #mortem:cull:0
    ~ body -= 55
    -> check_conditions ->
A greater understanding of Mitosis Rabbit has been acquired. #mortem:realize:0
-> END

=== ResearchSilent2 ===
The rabbit waits for a response, but receives none. That, to it, seems to be all the response it needs.
"If you don't want this, then it would be much better to help instead. Wouldn't it?"
There's a sudden, overwhelming psychic pressure that overtakes the employee. 
Every single nerve in their body suddenly urges them to submit themselves as nothing more than sustenance to a far more deserving creature.
+ [Feed them] -> Death
+ [Feed them] -> Death
+ [Feed them] -> Death
+ [Feed them] -> Death


=== ResearchExist===
The rabbit's ears fold down, its eyes expressing a modicum of sadness. #employee:adjustheart:-10
"That seems quite cruel," its demeanor suggests. "I'm only doing exactly what you humans do."
+ ["No you aren't."] -> ResearchDenial
+ ["Correct. It's the fact that you're too efficient at it."] -> ResearchTooEfficient
+ ["..."] -> ResearchSilent3


=== ResearchDenial ===
"But I most certainly am!" it thumps. "I eat like you. I breed like you. The only difference is that I'm faster than you."
Mitosis Rabbit sizes up the employee, its eyes dialating with hunger and frustration.
"If this is what you humans believe, perhaps I should prove them wrong."
Without warning, Mitosis Rabbit lunges for the employee's neck.
-> Death

=== ResearchSilent3 ===
The rabbit waits for a response, but receives none. It seems frustrated by this.
"How strange," it conveys. "Perhaps you humans don't like it when something else can live just as well as you do."
Mitosis Rabbit hops off. It goes back to its usual demeanor, not reacting at all as its bretheren are killed. #employee:physdamage:55 #mortem:cull:0
    ~ body -= 55
    -> check_conditions ->
A breakthrough seems to be in sight, but has not yet been reached.
-> END

=== ResearchCare ===
The rabbit seems to think on this for a moment. Although this would be simple for a human to answer, the logic doesn't seem to compute for Mitosis Rabbit.
It looks to its copies, conveying the idea of "Because one day, it could be me among those getting culled."
"I don't really want to die. It means there can't be anymore of me. And that would be bad."
+ ["Why would it be bad?"] -> ResearchWhyBad
+ ["There are already enough of you."] -> ResearchEnough
+ ["..."] -> ResearchSilent3

=== ResearchWhyBad ===
"Because then I stop living. The whole point of life is to live."
As Mitosis Rabbit seems to realize its incongruous logic, it hops off, awaiting the culling of its fellow members.
"Maybe there is no difference between life and death for you humans."
"How silly."
It goes back to its usual demeanor, not reacting at all as its bretheren are killed. #employee:physdamage:55 #mortem:cull:0
    ~ body -= 55
    -> check_conditions ->
A greater understanding of Mitosis Rabbit has been acquired. #mortem:realize:0
-> END

=== ResearchEnough ===
It tilts its head. "Enough?" it seems to question. #employee:adjustheart:-5
"But there's no such thing. My whole purpose is to make more of me."
"That's everyone's purpose, isn't it?"
+ ["Yes"] -> ResearchYes
+ ["No"] -> ResearchNo

=== ResearchYes ===
"Then I see no reason why I shouldn't try and fight against this."
"If you die, that means I keep living, right?"
Without warning, Mitosis Rabbit lunges for the employee's neck.
-> Death

=== ResearchNo ===
"No?"
The answer seems to mentally stump Mitosis Rabbit. Unable to parse this quandry, it hops off, giving a look back towards the employee.
"You humans must have such a misunderstanding of what living is. I don't get it at all."
"Maybe if you lived like me, you would understand."
It goes back to its usual demeanor, not reacting at all as its bretheren are killed. #employee:physdamage:55 #mortem:cull:0
    ~ body -= 55
    -> check_conditions ->
A greater understanding of Mitosis Rabbit has been acquired. #mortem:realize:0
-> END

=== ResearchSilent ===
The curious rabbit receives no response from the employee. Frustrated, it eventually gives up.
It goes back to its usual demeanor, not reacting at all as its bretheren are killed. #employee:physdamage:55 #mortem:cull:0
    ~ body -= 55
    -> check_conditions ->
A breakthrough seems to be in sight, but has not yet been reached.
-> END

=== Death ===
Mitosis Rabbit happily enjoys their unexpected meal. #game:kill:0 #mortem:moodupdate:3 #mortem:kill:0
-> END

=== MentalDeath ===
The whole time {empName} has been in Mitosis Rabbit's chamber, they've been feeling a strange sense of insignificance.
In the back of their head, a little voice has been telling them the same thing over and over:
"You are nothing but sustenance."
"Your greatest purpose is to allow yourself to succumb to the cycle of life."
In a brief but fatal moment, {empName} acts on this voice.
Their knees buckle as they fall forward towards Mitosis Rabbit, their body now at the mercy of a higher lifeform.
-> Death

=== Conclusion ===
{
    - copies == 0: As the employee leaves, Mitosis Rabbit seems to shift in frustration. It remains solitary today. #mortem:moodupdate:-0.5
    - else: As the employee leaves, Mitosis Rabbit splits once again, continuing its dominance over the sway of life. #mortem:multiply:0 #mortem:spriteupdate:0
}
-> END

=== check_conditions ===
{
    - body <= 0:
        -> Death
    - mind <= 25:
        -> MentalDeath
}
    
->->




