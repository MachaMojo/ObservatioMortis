using UnityEngine;
using TMPro;
using Ink.Parsed;

public class MortemBase : MonoBehaviour
{
    protected string mortemName;
    protected string mortemClass;
    // protected float minPhysDamage, maxPhysDamage;
    // protected float minMentDamage, maxMentDamage;
    protected int difficulty;
    public TextMeshProUGUI label;
    // public TextMeshProUGUI moodIndicator;
    //public Employee assignedEmployee;
    protected float research, maxResearch;
    protected float mood;
    protected float maxMood;
    protected float cleanliness, maxCleanliness;
    public int snapID;
    public bool realized = false;
    public HealthbarUI researchBar;
    public Sprite icon;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    private void Start()
    {
        GameObject existingObject = GameObject.Find(gameObject.name);
        if (existingObject != null && existingObject != gameObject)
        {
            Destroy(gameObject);
            return;
        }
        DontDestroyOnLoad(gameObject);
        //GetComponent<SpriteRenderer>().sprite = sprite;
        label.text = mortemName + " - " + mortemClass;
        researchBar.SetMaxHealth(maxResearch);
        researchBar.SetHealth(0);
        mood = maxMood;
        cleanliness = maxCleanliness;
        // UpdateMoodMeter();
    }
    public virtual void LoadUnit(GameObject employee)
    {
        Debug.Log("No Mortem loaded!");
    }
    public virtual void UpdateSprite()
    {
        Debug.Log("No Mortem sprite loaded!");
    }
    public virtual void UpdateMood(float num)
    {
        mood += num;
        mood = Mathf.Clamp(mood, 0, maxMood);
        UpdateSprite();
    }
    public virtual void PlayDialogue(bool empPresent = false)
    {
        Debug.Log("No Mortem dialogue loaded!");
    }
    public virtual void PassTag(string tag, float num = 0)
    {
        Debug.Log("yummy tag");
    }
    public virtual float GetCleanliness() => cleanliness;
    public virtual float GetMaxCleanliness() => maxCleanliness;

    // public void Assign(Employee employee)
    // {
    //     assignedEmployee = employee;
    // }
    // public void Unassign()
    // {
    //     assignedEmployee = null;
    // }

    // Update is called once per frame
    // public void tick()
    // {
    //     if (assignedEmployee != null)
    //     {
    //         research += assignedEmployee.competence;
    //         AddResearch(10 + (assignedEmployee.competence * 5));
    //         mood += maxMood / 3;
    //         mood = Mathf.Clamp(mood, 0, maxMood);
    //         assignedEmployee.AddCompetence(0.15f * difficulty);
    //         assignedEmployee.SetPhysHealth(-Random.Range(minPhysDamage, maxPhysDamage));
    //         assignedEmployee.SetMentHealth(-Random.Range(minMentDamage, maxMentDamage));
    //         assignedEmployee.ResetSnap();
    //         //Unassign();
    //     }
    //     else
    //     {
    //         if (mood < maxMood / 3)
    //         {
    //             AddResearch(-(maxResearch / 5));
    //         }
    //         mood--;
    //         mood = Mathf.Clamp(mood, 0, maxMood);
    //     }
    //     UpdateMood();
    // }

    public virtual void AddResearch(float newResearch, Employee employee)
    {
        research += newResearch * (0.5f + (employee.competence - 1) * 0.25f);
        research = Mathf.Clamp(research, 0, maxResearch);
        if (researchBar != null)
        {
            researchBar.SetHealth(research);
        }
    }
    public virtual void Soil(float clean)
    {
        cleanliness -= clean;
        cleanliness = Mathf.Clamp(cleanliness, 0, maxCleanliness);
    }
    public virtual float GetMaxResearch() => maxResearch;
    public virtual float GetResearch() => research;
    public virtual string GetNameAndClass()
    {
        return mortemName + " - " + mortemClass;
    }
    // public void UpdateMoodMeter()
    // {
    //     if (mood >= 2 * maxMood / 3)
    //     {
    //         moodIndicator.text = "GOOD";
    //         moodIndicator.color = Color.darkGreen;
    //     }
    //     else if (maxMood / 3 <= mood && mood < 2 * maxMood / 3)
    //     {
    //         moodIndicator.text = "NEUTRAL";
    //         moodIndicator.color = Color.yellow;
    //     }
    //     else if (mood < maxMood / 3)
    //     {
    //         moodIndicator.text = "BAD";
    //         moodIndicator.color = Color.darkRed;
    //     }
    // }
}
