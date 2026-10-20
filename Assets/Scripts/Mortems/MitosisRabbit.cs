using System.Collections;
using Ink.Parsed;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MitosisRabbit : MortemBase
{
    public Sprite happySprite, neutralSprite, sadSprite, specSprite1, specSprite2, specSprite3, specSprite4;
    public TextAsset inkJSON;
    public AudioSource audioSource;
    public AudioClip enterUnit;
    public AudioClip deathSFX;
    private int copies = 0;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Awake()
    {
        mortemName = "Mitosis Rabbit";
        mortemClass = "BISHOP";
        //sprite = Resources.Load<Sprite>("Assets/Sprites/MitosisRabbit");
        //GetComponent<SpriteRenderer>().sprite = sprite;
        // minPhysDamage = 35;
        // maxPhysDamage = 45;
        // minMentDamage = 7;
        // maxMentDamage = 12;
        difficulty = 3;
        maxResearch = 200;
        maxMood = 2.9f;
        maxCleanliness = 5;
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
        if (copies == 1)
        {
            gameObject.GetComponent<SpriteRenderer>().sprite = specSprite1;
        }
        else if (copies == 2)
        {
            gameObject.GetComponent<SpriteRenderer>().sprite = specSprite2;
        }
        else if (copies == 3)
        {
            gameObject.GetComponent<SpriteRenderer>().sprite = specSprite3;
        }
        else if (copies >= 4)
        {
            gameObject.GetComponent<SpriteRenderer>().sprite = specSprite4;
        }
        else if (mood <= maxMood * 0.4f)
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
        DialogueManager.Instance.GetCurrentStory.variablesState["copies"] = copies;
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
            case "multiply":
                copies++;
                break;
            case "moodupdate":
                UpdateMood(num);
                break;
            case "research":
                AddResearch(num, GameManager.Instance.currentEmployee);
                break;
            case "spriteupdate":
                UpdateSprite();
                break;
            case "cull":
                copies = 0;
                UpdateSprite();
                break;
            case "kill":
                audioSource.PlayOneShot(deathSFX);
                break;
            case "entry":
                audioSource.PlayOneShot(enterUnit);
                break;
            case "realize":
                realized = true;
                UpdateMood(3);
                break;
        }
    }
    public override void AddResearch(float newResearch, Employee employee)
    {
        base.AddResearch(newResearch, employee);
    }

}
