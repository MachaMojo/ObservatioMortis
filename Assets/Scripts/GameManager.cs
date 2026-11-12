using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEditor.Experimental.GraphView;
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
    // public List<GameObject> startingEmployees = new List<GameObject>();
    [SerializeField] private GameObject employeePrefab;
    [SerializeField] private NameBank nameBank;
    public List<Employee> employeeRoster = new List<Employee>();
    public List<Employee> acquisitionParty = new List<Employee>();
    public List<MortemBase> mortemRoster = new List<MortemBase>();
    public List<UnitBase> unitRoster = new List<UnitBase>();
    [SerializeField] private List<Sprite> baseSprites = new List<Sprite>();
    [SerializeField] private List<Sprite> unitSprites = new List<Sprite>();
    public Employee currentEmployee;
    public MortemBase currentMortem;
    public UnitBase currentUnit;
    public TextAsset acqFile;
    public TextAsset introFile;
    public TextAsset acqIntroFile;
    public int dayCount = 0;
    public bool paused = false;
    public Queue<(MortemBase, GameObject)> mortemQueue = new Queue<(MortemBase, GameObject)>();
    public Queue<(UnitBase, GameObject)> trainingQueue = new Queue<(UnitBase, GameObject)>();
    public AcqDialogueManager acqDialogueManager;
    private bool checkedAcq = false;
    private bool skipChecks = false;
    private bool tutorialPlayed = false;


    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);

        for (int i = 0; i < 3; i++)
        {
            GameObject employeeObj = Instantiate(employeePrefab);
            Employee employee = employeeObj.GetComponent<Employee>();
            employee.empName = nameBank.GetName();
        
            int index = Random.Range(0, baseSprites.Count - 1);
            employee.defaultSprite = baseSprites[index];
            employee.unitSprite = unitSprites[index];
            employee.stressedSprite = unitSprites[index];
            employee.deadSprite = unitSprites[index];

            employee.body = Random.Range(50, 75);
            employee.maxBody = employee.body;
            employee.mind = 100;
            employee.maxMind = 100;
            employee.mindResilience = Random.Range(0.0f, 2.0f);
            employee.heart = Random.Range(25, 75);
            employee.maxHeart = 100;

            employeeRoster.Add(employee);
        }
    }

    private void Start()
    {
        if (!tutorialPlayed)
        {
            tutorialPlayed = true;
            skipChecks = true;
            currentEmployee = null;
            YEET();
            SceneManager.LoadScene("MoteIntro");
        }
    }
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
            case "backgroundappear":
                GameObject.Find("MortemBackground").GetComponent<FadeIn>().Appear();
                break;
            case "backgrounddisappear":
                GameObject.Find("MortemBackground").GetComponent<FadeIn>().Disappear();
                break;
            case "mortemappear":
                GameObject.Find("MortemSprite").GetComponent<FadeIn>().Appear();
                break;
            case "mortemdisappear":
                GameObject.Find("MortemSprite").GetComponent<FadeIn>().Disappear();
                break;
            case "mortemspritechange":
                GameObject.Find("MortemSprite").GetComponent<SpriteHolder>().ChangeSprite(Mathf.RoundToInt(num));
                break;
            case "changeticksound":
                acqDialogueManager.ChangeTick(Mathf.RoundToInt(num));
                break;
            case "shiftmote":
                GameObject.Find("MortemHolder").transform.position -= new Vector3(5, 0, 0);
                break;
            case "unshiftmote":
                GameObject.Find("MortemHolder").transform.position += new Vector3(5, 0, 0);
                break;
            case "playsound":
                AudioManager.Instance.PlayID(Mathf.RoundToInt(num));
                break;                  
        }
    }
    public Employee[] GetAllEmployees() => employeeRoster.ToArray();
    public MortemBase[] GetAllMortems() => mortemRoster.ToArray();
    public UnitBase[] GetAllUnits() => unitRoster.ToArray();

    public void AddEmployeeToDialogue()
    {
        DialogueManager.Instance.GetCurrentStory.variablesState["body"]
        = currentEmployee.body;
        DialogueManager.Instance.GetCurrentStory.variablesState["mind"]
        = currentEmployee.mind;
        DialogueManager.Instance.GetCurrentStory.variablesState["heart"]
        = currentEmployee.heart;
        DialogueManager.Instance.GetCurrentStory.variablesState["empName"]
        = currentEmployee.empName;
        DialogueManager.Instance.GetCurrentStory.variablesState["bodyStrength"]
        = currentEmployee.maxBody;
        DialogueManager.Instance.GetCurrentStory.variablesState["mindStrength"]
        = currentEmployee.mindResilience;
    }

    public void AddAllEmployeesToDialogue()
    {
        for (int i = 1; i < acquisitionParty.Count + 1; i++)
        {
            string tempTerm = i.ToString();
            acqDialogueManager.GetCurrentStory.variablesState["body" + tempTerm] 
            = acquisitionParty[i - 1].body;
            acqDialogueManager.GetCurrentStory.variablesState["mind" + tempTerm] 
            = acquisitionParty[i - 1].mind;
            acqDialogueManager.GetCurrentStory.variablesState["heart" + tempTerm] 
            = acquisitionParty[i - 1].heart;
            acqDialogueManager.GetCurrentStory.variablesState["empName" + tempTerm] 
            = acquisitionParty[i - 1].empName;
            acqDialogueManager.GetCurrentStory.variablesState["bodyStrength" + tempTerm] 
            = acquisitionParty[i - 1].maxBody;
            acqDialogueManager.GetCurrentStory.variablesState["mindStrength" + tempTerm] 
            = acquisitionParty[i - 1].mindResilience;
            acqDialogueManager.GetCurrentStory.variablesState["empCount"] = i;
        }
    }

    public void QueueContainment()
    {
        if (skipChecks)
        {
            skipChecks = false;
            currentEmployee = null;
            YEET();
            SceneManager.LoadScene("RabbitTest");
        }
        else if (mortemQueue.Count == 0)
        {
            if (trainingQueue.Count == 0)
            {
                if (acquisitionParty.Count > 0 && !checkedAcq)
                {
                    checkedAcq = true;
                    SceneManager.LoadScene("Acquisition");
                    YEET();
                }
                else
                {
                    checkedAcq = false;
                    EndDay();
                }
            }
            else
            {
                currentMortem = null;
                (UnitBase unit, GameObject emp) = trainingQueue.Dequeue();
                currentUnit = unit;
                if (emp != null)
                {
                    currentEmployee = emp.GetComponent<Employee>();
                }
                else
                {
                    currentEmployee = null;
                }
                unit.LoadUnit(emp);
                YEET();
            }
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

    public void EndDay()
    {
        currentEmployee = null;
        currentMortem = null;
        currentUnit = null;
        acquisitionParty = new List<Employee>();
        dayCount++;
        YEET();
        if (dayCount == 3)
        {
            skipChecks = true;
            SceneManager.LoadScene("MoteAcqIntro");
        }
        else if (dayCount % 2 == 0)
        {
            skipChecks = true;
            SceneManager.LoadScene("NewEmp");
        }
        else
        {
            SceneManager.LoadScene("RabbitTest");
        }
    }

    private void HireNewEmployee()
    {
        // TODO: FLESH THIS OUT WITH THE EXAMPLE EMPLOYEES
        // GameObject newEmp = Instantiate(employeeTemplate);
        // newEmp.GetComponent<Employee>().empName = nameBank.GetName();
        // newEmp.GetComponent<Employee>().body = 50;
        // newEmp.GetComponent<Employee>().maxBody = 50;
        // newEmp.GetComponent<Employee>().body = 50;
        // newEmp.GetComponent<Employee>().body = 50;
        // newEmp.GetComponent<Employee>().body = 50;
        // employeeRoster.Add(newEmp.GetComponent<Employee>());
    }
    // public void LoadEmployees()
    // {
    //     foreach (Employee employee in employeeRoster)
    //     {
            
    //     }
    // }
}
