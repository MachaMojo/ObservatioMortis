using System.Collections.Generic;
using UnityEngine;

public class AcqInitializer : MonoBehaviour
{
    [SerializeField] AcqDialogueManager dialogueManager;
    public bool isIntro;
    public bool isAcqIntro;
    void Start()
    {
        PlayDialogue();
    }

    public void PlayDialogue()
    {
        if (isIntro)
        {
            dialogueManager.EnterDialogueMode(GameManager.Instance.introFile);
        }
        else if (isAcqIntro)
        {
            dialogueManager.EnterDialogueMode(GameManager.Instance.acqIntroFile);
        }
        else
        {
            dialogueManager.EnterDialogueMode(GameManager.Instance.acqFile);
            GameManager.Instance.AddAllEmployeesToDialogue();
        }
    }
}
