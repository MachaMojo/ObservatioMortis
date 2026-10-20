using UnityEngine;

public class AssignmentSceneLoader : MonoBehaviour
{
    public GameObject[] empSpawns;
    public GameObject[] containmentUnits;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        int index = 0;
        foreach (Employee employee in GameManager.Instance.GetAllEmployees())
        {
            employee.transform.position = empSpawns[index].transform.position;
            if (employee.isDead)
            {
                employee.GetComponent<SpriteRenderer>().sprite = employee.deadSprite;
            }
            else
            {
                employee.GetComponent<SpriteRenderer>().sprite = employee.defaultSprite;
            }
            index++;
        }
        index = 0;
        foreach (MortemBase mortem in GameManager.Instance.GetAllMortems())
        {
            containmentUnits[index].GetComponent<ContainmentUnit>().mortem = mortem.gameObject;
            mortem.label = containmentUnits[index].GetComponent<ContainmentUnit>().label;
            mortem.researchBar = containmentUnits[index].GetComponent<ContainmentUnit>().researchBar;
            containmentUnits[index].GetComponent<ContainmentUnit>().label.text = mortem.GetNameAndClass();
            mortem.researchBar.SetMaxHealth(mortem.GetMaxResearch());
            mortem.researchBar.SetHealth(mortem.GetResearch());
            // if (mortem.realized)
            // {
            //     mortem.researchBar.Goldify();
            // }
            //mortem.AddResearch(0);
            mortem.GetComponent<SpriteRenderer>().sprite = mortem.icon;
            mortem.transform.position = 
            containmentUnits[index].GetComponent<ContainmentUnit>().GetMortSnap();
            index++;
        }
    }
    public void Queue()
    {
        for (int i = 0; i < containmentUnits.Length; i++)
        {
            containmentUnits[i].GetComponent<ContainmentUnit>().Activate();
        }
    }
}
