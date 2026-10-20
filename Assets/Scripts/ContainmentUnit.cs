using System.Collections;
using UnityEngine;
using TMPro;
// using Microsoft.Unity.VisualStudio.Editor;
using UnityEngine.UI;
using Unity.VisualScripting;

public class ContainmentUnit : MonoBehaviour
{
    public GameObject empSnap;
    private Vector2 empSnapPoint;
    public GameObject mortSnap;
    public GameObject heart;
    private Vector2 mortSnapPoint;
    public GameObject mortem;
    public GameObject employee = null;
    public TextMeshProUGUI label;
    public HealthbarUI researchBar;

    public Image empSprite;

    

    // Update is called once per frame
    void Awake()
    {
        empSnapPoint = empSnap.transform.position;
        mortSnapPoint = mortSnap.transform.position;
        mortem.transform.position = mortSnapPoint;
        mortem.GetComponent<MortemBase>().label = label;
        mortem.GetComponent<MortemBase>().researchBar = researchBar;
    }
    void Start()
    {
        heart.SetActive(mortem.GetComponent<MortemBase>().realized);
    }

    public void SetupEmp(Employee newEmployee)
    {
        empSprite.sprite = newEmployee.defaultSprite;
        newEmployee.assignedUnit = gameObject;
        employee = newEmployee.gameObject;
    }


    void OnCollisionEnter2D(Collision2D other)
    {
        if (other.gameObject.tag == "Employee" && employee == null)
        {
            other.gameObject.GetComponent<Employee>().snapPoint = empSnapPoint;
            employee = other.gameObject;
            other.gameObject.GetComponent<Employee>().assignedUnit = gameObject;
        }
        // Employee newemployee = other.gameObject.GetComponent<Employee>();
        // if (newemployee != null)
        // {
        //     newemployee.snapPoint = snapPoint;
        //     employee = other.gameObject;
        //     newemployee.assignedUnit = gameObject;
        // }
    }
    void OnCollisionExit2D(Collision2D other)
    {
        if (other.gameObject.tag == "Employee" && other.gameObject == employee.gameObject)
        {
            other.gameObject.GetComponent<Employee>().assignedUnit = null;
            employee = null;
            //mortem.Unassign();
        }
    }
    public void Activate()
    {
        //mortem.GetComponent<MortemBase>().LoadUnit(employee);
        GameManager.Instance.mortemQueue.Enqueue((mortem.GetComponent<MortemBase>(), employee));
    }

    public Vector2 GetEmpSnap() => empSnapPoint;
    public Vector2 GetMortSnap() => mortSnapPoint;
}
