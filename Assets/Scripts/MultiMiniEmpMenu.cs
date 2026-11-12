using UnityEngine;
using System.Collections.Generic;
using System;
using UnityEngine.UI;
using TMPro;

public class MultiMiniEmpMenu : MonoBehaviour
{
    [SerializeField] private MultiMiniEntry miniEntryPrefab;
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

    public void CreateEntries()
    {
        foreach (Transform child in container)
        {
            Destroy(child.gameObject);
        }
        foreach (Employee employee in GameManager.Instance.employeeRoster)
        {
            //Debug.Log(employee.empName);
            MultiMiniEntry newEntry = Instantiate(miniEntryPrefab, container);
            newEntry.Setup(employee, this);
        }
    }

    public void Close()
    {
        AudioManager.Instance.Play(AudioManager.Instance.close);
        gameObject.SetActive(false);
    }
}
