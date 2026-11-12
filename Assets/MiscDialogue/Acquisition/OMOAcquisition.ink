VAR empCount = 0

VAR empName1 = ""
VAR body1 = 0
VAR mind1 = 0
VAR heart1 = 0
VAR bodyStrength1 = 0
VAR mindStrength1 = 0
VAR alive1 = true

VAR empName2 = ""
VAR body2 = 0
VAR mind2 = 0
VAR heart2 = 0
VAR bodyStrength2 = 0
VAR mindStrength2 = 0
VAR alive2 = false

VAR empName3 = ""
VAR body3 = 0
VAR mind3 = 0
VAR heart3 = 0
VAR bodyStrength3 = 0
VAR mindStrength3 = 0
VAR alive3 = false

VAR empName4 = ""
VAR body4 = 0
VAR mind4 = 0
VAR heart4 = 0
VAR bodyStrength4 = 0
VAR mindStrength4 = 0
VAR alive4 = false

VAR rng = 0

VAR shotslanded = 0
VAR approaches = 0
VAR reasonings = 0
VAR reasoningAttempts = 0



-> main 

=== main ===
ACQUISITION
{
    - empCount == 1: {empName1} is sent out, alone.
    -> soloIntro
    - empCount == 2: {empName1} and {empName2} are sent out.
    ~ alive2 = true
    -> multiIntro
    - empCount == 3: {empName1}, {empName2}, and {empName3} are sent out.
    ~ alive2 = true
    ~ alive3 = true
    -> multiIntro
    - empCount == 4: {empName1}, {empName2}, {empName3}, and {empName4} are sent out.
    ~ alive2 = true
    ~ alive3 = true
    ~ alive4 = true
    -> multiIntro
    - empCount == 0: Somehow you've managed to send out nobody, but loaded the scene anyways.
}
You shouldn't be here.
-> END

=== soloIntro ===
Knowing of this Mortem's audial influence, they've been provided a pair of heavy-duty headphones to block out any and all sound.
For good measure, they've even been given earplugs to wear on the inside.
{empName1} is thoroughly deafened.
Despite this, as they cross the 1 mile threshold, they can still hear the faint sound of music.
It doesn't come from a specific direction. Instead, it manifests directly inside their head.
The closer they get to the source, the louder it becomes, as if their very mind is the one broadcasting the sound.
As they journey, there are numerous Worshippers strewn about the streets.
Each one has torn their throats open, by which to better sing to the tune of the ever-present melody.
The rest of their bodies have atrophied to the point where their limbs are nothing more than ornaments.
Still, they sing.
The headphones block out most of their sound, but inevitably, some mixes in with the Mortem's mental melody.
{empName1} took some MIND damage from the enhanced melody, doing their best to mentally block it out. #employee:mentdamage:20:0
    ~ mind1 -= 20
{
    - mind1 <= 20: -> earlyRetreat
}

-> UpTheTower

=== multiIntro ===
Knowing of this Mortem's audial influence, they've been provided a pair of heavy-duty headphones to block out any and all sound.
For good measure, they've even been given earplugs to wear on the inside.
Your employees won't be able to hear one another this Acquisition, instead relying on hand signals.
{
    - mindStrength1 < 2: {empName1} is having difficulties getting used to this system.
}
{
    - mindStrength2 < 2 and empCount > 1: {empName2} is having difficulties getting used to this system.
}
{
    - mindStrength3 < 2 and empCount > 2: {empName3} is having difficulties getting used to this system.
}
{
    - mindStrength4 < 2 and empCount > 3: {empName4} is having difficulties getting used to this system.
}
Despite this, as they cross the 1 mile threshold, they can still hear the faint sound of music.
It doesn't come from a specific direction. Instead, it manifests directly inside their head.
The closer they get to the source, the louder it becomes, as if their very minds are the ones broadcasting the sound.
As they journey, there are numerous Worshippers strewn about the streets.
Each one has torn their throats open, by which to better sing to the tune of the ever-present melody.
The rest of their bodies have atrophied to the point where their limbs are nothing more than ornaments.
Still, they sing.
The headphones block out most of their sound, but inevitably, some mixes in with the Mortem's mental melody.
{empCount > 1: Your employees|{empName1}} took some MIND damage from the enhanced melody, doing their best to mentally block it out. #employee:mentdamage:20:0 {empCount > 1: #employee:mentdamage:20:1} {empCount > 2: #employee:mentdamage:20:2} {empCount > 3: #employee:mentdamage:20:3} 
    ~ mind1 -= 20 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 20 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 20 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 20 * (1 - (0.12 * mindStrength4))
{
    - mind1 <= 20 and mind2 <= 20 and mind3 <= 20 and mind4 <= 20: -> earlyRetreat
}
{
    - mind1 <= 20: {empName1} already seems unstable.
}
{
    - mind2 <= 20  and empCount > 1: {empName2} already seems unstable.
}
{
    - mind3 <= 20 and empCount > 2: {empName3} already seems unstable.
}
{
    - mind4 <= 20  and empCount > 3: {empName4} already seems unstable.
}
-> UpTheTower

=== UpTheTower ===
Nevertheless, {empCount == 1: {empName1} continues | your employees continue} up to the tower proper.
With the power out, they're forced to take all 25 flights of stairs.
It's a grueling climb, though not necessarily an impossible one.
{
    - empCount == 1: {empName1} is forced to endure the entire trek alone, left only with the ever-present melody.
    This alone is far more taxing than the stairs ever could be. They take a bit of MIND damage. #employee:mentdamage:8:0
    ~ mind1 -= 8 * (1 - (0.12 * mindStrength1))
    {
        - mind1 <= 8: -> earlyRetreat
    }
    - else: Your employees wind up conversing with vague hand gestures as they ascend to pass the time.
    It's impossible to tell whether the conversation is jovial or forlorn.
}
In the end, after quite a large leg workout, they reach the roof of the building.
The whole city is visible from up here. Down below, {empCount == 1: {empName1} | your employees} can see the carnage this Mortem has wrought. #game:backgroundappear:0:0
Before them, the conductor stands perched upon the ledge of the building, its many hands gesturing fervantly.
It doesn't even seem to have noticed {empCount == 1: {empName1} | your employees} as they get closer. #game:mortemappear:0:0
With every hand motion, it seems to conduct another invisible instrument, moving to an inaudible metronome.
{empCount == 1: {empName1} tentatively moves closer, hand on the blanked firearm on their waist.| Your employees tentatively move closer, each of them ready to draw their blanked firearm at a moment's notice.}
There's a slight but sudden increase in air pressure, enough to lift some of the pages of the lectern that makes up this Mortem's head.
The wind carries its voice, once again piercing through the false veil the headphones provide.
"Loving audience O' mine, why do you possess those coverings?" #game:changeticksound:2:0
"You cannot experience the beauty of the One Man Orchestra's piece with your mind alone."
There's an immediate compulsion that can be felt {empCount == 1: deep within {empName1}'s heart. | deep within your employees hearts.} #game:changeticksound:0:0
Even merely hearing the One Man Orchestra's voice is enough to weaken their willpower.
{
    - empCount == 1: -> Emp1Resist
    - else: Who will be the first to resist?
    * {alive1} [{empName1}] -> Emp1Resist
    * {alive2} [{empName2}] -> Emp2Resist
    * {alive3} [{empName3}] -> Emp3Resist
    * {alive4} [{empName4}] -> Emp4Resist
}


=== Emp1Resist ===
~ rng = RANDOM(200, 400) / 100
{
    - mindStrength1 >= rng: <>{empCount > 1: {empName1} steels themselves, signaling to the others to keep their headphones on no matter what. | {empName1} steels themselves, refusing to give into the Mortem's command.} #game:mortemspritechange:1:0
    Their mental fortitude is enough to resist One Man Orchestra's lull.
    - else: <>{empName1} does their best to resist the lull, but simply cannot think of enough mantras to blot out the sound.
    Their hand wavers, threatening to reach their headphones. {empCount > 1: The others notice.} #employee:mentdamage:20:0 {empCount > 1: #employee:mentdamage:20:1} {empCount > 2: #employee:mentdamage:20:2} {empCount > 3: #employee:mentdamage:20:3} 
    ~ mind1 -= 20 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 20 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 20 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 20 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
}
-> BraveThePull

=== Emp2Resist ===
~ rng = RANDOM(200, 400) / 100
{
    - mindStrength2 >= rng: <>{empName2} steels themselves, signaling to the others to keep their headphones on no matter what. #game:mortemspritechange:1:0
    Their mental fortitude is enough to resist One Man Orchestra's lull.
    - else: <>{empName2} does their best to resist the lull, but simply cannot think of enough mantras to blot out the sound.
    Their hand wavers, threatening to reach their headphones. {empCount > 1: The others notice.} #employee:mentdamage:20:0 {empCount > 1: #employee:mentdamage:20:1} {empCount > 2: #employee:mentdamage:20:2} {empCount > 3: #employee:mentdamage:20:3}
    ~ mind1 -= 20 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 20 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 20 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 20 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
}
-> BraveThePull

=== Emp3Resist ===
~ rng = RANDOM(200, 400) / 100
{
    - mindStrength3 >= rng: <>{empName3} steels themselves, signaling to the others to keep their headphones on no matter what. #game:mortemspritechange:1:0
    Their mental fortitude is enough to resist One Man Orchestra's lull.
    - else: <>{empName3} does their best to resist the lull, but simply cannot think of enough mantras to blot out the sound.
    Their hand wavers, threatening to reach their headphones. {empCount > 1: The others notice.} #employee:mentdamage:20:0 {empCount > 1: #employee:mentdamage:20:1} {empCount > 2: #employee:mentdamage:20:2} {empCount > 3: #employee:mentdamage:20:3}
    ~ mind1 -= 20 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 20 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 20 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 20 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
}
-> BraveThePull

=== Emp4Resist ===
~ rng = RANDOM(200, 400) / 100
{
    - mindStrength4 >= rng: <>{empName4} steels themselves, signaling to the others to keep their headphones on no matter what. #game:mortemspritechange:1:0
    Their mental fortitude is enough to resist One Man Orchestra's lull.
    - else: <>{empName4} does their best to resist the lull, but simply cannot think of enough mantras to blot out the sound.
    Their hand wavers, threatening to reach their headphones. {empCount > 1: The others notice.} #employee:mentdamage:20:0 {empCount > 1: #employee:mentdamage:20:1} {empCount > 2: #employee:mentdamage:20:2} {empCount > 3: #employee:mentdamage:20:3}
    ~ mind1 -= 20 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 20 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 20 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 20 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
}
-> BraveThePull


=== BraveThePull ===
"A shame." #game:changeticksound:2:0 #game:mortemspritechange:0:0
"You all seem so unhappy. You've deafened yourself to that which underlies us all."
"I invite you to stay."
One Man Orchestra's song only gets louder. At this point, approach is impossible. #game:changeticksound:0:0
-> GiveOrders

=== GiveOrders ===
How should {empCount == 1: your employee | your employees} proceed?
+ [Fire] -> FireAssign
+ [Approach] -> ApproachAssign
+ [Reason] -> ReasonAssign
+ [Retreat] -> Retreat

=== FireAssign ===
Who will fire upon the Mortem?
+ {alive1} [{empName1}] -> Fire1
+ {alive2} [{empName2}] -> Fire2
+ {alive3} [{empName3}] -> Fire3
+ {alive4} [{empName4}] -> Fire4

=== Fire1 ===
{
    - mindStrength1 < 3: <>{empName1} does their best to clear their mind before firing. #game:playsound:1:0
    However, clouded with the music and endless doubts, their bullets don't find their marks.
    Seeing such a thing, their disbelief wavers further, taking MIND damage. #employee:mentdamage:15:0 #game:playsound:2:0
    ~ mind1 -= 15 * (1 - (0.12 * mindStrength1))
    -> check_conditions ->
    -> GiveOrders
    - approaches == 0: <>{empName1} clears their mind before firing, as they have done many times now. #game:playsound:1:0
    Even so, the Mortem is completely unharmed. Its class is high enough to shurg off such attempts.
    At this range, just about nothing can stop the One Man Orchestra.
    -> GiveOrders
    - shotslanded == 1: <>Seeing that the Mortem has refused to stop playing, {empName1} fires several more shots. #game:mortemspritechange:2:0 #game:playsound:1:0
    They aim for a different arm with each shot, silencing one instrument at a time.
    The Mortem attempts to deploy more to keep the orchestra going, but it's a losing battle.
    Still, the wounded song worms its way into {empName1}'s brain all the same.
    {empName1} suffered massive MIND damage. #employee:mentdamage:40:0 #game:playsound:3:0
    ~ mind1 -= 40 * (1 - (0.12 * mindStrength1))
    -> check_conditions ->
    At this point, the pressure surrounding the One Man Orchestra has diminished even further.
    ~ shotslanded += 1
    -> GiveOrders
    - else: <>{empName1} takes a deep breath and closes their eyes, repeating the numerous mantras drilled into their mind.
    "I see nothing but what is in front of me." "Beyond the veil is only darkness."
    They are phrases that bring {empName1} and all other employees pain, forced to forgo everything that once made life beautiful.
    Still, when they open their eyes, they've fired a critical shot at One Man Orchestra, striking it square in the chest. #game:mortemspritechange:2:0 #game:playsound:0:0
    Although it does not verbally cry out, it raises its baton high, the song reaching a crescendo of mental torment. #game:mortemspritechange:0:0
    {empName1} suffered massive MIND damage. #employee:mentdamage:40:0 #game:playsound:3:0
    ~ mind1 -= 40 * (1 - (0.12 * mindStrength1))
    -> check_conditions ->
    Regardless, an opportunity has been opened.
    ~ shotslanded += 1
    -> GiveOrders
}

=== Fire2 ===
{
    - mindStrength2 < 3: <>{empName2} does their best to clear their mind before firing. #game:playsound:1:0
    However, clouded with the music and endless doubts, their bullets don't find their marks.
    Seeing such a thing, their disbelief wavers further, taking MIND damage. #employee:mentdamage:15:1 #game:playsound:2:0
    ~ mind2 -= 15 * (1 - (0.12 * mindStrength2))
    -> check_conditions ->
    -> GiveOrders
    - approaches == 0: <>{empName2} clears their mind before firing, as they have done many times now. #game:playsound:1:0
    Even so, the Mortem is completely unharmed. Its class is high enough to shurg off such attempts.
    At this range, just about nothing can stop the One Man Orchestra.
    -> GiveOrders
    - shotslanded == 1: <>Seeing that the Mortem has refused to stop playing, {empName2} fires several more shots. #game:mortemspritechange:2:0 #game:playsound:1:0
    They aim for a different arm with each shot, silencing one instrument at a time.
    The Mortem attempts to deploy more to keep the orchestra going, but it's a losing battle.
    Still, the wounded song worms its way into {empName2}'s brain all the same.
    {empName2} suffered massive MIND damage. #employee:mentdamage:40:1 #game:playsound:3:0
    ~ mind2 -= 40 * (1 - (0.12 * mindStrength2))
    -> check_conditions ->
    At this point, the pressure surrounding the One Man Orchestra has diminished even further.
    ~ shotslanded += 1
    -> GiveOrders
    - else: <>{empName2} takes a deep breath and closes their eyes, repeating the numerous mantras drilled into their mind.
    "I see nothing but what is in front of me." "Beyond the veil is only darkness."
    They are phrases that bring {empName2} and all other employees pain, forced to forgo everything that once made life beautiful.
    Still, when they open their eyes, they've fired a critical shot at One Man Orchestra, striking it square in the chest. #game:mortemspritechange:2:0 #game:playsound:0:0
    Although it does not verbally cry out, it raises its baton high, the song reaching a crescendo of mental torment. #game:mortemspritechange:0:0
    {empName2} suffered massive MIND damage. #employee:mentdamage:40:1 #game:playsound:3:0
    ~ mind2 -= 40 * (1 - (0.12 * mindStrength2))
    -> check_conditions ->
    Regardless, an opportunity has been opened.
    ~ shotslanded += 1
    -> GiveOrders
}

=== Fire3 ===
{
    - mindStrength3 < 3: <>{empName3} does their best to clear their mind before firing. #game:playsound:1:0
    However, clouded with the music and endless doubts, their bullets don't find their marks.
    Seeing such a thing, their disbelief wavers further, taking MIND damage. #employee:mentdamage:15:2 #game:playsound:2:0
    ~ mind3 -= 15 * (1 - (0.12 * mindStrength3))
    -> check_conditions ->
    -> GiveOrders
    - approaches == 0: <>{empName3} clears their mind before firing, as they have done many times now. #game:playsound:1:0
    Even so, the Mortem is completely unharmed. Its class is high enough to shurg off such attempts.
    At this range, just about nothing can stop the One Man Orchestra.
    -> GiveOrders
    - shotslanded == 1: <>Seeing that the Mortem has refused to stop playing, {empName3} fires several more shots. #game:mortemspritechange:2:0 #game:playsound:1:0
    They aim for a different arm with each shot, silencing one instrument at a time.
    The Mortem attempts to deploy more to keep the orchestra going, but it's a losing battle.
    Still, the wounded song worms its way into {empName3}'s brain all the same.
    {empName3} suffered massive MIND damage. #employee:mentdamage:40:2 #game:playsound:3:0
    ~ mind3 -= 40 * (1 - (0.12 * mindStrength3))
    -> check_conditions ->
    At this point, the pressure surrounding the One Man Orchestra has diminished even further.
    ~ shotslanded += 1
    -> GiveOrders
    - else: <>{empName3} takes a deep breath and closes their eyes, repeating the numerous mantras drilled into their mind.
    "I see nothing but what is in front of me." "Beyond the veil is only darkness."
    They are phrases that bring {empName3} and all other employees pain, forced to forgo everything that once made life beautiful.
    Still, when they open their eyes, they've fired a critical shot at One Man Orchestra, striking it square in the chest. #game:mortemspritechange:2:0 #game:playsound:0:0
    Although it does not verbally cry out, it raises its baton high, the song reaching a crescendo of mental torment. #game:mortemspritechange:0:0
    {empName1} suffered massive MIND damage. #employee:mentdamage:40:2 #game:playsound:3:0
    ~ mind3 -= 40 * (1 - (0.12 * mindStrength3))
    -> check_conditions ->
    Regardless, an opportunity has been opened.
    ~ shotslanded += 1
    -> GiveOrders
}

=== Fire4 ===
{
    - mindStrength4 < 3: <>{empName4} does their best to clear their mind before firing. #game:playsound:1:0
    However, clouded with the music and endless doubts, their bullets don't find their marks.
    Seeing such a thing, their disbelief wavers further, taking MIND damage. #employee:mentdamage:15:3 #game:playsound:2:0
    ~ mind4 -= 15 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - approaches == 0: <>{empName4} clears their mind before firing, as they have done many times now. #game:playsound:1:0
    Even so, the Mortem is completely unharmed. Its class is high enough to shurg off such attempts.
    At this range, just about nothing can stop the One Man Orchestra.
    -> GiveOrders
    - shotslanded == 1: <>Seeing that the Mortem has refused to stop playing, {empName1} fires several more shots. #game:mortemspritechange:2:0 #game:playsound:1:0
    They aim for a different arm with each shot, silencing one instrument at a time.
    The Mortem attempts to deploy more to keep the orchestra going, but it's a losing battle.
    Still, the wounded song worms its way into {empName1}'s brain all the same.
    {empName1} suffered massive MIND damage. #employee:mentdamage:40:3 #game:playsound:3:0
    ~ mind4 -= 40 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    At this point, the pressure surrounding the One Man Orchestra has diminished even further.
    ~ shotslanded += 1
    -> GiveOrders
    - else: <>{empName4} takes a deep breath and closes their eyes, repeating the numerous mantras drilled into their mind.
    "I see nothing but what is in front of me." "Beyond the veil is only darkness."
    They are phrases that bring {empName4} and all other employees pain, forced to forgo everything that once made life beautiful.
    Still, when they open their eyes, they've fired a critical shot at One Man Orchestra, striking it square in the chest. #game:mortemspritechange:2:0 #game:playsound:0:0
    Although it does not verbally cry out, it raises its baton high, the song reaching a crescendo of mental torment. #game:mortemspritechange:0:0
    {empName1} suffered massive MIND damage. #employee:mentdamage:40:3 #game:playsound:3:0
    ~ mind4 -= 40 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    Regardless, an opportunity has been opened.
    ~ shotslanded += 1
    -> GiveOrders
}

=== ApproachAssign ===
Who should herald the approach?
+ {alive1} [{empName1}] -> Approach1
+ {alive2} [{empName2}] -> Approach2
+ {alive3} [{empName3}] -> Approach3
+ {alive4} [{empName4}] -> Approach4

=== Approach1 ===
{
    - reasonings == 0: <>{empCount == 1: {empName1} approaches the Mortem. | {empName1} leads the others in getting closer to the Mortem.}
    As expected, at the current moment, One Man Orchestra is too incensed to be properly approached.
    The employees take some MIND damage from the attempt. #employee:mentdamage:8:0 {empCount > 1: #employee:mentdamage:8:1} {empCount > 2: #employee:mentdamage:8:2} {empCount > 3: #employee:mentdamage:8:3} #game:playsound:2:0
    ~ mind1 -= 8 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 8 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 8 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 8 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - shotslanded >= 2: <>{empCount == 1: {empName1} approaches the Mortem. | {empName1} leads the others in getting closer to the Mortem.}
    It continues to gesture erratically, the ever-present orchestra still not missing a note.
    {empName1} bears the brunt of the mental attack, suffering MIND damage. #employee:mentdamage:15:0 #game:playsound:2:0
    ~ mind1 -= 15 * (1 - (0.12 * mindStrength1))
    -> check_conditions ->
    {
        - alive1: Even so, they're able to push through, blocking out the mental assault as best as they can.
        {empName1} ensures that the music falls on deaf ears. With the snare in hand, they take one more step forward...
        -> Capture
        - else: With {empName1} falling, the others are forced to hold the advance before finally capturing One Man Orchestra.
        -> GiveOrders
    }
    - shotslanded == 1: <>Although {empName1} attempts to lead the charge, the wounded Mortem is still playing just as fervantly, if not more so.
    It does so in defiance, refusing to stop the ur-melody.
    Every employee winds up taking substantial MIND damage. #employee:mentdamage:15:0 {empCount > 1: #employee:mentdamage:15:1} {empCount > 2: #employee:mentdamage:15:2} {empCount > 3: #employee:mentdamage:15:3} #game:playsound:3:0
    ~ mind1 -= 15 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 15 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 15 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 15 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - else: <>With One Man Orchestra's guard down, {empName1} is able to {empCount > 1: lead the others closer| get closer} to the Mortem.
    "Every audience member is a gift. Please, do remain seated for the performance." #game:changeticksound:2:0
    Being closest to One Man Orchestra now, the music strongly affects the leading employee. #game:changeticksound:0:0
    They take a massive amount of MIND damage. #employee:mentdamage:40:0 #game:playsound:3:0
    ~ mind1 -= 40 * (1 - (0.12 * mindStrength1))
    -> check_conditions ->
    Even so, the distance has been closed. The Mortem's heart has been exposed.
    ~ approaches += 1
    -> GiveOrders
}

=== Approach2 ===
{
    - reasonings == 0: <>{empName2} leads the others in getting closer to the Mortem.
    As expected, at the current moment, One Man Orchestra is too incensed to be properly approached.
    The employees take some MIND damage from the attempt. #employee:mentdamage:8:0 {empCount > 1: #employee:mentdamage:8:1} {empCount > 2: #employee:mentdamage:8:2} {empCount > 3: #employee:mentdamage:8:3} #game:playsound:2:0
    ~ mind1 -= 8 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 8 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 8 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 8 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - shotslanded >= 2: <>{empName2} leads the others in getting closer to the Mortem.
    It continues to gesture erratically, the ever-present orchestra still not missing a note.
    {empName2} bears the brunt of the mental attack, suffering MIND damage. #employee:mentdamage:15:1 #game:playsound:2:0
    ~ mind2 -= 15 * (1 - (0.12 * mindStrength2))
    -> check_conditions ->
    {
        - alive2: Even so, they're able to push through, blocking out the mental assault as best as they can.
        {empName2} ensures that the music falls on deaf ears. With the snare in hand, they take one more step forward...
        -> Capture
        - else: With {empName2} falling, the others are forced to hold the advance before finally capturing One Man Orchestra.
        -> GiveOrders
    }
    - shotslanded == 1: <>Although {empName2} attempts to lead the charge, the wounded Mortem is still playing just as fervantly, if not more so.
    It does so in defiance, refusing to stop the ur-melody.
    Every employee winds up taking substantial MIND damage. #employee:mentdamage:15:0 {empCount > 1: #employee:mentdamage:15:1} {empCount > 2: #employee:mentdamage:15:2} {empCount > 3: #employee:mentdamage:15:3} #game:playsound:3:0
    ~ mind1 -= 15 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 15 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 15 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 15 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - else: <>With One Man Orchestra's guard down, {empName2} is able to lead the others closer to the Mortem.
    "Every audience member is a gift. Please, do remain seated for the performance." #game:changeticksound:2:0
    Being closest to One Man Orchestra now, the music strongly affects the leading employee. #game:changeticksound:0:0
    They take a massive amount of MIND damage. #employee:mentdamage:40:1 #game:playsound:3:0
    ~ mind2 -= 40 * (1 - (0.12 * mindStrength2))
    -> check_conditions ->
    Even so, the distance has been closed. The Mortem's heart has been exposed.
    ~ approaches += 1
    -> GiveOrders
}

=== Approach3 ===
{
    - reasonings == 0: <>{empName3} leads the others in getting closer to the Mortem.
    As expected, at the current moment, One Man Orchestra is too incensed to be properly approached.
    The employees take some MIND damage from the attempt. #employee:mentdamage:8:0 {empCount > 1: #employee:mentdamage:8:1} {empCount > 2: #employee:mentdamage:8:2} {empCount > 3: #employee:mentdamage:8:3} #game:playsound:2:0
    ~ mind1 -= 8 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 8 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 8 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 8 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - shotslanded >= 2: <>{empName3} leads the others in getting closer to the Mortem.
    It continues to gesture erratically, the ever-present orchestra still not missing a note.
    {empName3} bears the brunt of the mental attack, suffering MIND damage. #employee:mentdamage:15:2 #game:playsound:2:0
    ~ mind3 -= 15 * (1 - (0.12 * mindStrength3))
    -> check_conditions ->
    {
        - alive3: Even so, they're able to push through, blocking out the mental assault as best as they can.
        {empName3} ensures that the music falls on deaf ears. With the snare in hand, they take one more step forward...
        -> Capture
        - else: With {empName3} falling, the others are forced to hold the advance before finally capturing One Man Orchestra.
        -> GiveOrders
    }
    - shotslanded == 1: <>Although {empName3} attempts to lead the charge, the wounded Mortem is still playing just as fervantly, if not more so.
    It does so in defiance, refusing to stop the ur-melody.
    Every employee winds up taking substantial MIND damage. #employee:mentdamage:15:0 {empCount > 1: #employee:mentdamage:15:1} {empCount > 2: #employee:mentdamage:15:2} {empCount > 3: #employee:mentdamage:15:3} #game:playsound:3:0
    ~ mind1 -= 15 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 15 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 15 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 15 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - else: <>With One Man Orchestra's guard down, {empName3} is able to lead the others closer to the Mortem.
    "Every audience member is a gift. Please, do remain seated for the performance." #game:changeticksound:2:0
    Being closest to One Man Orchestra now, the music strongly affects the leading employee. #game:changeticksound:0:0
    They take a massive amount of MIND damage. #employee:mentdamage:40:2 #game:playsound:3:0
    ~ mind3 -= 40 * (1 - (0.12 * mindStrength3))
    -> check_conditions ->
    Even so, the distance has been closed. The Mortem's heart has been exposed.
    ~ approaches += 1
    -> GiveOrders
}

=== Approach4 ===
{
    - reasonings == 0: <>{empName4} leads the others in getting closer to the Mortem.
    As expected, at the current moment, One Man Orchestra is too incensed to be properly approached.
    The employees take some MIND damage from the attempt. #employee:mentdamage:8:0 {empCount > 1: #employee:mentdamage:8:1} {empCount > 2: #employee:mentdamage:8:2} {empCount > 3: #employee:mentdamage:8:3} #game:playsound:2:0
    ~ mind1 -= 8 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 8 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 8 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 8 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - shotslanded >= 2: <>{empName4} leads the others in getting closer to the Mortem.
    It continues to gesture erratically, the ever-present orchestra still not missing a note.
    {empName4} bears the brunt of the mental attack, suffering MIND damage. #employee:mentdamage:15:3 #game:playsound:2:0
    ~ mind4 -= 15 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    {
        - alive4: Even so, they're able to push through, blocking out the mental assault as best as they can.
        {empName4} ensures that the music falls on deaf ears. With the snare in hand, they take one more step forward...
        -> Capture
        - else: With {empName4} falling, the others are forced to hold the advance before finally capturing One Man Orchestra.
        -> GiveOrders
    }
    - shotslanded == 1: <>Although {empName4} attempts to lead the charge, the wounded Mortem is still playing just as fervantly, if not more so.
    It does so in defiance, refusing to stop the ur-melody.
    Every employee winds up taking substantial MIND damage. #employee:mentdamage:15:0 {empCount > 1: #employee:mentdamage:15:1} {empCount > 2: #employee:mentdamage:15:2} {empCount > 3: #employee:mentdamage:15:3} #game:playsound:3:0
    ~ mind1 -= 15 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 15 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 15 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 15 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - else: <>With One Man Orchestra's guard down, {empName4} is able to lead the others closer to the Mortem.
    "Every audience member is a gift. Please, do remain seated for the performance." #game:changeticksound:2:0
    Being closest to One Man Orchestra now, the music strongly affects the leading employee. #game:changeticksound:0:0
    They take a massive amount of MIND damage. #employee:mentdamage:40:3 #game:playsound:3:0
    ~ mind4 -= 40 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    Even so, the distance has been closed. The Mortem's heart has been exposed.
    ~ approaches += 1
    -> GiveOrders
}


=== ReasonAssign ===
Who will try to reason with the Mortem?
+ {alive1} [{empName1}] -> Reason1
+ {alive2} [{empName2}] -> Reason2
+ {alive3} [{empName3}] -> Reason3
+ {alive4} [{empName4}] -> Reason4

=== Reason1 ===
{
    - mindStrength1 < 2: <>{empName1} tries their best to commune with the One Man Orchestra.
    However, due to their headphones and just how pervasive the sound is, they're utterly incomprehensible while speaking.
    The Orchestra continues, and {empName1} suffers MIND damage. #employee:mentdamage:10:0 #game:playsound:2:0
    ~ mind1 -= 10 * (1 - (0.12 * mindStrength1))
    -> check_conditions ->
    -> GiveOrders
    - reasonings > 0 and shotslanded == 0: <>{empName1} continues to try to speak with the One Man Orchestra. #game:mortemspritechange:1:0
    "My friend, if you truly wish to show your appreciation," #game:changeticksound:2:0
    "Why not join in?"
    They can feel a strong burning in their throat. The urge to rip it open is implanted in the back of their mind. #game:changeticksound:0:0
    {empName1} suffered BODY and MIND damage. #employee:mentdamage:10:0 #employee:physdamage:20:0 #game:mortemspritechange:0:0 #game:playsound:2:0
    ~ body1 -= 20
    ~ mind1 -= 10 * (1 - (0.12 * mindStrength1))
    -> check_conditions ->
    -> GiveOrders
    - shotslanded > 0: <>{empName1} attempts to commune further with the Mortem, only to be cut off.
    "I do apologize, dear listener." #game:changeticksound:2:0
    "But I simply cannot bear to hear your words over this newfound pain I am in."
    "Please, listen to mine instead."
    The One Man Orchestra conducts the music once more as their response, inflicting further MIND damage. #game:changeticksound:0:0 #employee:mentdamage:20:0 #game:playsound:2:0
    ~ mind1 -= 20 * (1 - (0.12 * mindStrength1))
    -> check_conditions ->
    -> GiveOrders
    - heart1 < 50: <>{empName1} bears their HEART to try and speak with the Mortem. #game:mortemspritechange:1:0
    They tell the Orchestra that its song is hurting people. That it's decimated the whole city.
    "Nonesense." #game:changeticksound:2:0
    "The city is beautiful now. It can hear the true sound of humanity."
    "I can think of no better way to live."
    ~ reasoningAttempts += 1
    For a moment, {empName1} almost believes the Mortems words, slipping past their mental defenses. #game:changeticksound:0:0 #employee:mentdamage:15:0 #game:mortemspritechange:0:0 #game:playsound:2:0
    ~ mind1 -= 15 * (1 - (0.12 * mindStrength1))
    -> check_conditions ->
    {
        - reasoningAttempts == 3: -> Unreasonable
        - else: -> GiveOrders
    }
    - else: <>{empName1} bears their HEART to try and speak with the Mortem.
    They ask the Orchestra why their song is so special, geniunely wishing to understand their intentions. #game:mortemspritechange:1:0
    "I'm so glad you've asked!" #game:changeticksound:2:0
    "It is not my song that is being performed."
    "I am merely an instrument of humanity, playing the song that lies within every man and woman across the world."
    "To hear the song of humanity is to know true happiness. Would you not agree?"
    There's a brief moment where it is fully invested in convincing {empName1} of its purpose. #game:changeticksound:0:0
    The pressure surrounding One Man Orchestra diminished. #game:mortemspritechange:0:0
    ~ reasonings += 1
    -> check_conditions ->
    -> GiveOrders
}

=== Reason2 ===
{
    - mindStrength2 < 2: <>{empName2} tries their best to commune with the One Man Orchestra.
    However, due to their headphones and just how pervasive the sound is, they're utterly incomprehensible while speaking.
    The Orchestra continues, and {empName1} suffers MIND damage. #employee:mentdamage:10:1 #game:playsound:2:0
    ~ mind2 -= 10 * (1 - (0.12 * mindStrength2))
    -> check_conditions ->
    -> GiveOrders
    - reasonings > 0 and shotslanded == 0: <>{empName2} continues to try to speak with the One Man Orchestra. #game:mortemspritechange:1:0
    "My friend, if you truly wish to show your appreciation," #game:changeticksound:2:0
    "Why not join in?"
    They can feel a strong burning in their throat. The urge to rip it open is implanted in the back of their mind. #game:changeticksound:0:0
    {empName2} suffered BODY and MIND damage. #employee:mentdamage:10:1 #employee:physdamage:20:1 #game:mortemspritechange:0:0 #game:playsound:2:0
    ~ body2 -= 20
    ~ mind2 -= 10 * (1 - (0.12 * mindStrength2))
    -> check_conditions ->
    -> GiveOrders
    - shotslanded > 0: <>{empName2} attempts to commune further with the Mortem, only to be cut off.
    "I do apologize, dear listener." #game:changeticksound:2:0
    "But I simply cannot bear to hear your words over this newfound pain I am in."
    "Please, listen to mine instead."
    The One Man Orchestra conducts the music once more as their response, inflicting further MIND damage. #game:changeticksound:0:0 #employee:mentdamage:20:1 #game:playsound:2:0
    ~ mind2 -= 20 * (1 - (0.12 * mindStrength2))
    -> check_conditions ->
    -> GiveOrders
    - heart2 < 50: <>{empName2} bears their HEART to try and speak with the Mortem. #game:mortemspritechange:1:0
    They tell the Orchestra that its song is hurting people. That it's decimated the whole city.
    "Nonesense." #game:changeticksound:2:0
    "The city is beautiful now. It can hear the true sound of humanity."
    "I can think of no better way to live."
    ~ reasoningAttempts += 1
    For a moment, {empName2} almost believes the Mortems words, slipping past their mental defenses. #game:changeticksound:0:0 #employee:mentdamage:15:1 #game:mortemspritechange:0:0 #game:playsound:2:0
    ~ mind2 -= 15 * (1 - (0.12 * mindStrength2))
    -> check_conditions ->
    {
        - reasoningAttempts == 3: -> Unreasonable
        - else: -> GiveOrders
    }
    - else: <>{empName2} bears their HEART to try and speak with the Mortem.
    They ask the Orchestra why their song is so special, geniunely wishing to understand their intentions. #game:mortemspritechange:1:0
    "I'm so glad you've asked!" #game:changeticksound:2:0
    "It is not my song that is being performed."
    "I am merely an instrument of humanity, playing the song that lies within every man and woman across the world."
    "To hear the song of humanity is to know true happiness. Would you not agree?"
    There's a brief moment where it is fully invested in convincing {empName2} of its purpose. #game:changeticksound:0:0
    The pressure surrounding One Man Orchestra diminished. #game:mortemspritechange:0:0
    ~ reasonings += 1
    -> check_conditions ->
    -> GiveOrders
}

=== Reason3 ===
{
    - mindStrength3 < 2: <>{empName3} tries their best to commune with the One Man Orchestra.
    However, due to their headphones and just how pervasive the sound is, they're utterly incomprehensible while speaking.
    The Orchestra continues, and {empName3} suffers MIND damage. #employee:mentdamage:10:2 #game:playsound:2:0
    ~ mind3 -= 10 * (1 - (0.12 * mindStrength3))
    -> check_conditions ->
    -> GiveOrders
    - reasonings > 0 and shotslanded == 0: <>{empName3} continues to try to speak with the One Man Orchestra. #game:mortemspritechange:1:0
    "My friend, if you truly wish to show your appreciation," #game:changeticksound:2:0
    "Why not join in?"
    They can feel a strong burning in their throat. The urge to rip it open is implanted in the back of their mind. #game:changeticksound:0:0
    {empName3} suffered BODY and MIND damage. #employee:mentdamage:10:2 #employee:physdamage:20:2 #game:mortemspritechange:0:0 #game:playsound:2:0
    ~ body3 -= 20
    ~ mind3 -= 10 * (1 - (0.12 * mindStrength3))
    -> check_conditions ->
    -> GiveOrders
    - shotslanded > 0: <>{empName3} attempts to commune further with the Mortem, only to be cut off.
    "I do apologize, dear listener." #game:changeticksound:2:0
    "But I simply cannot bear to hear your words over this newfound pain I am in."
    "Please, listen to mine instead."
    The One Man Orchestra conducts the music once more as their response, inflicting further MIND damage. #game:changeticksound:0:0 #employee:mentdamage:20:2 #game:playsound:2:0
    ~ mind3 -= 20 * (1 - (0.12 * mindStrength3))
    -> check_conditions ->
    -> GiveOrders
    - heart3 < 50: <>{empName3} bears their HEART to try and speak with the Mortem. #game:mortemspritechange:1:0
    They tell the Orchestra that its song is hurting people. That it's decimated the whole city.
    "Nonesense." #game:changeticksound:2:0
    "The city is beautiful now. It can hear the true sound of humanity."
    "I can think of no better way to live."
    ~ reasoningAttempts += 1
    For a moment, {empName3} almost believes the Mortems words, slipping past their mental defenses. #game:changeticksound:0:0 #employee:mentdamage:15:2 #game:mortemspritechange:0:0 #game:playsound:2:0
    ~ mind3 -= 15 * (1 - (0.12 * mindStrength3))
    -> check_conditions ->
    {
        - reasoningAttempts == 3: -> Unreasonable
        - else: -> GiveOrders
    }
    - else: <>{empName3} bears their HEART to try and speak with the Mortem.
    They ask the Orchestra why their song is so special, geniunely wishing to understand their intentions. #game:mortemspritechange:1:0
    "I'm so glad you've asked!" #game:changeticksound:2:0
    "It is not my song that is being performed."
    "I am merely an instrument of humanity, playing the song that lies within every man and woman across the world."
    "To hear the song of humanity is to know true happiness. Would you not agree?"
    There's a brief moment where it is fully invested in convincing {empName3} of its purpose. #game:changeticksound:0:0
    The pressure surrounding One Man Orchestra diminished. #game:mortemspritechange:0:0
    ~ reasonings += 1
    -> check_conditions ->
    -> GiveOrders
}

=== Reason4 ===
{
    - mindStrength4 < 2: <>{empName4} tries their best to commune with the One Man Orchestra.
    However, due to their headphones and just how pervasive the sound is, they're utterly incomprehensible while speaking.
    The Orchestra continues, and {empName4} suffers MIND damage. #employee:mentdamage:10:3 #game:playsound:2:0
    ~ mind4 -= 10 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - reasonings > 0 and shotslanded == 0: <>{empName4} continues to try to speak with the One Man Orchestra. #game:mortemspritechange:1:0
    "My friend, if you truly wish to show your appreciation," #game:changeticksound:2:0
    "Why not join in?"
    They can feel a strong burning in their throat. The urge to rip it open is implanted in the back of their mind. #game:changeticksound:0:0
    {empName4} suffered BODY and MIND damage. #employee:mentdamage:10:3 #employee:physdamage:20:3 #game:mortemspritechange:0:0 #game:playsound:2:0
    ~ body4 -= 20
    ~ mind4 -= 10 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - shotslanded > 0: <>{empName4} attempts to commune further with the Mortem, only to be cut off.
    "I do apologize, dear listener." #game:changeticksound:2:0
    "But I simply cannot bear to hear your words over this newfound pain I am in."
    "Please, listen to mine instead."
    The One Man Orchestra conducts the music once more as their response, inflicting further MIND damage. #game:changeticksound:0:0 #employee:mentdamage:20:3 #game:playsound:2:0
    ~ mind4 -= 20 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    -> GiveOrders
    - heart4 < 50: <>{empName4} bears their HEART to try and speak with the Mortem. #game:mortemspritechange:1:0
    They tell the Orchestra that its song is hurting people. That it's decimated the whole city.
    "Nonesense." #game:changeticksound:2:0
    "The city is beautiful now. It can hear the true sound of humanity."
    "I can think of no better way to live."
    ~ reasoningAttempts += 1
    For a moment, {empName4} almost believes the Mortems words, slipping past their mental defenses. #game:changeticksound:0:0 #employee:mentdamage:15:3 #game:mortemspritechange:0:0 #game:playsound:2:0
    ~ mind4 -= 15 * (1 - (0.12 * mindStrength4))
    -> check_conditions ->
    {
        - reasoningAttempts == 3: -> Unreasonable
        - else: -> GiveOrders
    }
    - else: <>{empName4} bears their HEART to try and speak with the Mortem.
    They ask the Orchestra why their song is so special, geniunely wishing to understand their intentions. #game:mortemspritechange:1:0
    "I'm so glad you've asked!" #game:changeticksound:2:0
    "It is not my song that is being performed."
    "I am merely an instrument of humanity, playing the song that lies within every man and woman across the world."
    "To hear the song of humanity is to know true happiness. Would you not agree?"
    There's a brief moment where it is fully invested in convincing {empName4} of its purpose. #game:changeticksound:0:0
    The pressure surrounding One Man Orchestra diminished. #game:mortemspritechange:0:0
    ~ reasonings += 1
    -> check_conditions ->
    -> GiveOrders
}


=== Unreasonable ===
The Mortems stature shifts slightly, almost seeming disappointed. #game:mortemspritechange:1:0
"It's such a shame you all cannot understand what beauty this is." #game:changeticksound:2:0
"Perhaps this shall enlighten you."
The One Man Orchestra's baton sways, and the music intensifies. Every employee took substantial MIND damage. #game:mortemspritechange:0:0 #game:changeticksound:0:0 #employee:mentdamage:25:0 {empCount > 1: #employee:mentdamage:25:1} {empCount > 2: #employee:mentdamage:25:2} {empCount > 3: #employee:mentdamage:25:3} #game:playsound:3:0
~ mind1 -= 25 * (1 - (0.12 * mindStrength1))
~ mind2 -= 25 * (1 - (0.12 * mindStrength2))
~ mind3 -= 25 * (1 - (0.12 * mindStrength3))
~ mind4 -= 25 * (1 - (0.12 * mindStrength4))
-> check_conditions ->
As the Mortem plays, it becomes lost in its music.
The pressure surrounding One Man Orchestra diminished.
~ reasonings += 1
-> GiveOrders

=== Retreat ===
At this point, it's better to cut losses and get out as quickly as possible.
Your employees fall back, descending the stairs at record pace.
They'll make it back to the Observatio, but the Mortem will continue to wreak havoc.

-> END

=== Capture ===
Finish the job.
+ [Capture] -> Conclusion


=== Conclusion ===
The damaged One Man Orchestra is finally silenced as the snare finds its mark.
One by one, their remaining arms fold back into their body, leaving just the base two to be bound.
{empCount == 1: {empName1} has to lug the Mortem all the way back downstairs on their own, much to their chagrin. | The remaining employees each work together to lug the Mortem all the way back downstairs.} #game:mortemdisappear:0:0
As they travel, they can hear One Man Orchestra still tapping out a melody to themselves, desperate to maintain that song.
However, for the most part, they are silent at last. They remain just as silent as they are transported all the way back. #game:backgrounddisappear:0:0
ONE MAN ORCHESTRA has been ACQUIRED.
(...or at least they would be in the full game.) #game:changeticksound:1:0
(Right now they aren't implemented, but later in development, you'll be able to manage One Man Orchestra just like the other Mortems.)
(For now, thank you for playtesting up to this point! Please let Alex know of any and all comments!)
-> END


=== Emp1Dead ===
~ alive1 = false
Unable to properly vocalize the song in their current form, {empName1} tears open their throat. #game:playsound:4:0
As they slump to the ground, they let out a beautiful gurgling sound, perfectly in-tune with the music. #employee:mentdamage:10:0 {empCount > 1: #employee:mentdamage:10:1} {empCount > 2: #employee:mentdamage:10:2} {empCount > 3: #employee:mentdamage:10:3} #employee:die:0:0
{
    - alive2 or alive3 or alive4: Their death leaves a heavy impact on their comrades, shaken to their cores.
    - else: -> loss
}
    ~ mind1 -= 10 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 10 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 10 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 10 * (1 - (0.12 * mindStrength4))
->->

=== Emp1Insane ===
~ alive1 = false
~ mind1 = 0
{empName1} can't take it anymore. They need to hear this music un-altered. #employee:mentdamage:100:0
They rip off their headphones and pull out their earplugs, the sound washing over them and claiming their mind in an instant.
Collapsing to the ground, they immediately become a Worshipper. #employee:mentdamage:6:0 {empCount > 1: #employee:mentdamage:6:1} {empCount > 2: #employee:mentdamage:6:2} {empCount > 3: #employee:mentdamage:6:3} #game:playsound:4:0 #employee:die:0:0
{
    - alive2 or alive3 or alive4: The others do their best to swallow their implanted envy and continue forward.
    - else: -> loss
}
    ~ mind1 -= 6 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 6 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 6 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 6 * (1 - (0.12 * mindStrength4))
->->

=== Emp2Dead ===
~ alive2 = false
Unable to properly vocalize the song in their current form, {empName2} tears open their throat. #game:playsound:4:0
As they slump to the ground, they let out a beautiful gurgling sound, perfectly in-tune with the music. #employee:mentdamage:10:0 {empCount > 1: #employee:mentdamage:10:1} {empCount > 2: #employee:mentdamage:10:2} {empCount > 3: #employee:mentdamage:10:3} #employee:die:0:1
{
    - alive1 or alive3 or alive4: Their death leaves a heavy impact on their comrades, shaken to their cores.
    - else: -> loss
}
    ~ mind1 -= 10 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 10 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 10 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 10 * (1 - (0.12 * mindStrength4))
->->

=== Emp2Insane ===
~ alive2 = false
~ mind2 = 0
{empName2} can't take it anymore. They need to hear this music un-altered. #employee:mentdamage:100:1
They rip off their headphones and pull out their earplugs, the sound washing over them and claiming their mind in an instant.
Collapsing to the ground, they immediately become a Worshipper. #employee:mentdamage:6:0 {empCount > 1: #employee:mentdamage:6:1} {empCount > 2: #employee:mentdamage:6:2} {empCount > 3: #employee:mentdamage:6:3} #game:playsound:4:0 #employee:die:0:1
{
    - alive1 or alive3 or alive4: The others do their best to swallow their implanted envy and continue forward.
    - else: -> loss
}
    ~ mind1 -= 6 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 6 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 6 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 6 * (1 - (0.12 * mindStrength4))
->->

=== Emp3Dead ===
~ alive3 = false
Unable to properly vocalize the song in their current form, {empName3} tears open their throat. #game:playsound:4:0
As they slump to the ground, they let out a beautiful gurgling sound, perfectly in-tune with the music. #employee:mentdamage:10:0 {empCount > 1: #employee:mentdamage:10:1} {empCount > 2: #employee:mentdamage:10:2} {empCount > 3: #employee:mentdamage:10:3} #employee:die:0:2
{
    - alive2 or alive1 or alive4: Their death leaves a heavy impact on their comrades, shaken to their cores.
    - else: -> loss
}
    ~ mind1 -= 10 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 10 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 10 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 10 * (1 - (0.12 * mindStrength4))
->->

=== Emp3Insane ===
~ alive3 = false
~ mind3 = 0
{empName3} can't take it anymore. They need to hear this music un-altered. #employee:mentdamage:100:2
They rip off their headphones and pull out their earplugs, the sound washing over them and claiming their mind in an instant.
Collapsing to the ground, they immediately become a Worshipper. #employee:mentdamage:6:0 {empCount > 1: #employee:mentdamage:6:1} {empCount > 2: #employee:mentdamage:6:2} {empCount > 3: #employee:mentdamage:6:3} #game:playsound:4:0 #employee:die:0:2
{
    - alive2 or alive1 or alive4: The others do their best to swallow their implanted envy and continue forward.
    - else: -> loss
}
    ~ mind1 -= 6 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 6 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 6 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 6 * (1 - (0.12 * mindStrength4))
->->

=== Emp4Dead ===
~ alive4 = false
Unable to properly vocalize the song in their current form, {empName4} tears open their throat. #game:playsound:4:0
As they slump to the ground, they let out a beautiful gurgling sound, perfectly in-tune with the music. #employee:mentdamage:10:0 {empCount > 1: #employee:mentdamage:10:1} {empCount > 2: #employee:mentdamage:10:2} {empCount > 3: #employee:mentdamage:10:3} #employee:die:0:4
{
    - alive2 or alive3 or alive1: Their death leaves a heavy impact on their comrades, shaken to their cores.
    - else: -> loss
}
    ~ mind1 -= 10 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 10 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 10 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 10 * (1 - (0.12 * mindStrength4))
->->

=== Emp4Insane ===
~ alive4 = false
~ mind4 = 0
{empName4} can't take it anymore. They need to hear this music un-altered. #employee:mentdamage:100:3
They rip off their headphones and pull out their earplugs, the sound washing over them and claiming their mind in an instant.
Collapsing to the ground, they immediately become a Worshipper. #employee:mentdamage:6:0 {empCount > 1: #employee:mentdamage:6:1} {empCount > 2: #employee:mentdamage:6:2} {empCount > 3: #employee:mentdamage:6:3} #game:playsound:4:0 #employee:die:0:4
{
    - alive2 or alive3 or alive1: The others do their best to swallow their implanted envy and continue forward.
    - else: -> loss
}
    ~ mind1 -= 6 * (1 - (0.12 * mindStrength1))
    ~ mind2 -= 6 * (1 - (0.12 * mindStrength2))
    ~ mind3 -= 6 * (1 - (0.12 * mindStrength3))
    ~ mind4 -= 6 * (1 - (0.12 * mindStrength4))
->->



=== earlyRetreat ===
{
    - empCount == 1: Before even reaching the Mortem, {empName1} finds themselves unable to continue.
    - else: Before even reaching the Mortem, your employees find themselves unable to continue.
}
Forfeiting their job prospects, they flee the site, leaving the Mortem to continue wreaking havoc.

-> END

=== loss ===
Nobody is left to attempt to acquire One Man Orchestra.
It plays on, either unaware or uncaring of the lives it has taken.

-> END

=== check_conditions ===
{
    - alive1 and body1 <= 0:
        -> Emp1Dead ->
    - alive1 and mind1 <= 25:
        -> Emp1Insane ->
    - alive2 and body2 <= 0:
        -> Emp2Dead ->
    - alive2 and mind2 <= 25:
        -> Emp2Insane ->
    - alive3 and body3 <= 0:
        -> Emp3Dead ->
    - alive3 and mind3 <= 25:
        -> Emp3Insane ->
    - alive4 and body4 <= 0:
        -> Emp4Dead ->
    - alive4 and mind4 <= 25:
        -> Emp4Insane ->
    - alive1 and mind1 < 50: {empName1}'s urge to remove their headphones grows stronger.
    - alive2 and mind2 < 50: {empName2}'s urge to remove their headphones grows stronger.
    - alive3 and mind3 < 50: {empName3}'s urge to remove their headphones grows stronger.
    - alive4 and mind4 < 50: {empName4}'s urge to remove their headphones grows stronger.
}
    
->->


=== lognums ===
{empName1} at {body1} and {mind1}
{empName2} at {body2} and {mind2}
{empName3} at {body3} and {mind3}
{empName4} at {body4} and {mind4}

->->