using UnityEngine;

public class SetWorldBounds : MonoBehaviour
{
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Awake()
    {
        var bounds = GetComponent<Collider2D>().bounds;
        Globals.WorldBounds = bounds;
    }
}
