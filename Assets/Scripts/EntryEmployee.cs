using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class EntryEmployee : MonoBehaviour
{
    private Employee referenceEmp;
    //public GameObject iconRef;
    [SerializeField] private Image image;
    [SerializeField] private TextMeshProUGUI empName;
    [SerializeField] private TextMeshProUGUI body;
    [SerializeField] private TextMeshProUGUI mind;
    [SerializeField] private TextMeshProUGUI mindResilience;
    [SerializeField] private TextMeshProUGUI heart;
    public void Setup(Employee employee)
    {
        //iconRef.GetComponent<IconDrag>().employee = employee;
        referenceEmp = employee;
        image.sprite = employee.defaultSprite;
        empName.text = employee.empName;
        body.text = employee.body.ToString() + "/" + employee.maxBody.ToString();
        mind.text = SanityCheck(employee);
        mindResilience.text = ResilienceCheck(employee);
        heart.text = employee.heart.ToString() + "/" + employee.maxHeart.ToString();
    }

    private string SanityCheck(Employee employee)
    {
        if (75 < employee.mind)
        {
            return "Confident";
        }
        else if (50 < employee.mind && employee.mind <= 75)
        {
            return "Fair";
        }
        else if (25 < employee.mind && employee.mind <= 50)
        {
            return "Fraying";
        }
        else if (0 < employee.mind && employee.mind <= 25)
        {
            return "Broken";
        }
        else
        {
            return "Driven Insane";
        }
    }

    private string ResilienceCheck(Employee employee)
    {
        if (5 <= employee.mindResilience)
        {
            return "Impervious";
        }
        else if (4 <= employee.mindResilience && employee.mindResilience < 5)
        {
            return "Fortified";
        }
        else if (3 <= employee.mindResilience && employee.mindResilience < 4)
        {
            return "Resilient";
        }
        else if (2 <= employee.mindResilience && employee.mindResilience < 3)
        {
            return "Average";
        }
        else if (1 <= employee.mindResilience && employee.mindResilience < 2)
        {
            return "Weak";
        }
        else
        {
            return "Fragile";
        }
    }
}
