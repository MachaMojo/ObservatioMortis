using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class DialogueManager : MonoBehaviour
{
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private GameObject[] choices;
    private TextMeshProUGUI[] choicesText;
    private Story currentStory;
    private bool dialogueIsPlaying = false;
    private bool makingDecision = false;

    private const string MORTEM_TAG = "mortem";
    private const string EMPLOYEE_TAG = "employee";
    private const string GAME_TAG = "game";
    public AudioManager audioManager;

    public static DialogueManager Instance { get; private set; }
    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);
    }
    private void Start()
    {
        dialoguePanel.SetActive(false);
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
        if (Input.GetKeyDown(KeyCode.E) && !makingDecision && !GameManager.Instance.paused)
        {
            ContinueStory();
            audioManager.Play(audioManager.advance);
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
            dialogueText.text = currentStory.Continue();
            DisplayChoices();
            HandleTags(currentStory.currentTags);
        }
        else
        {
            ExitDialogueMode();
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

            switch (tagKey)
            {
                case MORTEM_TAG:
                    GameManager.Instance.currentMortem.PassTag(tagValue, tagNum);
                    break;
                case EMPLOYEE_TAG:
                    GameManager.Instance.currentEmployee.PassTag(tagValue, tagNum);
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
        currentStory.ChooseChoiceIndex(choiceIndex);
        audioManager.Play(audioManager.select);
        ContinueStory();
    }
    public Story GetCurrentStory => currentStory;
}
