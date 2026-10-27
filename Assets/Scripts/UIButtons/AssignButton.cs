using UnityEngine;

public class AssignButton : MonoBehaviour
{
    public GameObject menu;
    public UnitBase unit;
    
    private void Start()
    {
        menu.SetActive(false);
    }
    public void Open()
    {
        menu.SetActive(true);
        menu.GetComponent<MiniEmpMenu>().attachedUnit = unit;
        menu.GetComponent<MiniEmpMenu>().CreateEntries();
        gameObject.SetActive(false);
    }
}
