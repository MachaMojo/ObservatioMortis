using UnityEngine;

public class InitializerTraining : MonoBehaviour
{
    private Employee employee;
    public GameObject employeePoint;
    public UnitBase unit;
    void Start()
    {
        unit = GameManager.Instance.currentUnit;       
        if (GameManager.Instance.currentEmployee != null)
        {
            employee = GameManager.Instance.currentEmployee;
            employee.gameObject.GetComponent<SpriteRenderer>().sprite = employee.defaultSprite;
            employee.gameObject.transform.position = employeePoint.transform.position;
            unit.PlayDialogue();
        }
    }
}
