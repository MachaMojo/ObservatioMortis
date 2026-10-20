using UnityEngine;
using TMPro;

public class MiniEntry : MonoBehaviour
{
    private Employee referenceEmp;
    //public GameObject iconRef;
    [SerializeField] private TextMeshProUGUI empName;
    public void Setup(Employee employee)
    {
        //iconRef.GetComponent<IconDrag>().employee = employee;
        referenceEmp = employee;
        empName.text = employee.empName;
    }
}
