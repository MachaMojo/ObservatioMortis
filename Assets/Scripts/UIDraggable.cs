using UnityEngine;
using UnityEngine.EventSystems;

public class UIDraggable : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler
{
    private Vector2 distance;
    private Transform parentTransform;
    public void OnBeginDrag(PointerEventData eventData)
    {
        distance = Camera.main.ScreenToWorldPoint(eventData.position) - transform.position;
        parentTransform = transform.parent;
        transform.SetParent(transform.root);
        transform.SetAsLastSibling();
    }

    public void OnDrag(PointerEventData eventData)
    {
        Vector2 pointerPosition = Camera.main.ScreenToWorldPoint(eventData.position);
        Vector2 newObjectPosition = pointerPosition - distance;
        float z = transform.position.z;
        transform.position = new Vector3 (newObjectPosition.x, newObjectPosition.y, z);
        // transform.position = Input.mousePosition;
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        //transform.SetParent(parentTransform);
    }
}
