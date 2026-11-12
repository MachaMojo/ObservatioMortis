using UnityEngine;
using System.Collections.Generic;
using Unity.VisualScripting;

public class InitializerNewEmp : MonoBehaviour
{
    [SerializeField] private GameObject employeePrefab;
    [SerializeField] private NameBank nameBank;
    [SerializeField] private TextAsset inkJSON;
    [SerializeField] private List<Sprite> iconSprites = new List<Sprite>();
    [SerializeField] private List<Sprite> unitSprites = new List<Sprite>();
    public GameObject employeePoint;
    void Start()
    {
        GameObject employeeObj;
        employeeObj = Instantiate(employeePrefab);
        Employee employee = employeeObj.GetComponent<Employee>();
        employee.empName = nameBank.GetName();
        
        int index = Random.Range(0, iconSprites.Count - 1);
        employee.defaultSprite = iconSprites[index];
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

        GameManager.Instance.employeeRoster.Add(employee);
        
        
        employeeObj.transform.position = employeePoint.transform.position;
        GameManager.Instance.currentEmployee = employeeObj.GetComponent<Employee>();
        DialogueManager.Instance.EnterDialogueMode(inkJSON);
        GameManager.Instance.AddEmployeeToDialogue();
        GameManager.Instance.currentEmployee.gameObject.GetComponent<SpriteRenderer>().sprite
         = GameManager.Instance.currentEmployee.unitSprite;
    }
}
