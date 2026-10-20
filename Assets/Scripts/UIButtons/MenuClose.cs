using UnityEngine;

public class MenuClose : MonoBehaviour
{
    public GameObject menu;
    public GameObject opener;
    
    public void Close()
    {
        menu.SetActive(false);
        opener.SetActive(true);
    }
}
