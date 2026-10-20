using UnityEngine;

public class Dust : MonoBehaviour
{
    public SpriteRenderer dust1;
    public SpriteRenderer dust2;
    private float cleanliness;
    private float maxCleanliness;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        cleanliness = GameManager.Instance.currentMortem.GetCleanliness();
        maxCleanliness = GameManager.Instance.currentMortem.GetMaxCleanliness();
        Color c1 = dust1.color;
        c1.a = 1 - (cleanliness / maxCleanliness);
        dust1.color = c1;
        Color c2 = dust2.color;
        c2.a = 1 - (cleanliness / maxCleanliness);
        dust2.color = c2;
    }

}
