using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Unity.VisualScripting;

public class MiniEntry : MonoBehaviour
{
    public Employee referenceEmp;
    //public GameObject iconRef;
    [SerializeField] private Image image;
    [SerializeField] private TextMeshProUGUI empName;
    private ContainmentUnit attachedUnit;
    private MiniEmpMenu empMenu;
    public void Setup(Employee employee, ContainmentUnit unit, MiniEmpMenu menu)
    {
        //iconRef.GetComponent<IconDrag>().employee = employee;
        referenceEmp = employee;
        attachedUnit = unit;
        empMenu = menu;
        empName.text = employee.empName;
        image.sprite = employee.defaultSprite;
    }

    public void Assign()
    {
        if (referenceEmp.assignedUnit == null)
        {
            attachedUnit.SetupEmp(referenceEmp);
            empMenu.Close();
        }
    }
}
