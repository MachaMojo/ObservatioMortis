using UnityEngine;

public class HealthStation : MonoBehaviour
{
    public GameObject snapper;
    public Employee employee;
    public Vector2 snapPoint;

    // Update is called once per frame
    void Start()
    {
        snapPoint = snapper.transform.position;
    }
    void OnCollisionEnter2D(Collision2D other)
    {
        Employee newemployee = other.gameObject.GetComponent<Employee>();
        if (newemployee != null)
        {
            newemployee.assignedUnit = gameObject;
        }
    }
    void OnCollisionExit2D(Collision2D other)
    {
        Employee newemployee = other.gameObject.GetComponent<Employee>();
        if (newemployee != null)
        {
            newemployee.assignedUnit = null;
        }
    }
    public void tick()
    {
        if (employee != null)
        {
            employee.FullRestore();
            Reset();
        }
    }
    public void Reset()
    {
        employee = null;
    }
}
