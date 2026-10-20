using System.Collections;
using Ink.Parsed;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Mote : MortemBase
{
    public Sprite neutralSprite, happySprite, sadSprite;
    public TextAsset inkJSON;
    public AudioSource audioSource;
    public AudioClip enterUnit;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Awake()
    {
        mortemName = "Mote";
        mortemClass = "ACOLYTE";
        //sprite = Resources.Load<Sprite>("Assets/Sprites/MitosisRabbit");
        //GetComponent<SpriteRenderer>().sprite = sprite;
        // minPhysDamage = 35;
        // maxPhysDamage = 45;
        // minMentDamage = 7;
        // maxMentDamage = 12;
        difficulty = 1;
        maxResearch = 100;
        maxMood = 4.9f;
        maxCleanliness = 4;
        cleanliness = 0;
        snapID = 1;
    }

    public override void LoadUnit(GameObject employee)
    {
        //DontDestroyOnLoad(gameObject);
        if (employee != null)
        {
            GameManager.Instance.currentEmployee = employee.GetComponent<Employee>();
        }
        GameManager.Instance.currentMortem = this;
        SceneManager.LoadScene("MitosisRabbitUnit");
    }
    public override void UpdateSprite()
    {
        if (mood < maxMood * 0.4f)
        {
            gameObject.GetComponent<SpriteRenderer>().sprite = sadSprite;
        }
        else
        {
            gameObject.GetComponent<SpriteRenderer>().sprite = neutralSprite;
        }
    }
    public override void PlayDialogue(bool empPresent)
    {
        DialogueManager.Instance.EnterDialogueMode(inkJSON);

        DialogueManager.Instance.GetCurrentStory.variablesState["mood"] = mood;
        DialogueManager.Instance.GetCurrentStory.variablesState["maxMood"] = maxMood;
        DialogueManager.Instance.GetCurrentStory.variablesState["clean"] = cleanliness;
        if (research >= maxResearch)
        {
            DialogueManager.Instance.GetCurrentStory.variablesState["studied"] = true;
        }
        if (!empPresent)
        {
            DialogueManager.Instance.GetCurrentStory.variablesState["employeePresent"] = false;
            return;
        }
        else
        {
            DialogueManager.Instance.GetCurrentStory.variablesState["employeePresent"] = true;
            GameManager.Instance.AddEmployeeToDialogue();
        }
    }
    public override void UpdateMood(float num)
    {
        base.UpdateMood(num);
    }
    public override void PassTag(string tag, float num = 0)
    {
        switch (tag)
        {
            case "moodupdate":
                UpdateMood(num);
                break;
            case "research":
                AddResearch(num, GameManager.Instance.currentEmployee);
                break;
            case "spriteupdate":
                UpdateSprite();
                break;
            case "realize":
                realized = true;
                UpdateMood(5);
                break;
            case "entry":
                audioSource.PlayOneShot(enterUnit);
                break;
            case "clean":
                cleanliness = maxCleanliness;
                break;
            case "soil":
                Soil(num);
                break;
        }
    }
    public override void AddResearch(float newResearch, Employee employee)
    {
        base.AddResearch(newResearch, employee);
    }
    public override void Soil(float clean)
    {
        base.Soil(clean);
    }
}
