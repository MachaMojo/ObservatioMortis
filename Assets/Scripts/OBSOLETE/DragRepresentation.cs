using System.Reflection;
using Microsoft.Unity.VisualStudio.Editor;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class DragRepresentation : MonoBehaviour, IPointerDownHandler
{
    public Sprite sprite;
    private Vector2 distance;
    public GameObject representation;
    public void OnPointerDown(PointerEventData eventData)
    {
        GameObject employeeRep = Instantiate(representation);
        employeeRep.transform.SetParent(GameObject.Find("WorldCanvas").transform);

        // distance = Camera.main.ScreenToWorldPoint(eventData.position) - transform.position;
        // Vector2 pointerPosition = Camera.main.ScreenToWorldPoint(eventData.position);
        // Vector2 newObjectPosition = pointerPosition - distance;
        // float z = transform.position.z;
        // employeeRep.transform.position = new Vector3 (newObjectPosition.x, newObjectPosition.y, z);
        //employeeRep.transform.position = Camera.main.ScreenToWorldPoint(eventData.position);

        employeeRep.transform.position = new Vector3 (Camera.main.ScreenToWorldPoint(eventData.position).x, 
        Camera.main.ScreenToWorldPoint(eventData.position).y, 
        0);
        employeeRep.GetComponent<UnityEngine.UI.Image>().sprite = sprite;

        employeeRep.GetComponent<UIDraggable>().OnBeginDrag(eventData);
    }
}
