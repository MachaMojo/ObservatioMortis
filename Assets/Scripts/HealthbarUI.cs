using UnityEngine;
using UnityEngine.UI;

public class HealthbarUI : MonoBehaviour
{
    public float Health, MaxHealth, Width, Height;
    [SerializeField] RectTransform healthbar;

    public void SetMaxHealth(float maxHealth)
    {
        MaxHealth = maxHealth;
    }
    public void SetHealth(float health)
    {
        Health = health;
        float newWidth = Health / MaxHealth * Width;

        if (healthbar != null)
        {
            healthbar.sizeDelta = new Vector2(newWidth, Height);
        }
    }
    public void Goldify()
    {
        //healthbar.GetComponent<Image>().color = Color.gold;
    }
}
