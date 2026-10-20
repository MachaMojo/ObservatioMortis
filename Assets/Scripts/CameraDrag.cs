using UnityEditor;
using UnityEngine;
using UnityEngine.InputSystem;

public class CameraDrag : MonoBehaviour
{
    private Vector3 origin;
    private Vector3 difference;
    
    private Camera mainCamera;

    private bool dragging;

    private Bounds cameraBounds;
    private Vector3 targetPosition;

    void Awake()
    {
        mainCamera = Camera.main;
    }

    void Start()
    {
        var height = mainCamera.orthographicSize;
        var width = height * mainCamera.aspect;

        var minX = Globals.WorldBounds.min.x + width;
        var maxX = Globals.WorldBounds.extents.x - width;

        var minY = Globals.WorldBounds.min.y + height;
        var maxY = Globals.WorldBounds.extents.y - height;

        cameraBounds = new Bounds();
        cameraBounds.SetMinMax(new Vector3(minX, minY, 0.0f), new Vector3(maxX, maxY, 0.0f));
    }

    public void OnDrag(InputAction.CallbackContext ctx)
    {
        if (ctx.started)
        {
            origin = mainCamera.ScreenToWorldPoint(Mouse.current.position.ReadValue());            
        }
        dragging = ctx.started || ctx.performed;
    }

    private void LateUpdate()
    {
        if (!dragging) return;

        difference = GetMousePosition() - transform.position;

        targetPosition = origin - difference;
        targetPosition = GetCameraBounds();

        transform.position = targetPosition;

    }

    private Vector3 GetCameraBounds()
    {
        return new Vector3(
        Mathf.Clamp(targetPosition.x, cameraBounds.min.x, cameraBounds.max.x),
        Mathf.Clamp(targetPosition.y, cameraBounds.min.y, cameraBounds.max.y),
        transform.position.z
        );
    }

    private Vector3 GetMousePosition() => mainCamera.ScreenToWorldPoint(Mouse.current.position.ReadValue());

}
