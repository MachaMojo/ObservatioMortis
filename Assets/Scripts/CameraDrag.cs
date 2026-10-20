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
    private float zoom;
    private float zoomMult = 4f;

    private float minZoom = 1.5f, maxZoom = 8f;
    private float velocity = 0f;
    private float smoothTime = 0.1f;

    void Awake()
    {
        mainCamera = Camera.main;
    }

    void Start()
    {
        zoom = mainCamera.orthographicSize;
        EstablishBounds();
    }

    private void Update()
    {
        float scroll = Input.GetAxis("Mouse ScrollWheel");
        zoom -= scroll * zoomMult;
        zoom = Mathf.Clamp(zoom, minZoom, maxZoom);
        mainCamera.orthographicSize = Mathf.SmoothDamp(mainCamera.orthographicSize, zoom, ref velocity, smoothTime);
        EstablishBounds();
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

    private void EstablishBounds()
    {
        var width = zoom * mainCamera.aspect;

        var minX = Globals.WorldBounds.min.x + width;
        var maxX = Globals.WorldBounds.extents.x - width;

        var minY = Globals.WorldBounds.min.y + zoom;
        var maxY = Globals.WorldBounds.extents.y - zoom;

        cameraBounds = new Bounds();
        cameraBounds.SetMinMax(new Vector3(minX, minY, 0.0f), new Vector3(maxX, maxY, 0.0f));

        targetPosition = GetCameraBounds();
        transform.position = targetPosition;
    }

    private Vector3 GetMousePosition() => mainCamera.ScreenToWorldPoint(Mouse.current.position.ReadValue());

}
