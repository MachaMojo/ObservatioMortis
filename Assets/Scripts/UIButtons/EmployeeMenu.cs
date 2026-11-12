using UnityEngine;

public class EmployeeMenu : MonoBehaviour
{
    public GameObject menu;
    
    private void Start()
    {
        menu.SetActive(false);
    }
    public void Open()
    {
        menu.SetActive(true);
        gameObject.SetActive(false);
        AudioManager.Instance.Play(AudioManager.Instance.select);
    }

}
