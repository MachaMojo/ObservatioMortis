using System;
using System.Collections.Generic;
using UnityEngine;

public class AcqManager : MonoBehaviour
{
    [SerializeField] private AcqEntry entryPrefab;
    [SerializeField] private Transform container;
    [SerializeField] private GameObject selectionMenu;
    [Serializable]
    public class EntryInfos
    {
        public Sprite icon;
        [TextArea(3, 8)] public string Text;
    }
    [SerializeField] private List<EntryInfos> entries = new List<EntryInfos>();

    private void Start()
    {
        CreateEntries();
    }

    private void CreateEntries()
    {
        foreach (Transform child in container)
        {
            Destroy(child.gameObject);
        }
        foreach (var entry in entries)
        {
            AcqEntry newEntry = Instantiate(entryPrefab, container);
            newEntry.Setup(entry.icon, entry.Text, selectionMenu);
        }
    }
}
