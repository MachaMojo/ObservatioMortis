using System.Collections.Generic;
using System;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }

    // [Serializable]
    // public class EmployeeData
    // {
    //     public Sprite icon;
    //     // [TextArea(3, 8)]
    //     public string empName;
    //     public Employee employeeScript;
    // }
    //public List<EmployeeData> startingEmployees = new List<EmployeeData>();
    //[SerializeField] private List<GameObject> startingEmployees = new List<GameObject>();
    public List<Employee> employeeRoster = new List<Employee>();
    public List<MortemBase> mortemRoster = new List<MortemBase>();
    public Employee currentEmployee;
    public MortemBase currentMortem;
    public bool paused = false;
    public Queue<(MortemBase, GameObject)> mortemQueue = new Queue<(MortemBase, GameObject)>();


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

    // private void Start()
    // {
    //     foreach (Employee employee in employeeRoster)
    //     {
    //         Debug.Log(employee.empName);
    //     }
    // }
    public void Test(string line)
    {
        Debug.Log(line);
    }
    public void PassTag(string tag, float num = 0)
    {
        switch (tag)
        {
            case "kill":
                currentEmployee.GetComponent<SpriteRenderer>().sprite = currentEmployee.deadSprite;
                currentEmployee.SetPhysHealth(-1000);
                SceneManager.LoadScene("KillScreen", LoadSceneMode.Additive);
                break;            
        }
    }
    public Employee[] GetAllEmployees() => employeeRoster.ToArray();
    public MortemBase[] GetAllMortems() => mortemRoster.ToArray();

    public void AddEmployeeToDialogue()
    {
        DialogueManager.Instance.GetCurrentStory.variablesState["empPhysHealth"] 
        = currentEmployee.physHealth * (0.5f + (currentEmployee.competence * 0.25f));
        DialogueManager.Instance.GetCurrentStory.variablesState["empMentHealth"] 
        = currentEmployee.mentHealth * (0.5f + (currentEmployee.competence * 0.25f));
    }

    public void QueueContainment()
    {
        if (mortemQueue.Count == 0)
        {
            SceneManager.LoadScene("RabbitTest");
            currentEmployee = null;
            currentMortem = null;
        }
        else
        {
            (MortemBase mort, GameObject emp) = mortemQueue.Dequeue();
            currentMortem = mort;
            if (emp != null)
            {
                currentEmployee = emp.GetComponent<Employee>();
            }
            else
            {
                currentEmployee = null;
            }
            mort.GetComponent<MortemBase>().LoadUnit(emp);
            YEET();
        }
    }

    public void YEET()
    {
            foreach (Employee employee in employeeRoster)
        {
            if (employee != currentEmployee)
            {
                employee.gameObject.transform.position = new Vector3(-1000, -1000, 0);
            }
        }
        foreach (MortemBase mortem in mortemRoster)
        {
            if (mortem != currentMortem)
            {
                mortem.gameObject.transform.position = new Vector3(-1000, -1000, 0);
            }
        }
    }
    // public void LoadEmployees()
    // {
    //     foreach (Employee employee in employeeRoster)
    //     {
            
    //     }
    // }
}
