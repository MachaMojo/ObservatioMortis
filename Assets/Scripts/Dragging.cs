using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

public class Dragging : MonoBehaviour, IPointerDownHandler, IDragHandler, IPointerUpHandler
{
    private Vector2 distance;
    private Employee employee;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    private void Start()
    {
        if (GetComponent<Employee>() != null)
        {
            employee = GetComponent<Employee>();
        }   
    }

    public void OnPointerDown(PointerEventData eventData) 
    {
        if (!employee.isDead) {
            distance = Camera.main.ScreenToWorldPoint(eventData.position) - transform.position;
            employee.Moving();
        }
    }
    public void OnDrag(PointerEventData eventData)
    {
        if (!employee.isDead)
        {
            Vector2 pointerPosition = Camera.main.ScreenToWorldPoint(eventData.position);
            Vector2 newObjectPosition = pointerPosition - distance;
            float z = transform.position.z;
            transform.position = new Vector3 (newObjectPosition.x, newObjectPosition.y, z);
        }
    }
    public void OnPointerUp(PointerEventData eventData)
    {
        employee.Stopped();
    }
}
