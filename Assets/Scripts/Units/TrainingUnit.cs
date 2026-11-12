using System.Collections;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using Unity.VisualScripting;
using UnityEngine.SceneManagement;

public class TrainingUnit : UnitBase
{
    // private static TrainingUnit currentInstance;
    public GameObject empSnap;
    private Vector2 empSnapPoint;
    public GameObject employee = null;
    [SerializeField] private Sprite emptySprite;
    public Image employeeSprite;
    public TextAsset inkJSON;
    void Awake()
    {
        GameObject existingObject = GameObject.Find(gameObject.name);
        if (existingObject != null && existingObject != gameObject)
        {
            Destroy(gameObject);
            return;
        }
        empSnapPoint = empSnap.transform.position;
        // GameObject existingObject = GameObject.Find(gameObject.name);
        // if (existingObject != null && existingObject != gameObject)
        // {
        //     Destroy(existingObject.gameObject);
        //     return;
        // }
        DontDestroyOnLoad(gameObject);
    }

    public override void SetupEmp(Employee newEmployee)
    {
        employeeSprite.sprite = newEmployee.defaultSprite;
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

    public override void Reset()
    {
        if (employee != null && employee.GetComponent<Employee>() != null)
        {
            employeeSprite.sprite = emptySprite;
            employee.GetComponent<Employee>().assignedUnit = null;
        }
        employee = null;
    }

    public Vector2 GetEmpSnap() => empSnapPoint;
}
