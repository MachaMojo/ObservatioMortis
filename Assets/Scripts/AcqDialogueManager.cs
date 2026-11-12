using System.Collections.Generic;
using System.Collections;
using Ink.Runtime;
using TMPro;
using UnityEngine;
using System.Runtime.CompilerServices;

public class AcqDialogueManager : MonoBehaviour
{
    [SerializeField] private float typingSpeed = 0.02f;
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private GameObject[] choices;
    public AudioClip typingtick1;
    public AudioClip typingtickmote;
    public AudioClip typingtickomo;
    private AudioClip currentTick;
    private TextMeshProUGUI[] choicesText;
    private Story currentStory;
    private bool dialogueIsPlaying = false;
    private bool makingDecision = false;
    private bool canContinueToNextLine = false;
    private bool skipLine = false;
    private const string MORTEM_TAG = "mortem";
    private const string EMPLOYEE_TAG = "employee";
    private const string GAME_TAG = "game";

    private Coroutine displayLineCoroutine;

    private void Awake()
    {
        currentTick = typingtick1;
        GameManager.Instance.acqDialogueManager = this;
    }
    private void Start()
    {
        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach (GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
    }

    private void Update()
    {
        if (!dialogueIsPlaying)
        {
            return;
        }
        if (canContinueToNextLine && Input.GetKeyDown(KeyCode.E) && !makingDecision && !GameManager.Instance.paused)
        {
            ContinueStory();
            AudioManager.Instance.Play(AudioManager.Instance.advance);
        }
        else if (Input.GetKeyDown(KeyCode.E))
        {
            skipLine = true;
        }
    }
    public void ChangeTick(int id)
    {
        switch (id)
        {
            case 0:
                currentTick = typingtick1;
                break;
            case 1:
                currentTick = typingtickmote;
                break;
            case 2:
                currentTick = typingtickomo;
                break;
        }
    }

    public void EnterDialogueMode(TextAsset inkJSON)
    {
        currentStory = new Story(inkJSON.text);
        dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);
        ContinueStory();
    }
    private void ExitDialogueMode()
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
        dialogueText.text = "";
        GameManager.Instance.QueueContainment();
        // SceneManager.LoadScene("RabbitTest");
        // GameManager.Instance.currentEmployee = null;
        // GameManager.Instance.currentMortem = null;
    }
    private void ContinueStory()
    {
        if (currentStory.canContinue)
        {
            if (displayLineCoroutine != null)
            {
                StopCoroutine(displayLineCoroutine);
            }
            // dialogueText.text = currentStory.Continue();
            displayLineCoroutine = StartCoroutine(DisplayLine(currentStory.Continue()));
            HandleTags(currentStory.currentTags);
        }
        else
        {
            ExitDialogueMode();
        }
    }

    private IEnumerator DisplayLine(string line)
    {
        dialogueText.text = "";
        canContinueToNextLine = false;
        HideChoices();

        int i = 0;
        foreach (char letter in line.ToCharArray())
        {
            if (skipLine)
            {
                skipLine = false;
                dialogueText.text = line;
                break;
            }
            dialogueText.text += letter;
            if (i % 3 == 0)
            {
                AudioManager.Instance.Play(currentTick);
            }
            i++;
            yield return new WaitForSeconds(typingSpeed);
        }

        DisplayChoices();
        canContinueToNextLine = true;
    }

    private void HideChoices()
    {
        foreach (GameObject choiceButton in choices)
        {
            choiceButton.SetActive(false);
        }
    }

    private void HandleTags(List<string> currentTags)
    {
        foreach (string tag in currentTags)
        {
            string[] splitTag = tag.Split(':');
            string tagKey = splitTag[0].Trim();
            string tagValue = splitTag[1].Trim();
            float tagNum = float.Parse(splitTag[2].Trim());
            int tagEmpNum = int.Parse(splitTag[3].Trim());

            switch (tagKey)
            {
                // case MORTEM_TAG:
                //     GameManager.Instance.currentMortem.PassTag(tagValue, tagNum);
                //     break;
                case EMPLOYEE_TAG:
                    GameManager.Instance.acquisitionParty[tagEmpNum].PassTag(tagValue, tagNum);
                    break;
                case GAME_TAG:
                    GameManager.Instance.PassTag(tagValue, tagNum);
                    break;
            }

        }
    }

    private void DisplayChoices()
    {
        List<Choice> currentChoices = currentStory.currentChoices;
        int index = 0;
        if (currentChoices.Count > 0)
        {
            makingDecision = true;
        }
        else
        {
            makingDecision = false;
        }
        foreach (Choice choice in currentChoices) 
        {
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }

        for (int i = index; i < choices.Length; i++)
        {
            choices[i].gameObject.SetActive(false);
        }
        //StartCoroutine(SelectFirstChoice());
    }

    // private IEnumerator SelectFirstChoice()
    // {
    //     EventSystem.current.SetSelectedGameObject(null);
    //     yield return new WaitForEndOfFrame();
    //     EventSystem.current.SetSelectedGameObject(choices[0].gameObject);
    // }

    public void MakeChoice(int choiceIndex)
    {
        if (canContinueToNextLine)
        {
            currentStory.ChooseChoiceIndex(choiceIndex);
            AudioManager.Instance.Play(AudioManager.Instance.select);
            ContinueStory();
        }
    }
    public Story GetCurrentStory => currentStory;
}
