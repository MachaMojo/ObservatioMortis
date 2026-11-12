VAR empName = ""
VAR body = 0
VAR mind = 0
VAR heart = 0
VAR bodyStrength = 0
VAR mindStrength = 0

-> main 

=== main ===
RECOVERY
It seems that {empName} has endured quite a bit of damage.
Which should be restored?
+ [BODY] -> Body
+ [MIND] -> Mind


=== Body ===
{
    - bodyStrength >= 80: <>After all of their training, {empName} has tuned their body quite well.
    As a result, it takes even more effort to repair any damage.
    It's no longer perfect, but it's enough to get {empName} ready to get back to work.
    {empName}'s BODY was drastically restored. #employee:physdamage:-80
    - else: <>With sufficient medical care, even the most grevious of injuries can be repaired.
    Afterwards, {empName} is all patched up and ready to continue working.
    {empName}'s BODY was restored to max. #employee:physdamage:-80
}
-> END


=== Mind ===
Therapy works wonders for the mind, no matter the individual.
Although it won't be enough to forget every horror endured while working here, {empName} certainly feels a lot better.
{empName}'s MIND was restored to max. #employee:mentdamage:-200

-> END