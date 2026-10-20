using System;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class MenuEmployee : MonoBehaviour
{
    [SerializeField] private EntryEmployee entryPrefab;
    [SerializeField] private Transform container;
    [SerializeField] private List<Employee> employees = new List<Employee>();

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

    private void CreateEntries()
    {
        foreach (Transform child in container)
        {
            Destroy(child.gameObject);
        }
        foreach (Employee employee in employees)
        {
            EntryEmployee newEntry = Instantiate(entryPrefab, container);
            newEntry.Setup(employee);
        }
        // foreach (var entry in entries)
        // {
        //     var newEntry = Instantiate(entryPrefab, container);
        //     // Call to newEntry, have it do its needed setup
        // }
    }
}
