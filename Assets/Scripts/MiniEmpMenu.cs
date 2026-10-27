using System;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class MiniEmpMenu : MonoBehaviour
{
    [SerializeField] private MiniEntry miniEntryPrefab;
    [SerializeField] private Transform container;
    [SerializeField] private List<Employee> employees = new List<Employee>();
    public UnitBase attachedUnit;
    public GameObject opener;

    [Serializable]
    public class EntryInfos
    {
        public Sprite icon;
        // [TextArea(3, 8)]
        public string empName;
    }
    
    [SerializeField] private List<EntryInfos> entries = new List<EntryInfos>();

    private void Start()
    {
        employees = GameManager.Instance.employeeRoster;
        CreateEntries();
    }

    public void CreateEntries()
    {
        foreach (Transform child in container)
        {
            Destroy(child.gameObject);
        }
        foreach (Employee employee in GameManager.Instance.employeeRoster)
        {
            //Debug.Log(employee.empName);
            MiniEntry newEntry = Instantiate(miniEntryPrefab, container);
            newEntry.Setup(employee, attachedUnit, this);
        }
    }

    public void Close()
    {
        gameObject.SetActive(false);
        opener.SetActive(true);
    }
}
