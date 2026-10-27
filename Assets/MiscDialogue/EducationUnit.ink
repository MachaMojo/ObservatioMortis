VAR empName = ""
VAR body = 0
VAR mind = 0
VAR heart = 0
VAR bodyStrength = 0
VAR mindStrength = 0

-> main 

=== main ===
EDUCATION
{empName}'s views on Mortems seem to need adjustment.
How should they be viewed?
+ [Empathetically] -> Empathy
+ [Apathetically] -> Apathy


=== Empathy ===
{
    - heart >= 75: <>{empName} has already seen how warm Mortems can sometimes be.
    Although they are monsters, they were once human after all.
    It doesn't take much to guide them on how to empathize with Mortems even better.
    {empName}'s HEART sharply increased. #employee:adjustheart:30
    - heart >= 50: <>Although Mortems are largely to be feared, there are times when a warmer approach is better.
    {empName} is enlightened on how to better treat the Mortems in the Observatio's care.
    {empName}'s HEART increased. #employee:adjustheart:20
    - heart >= 25: <>{empName} has seen firsthand how horrific Mortems can behave.
    It takes some effort, but they eventually come around to understanding some of the more human aspects Mortems can take on.
    {empName}'s HEART increased. #employee:adjustheart:20
    - else: <>The mere idea of treating a Mortem with any form of kindness disgusts {empName}.
    Still, this apathy isn't always the best approach when dealing with these creatures.
    It'll take work to convince {empName} otherwise.
    {empName}'s HEART slightly increased. #employee:adjustheart:20
}
-> END


=== Apathy ===
{
    - heart >= 75: <>{empName} protests against how the Mortems are being depicted here.
    They firmly believe that Mortems aren't to be reviled, that there are still human qualities deep within.
    This level of empathy can be a dangerous thing in the Observatio.
    {empName}'s HEART slightly decreased. #employee:adjustheart:-20
    - heart >= 50: <>{empName} has seen how Mortems are occasionally able to resist their urges and live as normal.
    Despite this, more often than not, Mortems live by the only purpose of forcing living things to succumb to their same fate.
    {empName} is made well aware of this fact.
    {empName}'s HEART decreased. #employee:adjustheart:-20
    - heart >= 25: <>Having already seen how awful Mortems can be, {empName} takes todays education to heart.
    Hardening one's feelings towards even the most adorable Mortems is necessary to survive in this world.
    {empName}'s HEART decreased. #employee:adjustheart:-20
    - else: <>{empName} already understands full and well the true nature of Mortems.
    The sooner the world is rid of these monstrosities, the sooner humanity can return to some form of normalcy.
    {empName}'s HEART sharply decreased. #employee:adjustheart:-30
}
-> END