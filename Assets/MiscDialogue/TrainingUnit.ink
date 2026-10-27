VAR empName = ""
VAR body = 0
VAR mind = 0
VAR heart = 0
VAR bodyStrength = 0
VAR mindStrength = 0

-> main 

=== main ===
TRAINING
Today, {empName} has been assigned to improve themselves.
What should be trained?
+ [Body] -> Body
+ [Mind] -> Mind

=== Body ===
How intense should the training be?
+ [Mild] -> BodyMild
+ [Standard] -> BodyStandard
+ [Heavy] -> BodyHeavy


=== BodyMild ===
{
    - bodyStrength >= 100: <>At this point in {empName}'s career, such light training does very little to improve their strength.
    {empName}'s MAX BODY increased by a miniscule amount. #employee:addbody:2
    - else: <>The strength training assigned to {empName} is purposefully very light.
    It's enough to slightly train their body without putting too much strain on them.
    {empName}'s MAX BODY increased slightly. #employee:addbody:8
}
-> END

=== BodyStandard ===
{
    - bodyStrength >= 100: <>With how experienced {empName} is by this point, their training can afford to be a bit more intense.
    They handle the task quite well, despite the extra load.
    {empName}'s MAX BODY increased slightly. #employee:addbody:8
    - else: <>The training is a bit rough on someone as weak as {empName}.
    Still, they push through in the end, albeit with quite a bit of strain.
    {empName}'s MAX BODY increased... but their MIND decreased slightly. #employee:addbody:16 #employee:mentdamage:8
}
-> END

=== BodyHeavy ===
{
    - bodyStrength >= 100: <>Even for someone as hardened as {empName}, the load today is especially intense.
    They're strong enough to handle it just fine, but even they wind up with some strain by the end.
    {empName}'s MAX BODY increased... but their MIND decreased slightly. #employee:addbody:16 #employee:mentdamage:8
    - else: <>The load given to {empName} is far beyond their capabilities.
    {
        - mind >= 50: Still, they do their best to push through, despite their muscles screaming in agony.
        By the end, they are much stronger. The same cannot be said for their mental state.
        {empName}'s MAX BODY increased sharply. Their MIND, however, sharply decreased. #employee:addbody:24 #employee:mentdamage:26
        - else: After everything else they have been through, this is where they throw in the towel.
        They completely refuse to perform today's training.
    }
}
-> END

=== Mind ===
How intense should the training be?
+ [Mild] -> MindMild
+ [Standard] -> MindStandard
+ [Heavy] -> MindHeavy

=== MindMild ===
{
    - mindStrength >= 3: <>{empName} is well accustomed to the art of clearing their mind.
    The training is relatively unfruitful, bearing mostly lessons that {empName} has already internalized.
    {empName}'s DISBELIEF increased by a miniscule amount. #employee:addmindres:0.1
    - else: <>Unused to how some of these Mortems operate, {empName} is educated on how to clear their mind of belief.
    Even the slightest trace could be enough for a Mortem to take hold. To be hopeless is to be safe.
    {empName}'s DISBELIEF increased slightly. #employee:addmindres:0.3
}
-> END

=== MindStandard ===
{
    - mindStrength >= 100: <>Once again, {empName} drills the many mantras into their head.
    Each one uttered acts as another reminder that nothing in this forsaken world can be trusted, save for what can be seen.
    {empName}'s DISBELIEF increased slightly. #employee:addmindres:0.3
    - else: <>To remove memories in favor of esoteric phrases would cause a mental toll on just about anyone.
    Still, the replacement is necessary if {empName} wishes to survive these abominations.
    {empName}'s DISBELIEF increased... but their MIND decreased slightly. #employee:addmindres:0.6 #employee:mentdamage:8
}
-> END

=== MindHeavy ===
{
    - mindStrength >= 100: <>{empName}'s mind is pushed to its limit with today's training, forced to expunge a vast amount of information.
    By lightening the load, no matter how abominable the Mortem, it will have nothing to grab onto.
    Even for {empName} however, it still hurts.
    {empName}'s DISBELIEF increased... but their MIND decreased slightly. #employee:addmindres:0.6 #employee:mentdamage:8
    - else: <>The strain put upon {empName} is much more than they expected.
    {
        - mind >= 50: Even so, they understand that this process is necessary to keep them safe.
        Purging every belief from their system not only increases their odds of survival, but ensures their coworkers won't befall the same fate.
        {empName}'s DISBELIEF increased sharply. Their MIND, however, sharply decreased. #employee:addmindres:1 #employee:mentdamage:26
        - else: They wind up not being willing to part with certain memories and thoughts.
        Today's training does not take hold. They remain just as vulnerable.
    }
}
-> END