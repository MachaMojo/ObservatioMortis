using UnityEngine;

public class AcqUnitBase : MonoBehaviour
{
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        if (GameManager.Instance.dayCount < 3)
        {
            Destroy(gameObject);
        }
    }
}
