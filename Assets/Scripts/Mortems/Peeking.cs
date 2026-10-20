using System.Collections;
using Ink.Parsed;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Peeking : MortemBase
{
    public Sprite neutralSprite, specSprite1, specSprite2;
    public TextAsset inkJSON;
    private bool peek = false;
    public AudioSource audioSource;
    public AudioClip enterUnit;
    public AudioClip deathSFX;
    private bool wasIgnored;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Awake()
    {
        mortemName = "Peeking";
        mortemClass = "DEVOUT";
        //sprite = Resources.Load<Sprite>("Assets/Sprites/MitosisRabbit");
        //GetComponent<SpriteRenderer>().sprite = sprite;
        // minPhysDamage = 35;
        // maxPhysDamage = 45;
        // minMentDamage = 7;
        // maxMentDamage = 12;
        difficulty = 2;
        maxResearch = 150;
        maxMood = 4.9f;
        maxCleanliness = 5;
        cleanliness = 0;
        snapID = 2;
    }

    public void RollState()
    {
        if (wasIgnored)
        {
            peek = false;
            wasIgnored = false;
        }
        else
        {
            peek = Random.Range(0, 2) == 1;
        }
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
            gameObject.GetComponent<SpriteRenderer>().sprite = specSprite2;
        }
        else if (peek)
        {
            gameObject.GetComponent<SpriteRenderer>().sprite = specSprite1;
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
        DialogueManager.Instance.GetCurrentStory.variablesState["peek"] = peek;
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
            case "peekcheck":
                RollState();
                UpdateSprite();
                break;
            case "kill":
                audioSource.PlayOneShot(deathSFX);
                GameManager.Instance.currentEmployee.GetComponent<SpriteRenderer>().sprite = null;
                break;
            case "entry":
                audioSource.PlayOneShot(enterUnit);
                break;
            case "realize":
                realized = true;
                UpdateMood(5);
                break;
            case "ignore":
                wasIgnored = true;
                break;
        }
    }
    public override void AddResearch(float newResearch, Employee employee)
    {
        base.AddResearch(newResearch, employee);
    }
}
