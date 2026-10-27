using System.Collections;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using Unity.VisualScripting;
using UnityEngine.SceneManagement;

public class TrainingUnit : UnitBase
{
    private static TrainingUnit currentInstance;
    public GameObject empSnap;
    private Vector2 empSnapPoint;
    public GameObject employee = null;
    public Image empSprite;
    public TextAsset inkJSON;
    void Awake()
    {
        if (currentInstance != null && currentInstance.name == name)
        {
            Destroy(currentInstance.gameObject);
        }
        currentInstance = this;
        empSnapPoint = empSnap.transform.position;
        // GameObject existingObject = GameObject.Find(gameObject.name);
        // if (existingObject != null && existingObject != gameObject)
        // {
        //     Destroy(gameObject);
        //     return;
        // }
        DontDestroyOnLoad(gameObject);
    }

    public override void SetupEmp(Employee newEmployee)
    {
        empSprite.sprite = newEmployee.defaultSprite;
        newEmployee.assignedUnit = gameObject;
        employee = newEmployee.gameObject;
        GameManager.Instance.trainingQueue.Enqueue((this, employee));
    }

    public override void LoadUnit(GameObject employee)
    {
        if (employee != null)
        {
            GameManager.Instance.currentEmployee = employee.GetComponent<Employee>();
            GameManager.Instance.currentUnit = this;
            SceneManager.LoadScene("TrainingUnit");
        }
    }
    public override void PlayDialogue()
    {
        DialogueManager.Instance.EnterDialogueMode(inkJSON);
        GameManager.Instance.AddEmployeeToDialogue();
    }

    public Vector2 GetEmpSnap() => empSnapPoint;
}
