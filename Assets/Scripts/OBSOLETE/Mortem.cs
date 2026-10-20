using UnityEngine;
using TMPro;

public class Mortem : MonoBehaviour
{
    [SerializeField] string mortemName;
    [SerializeField] string mortemClass;
    [SerializeField] Sprite sprite;
    [SerializeField] float minPhysDamage, maxPhysDamage;
    [SerializeField] float minMentDamage, maxMentDamage;
    [SerializeField] int difficulty;
    public TextMeshProUGUI label;
    public TextMeshProUGUI moodIndicator;
    public Employee assignedEmployee;
    public float research, maxResearch;
    public float mood;
    [SerializeField] private float maxMood;
    [SerializeField] private HealthbarUI researchBar;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        GetComponent<SpriteRenderer>().sprite = sprite;
        label.text = mortemName + " - " + mortemClass;
        researchBar.SetMaxHealth(maxResearch);
        researchBar.SetHealth(0);
        mood = maxMood;
        UpdateMood();
    }

    public void Assign(Employee employee)
    {
        assignedEmployee = employee;
    }
    public void Unassign()
    {
        assignedEmployee = null;
    }

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
    //         Unassign();
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

    public void AddResearch(float newResearch)
    {
        research += newResearch;
        research = Mathf.Clamp(research, 0, maxResearch);

        researchBar.SetHealth(research);
    }
    public void UpdateMood()
    {
        if (mood >= 2 * maxMood / 3)
        {
            moodIndicator.text = "GOOD";
            moodIndicator.color = Color.darkGreen;
        }
        else if (maxMood / 3 <= mood && mood < 2 * maxMood / 3)
        {
            moodIndicator.text = "NEUTRAL";
            moodIndicator.color = Color.yellow;
        }
        else if (mood < maxMood / 3)
        {
            moodIndicator.text = "BAD";
            moodIndicator.color = Color.darkRed;
        }
    }
}
