using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class MultiMiniEntry : MonoBehaviour
{
    private Employee referenceEmp;
    //public GameObject iconRef;
    [SerializeField] private Image image;
    [SerializeField] private TextMeshProUGUI empName;
    [SerializeField] private Image selectedIcon;
    [SerializeField] private MultiMiniEmpMenu empMenu;
    public bool toggled = false;
    public void Setup(Employee employee, MultiMiniEmpMenu menu)
    {
        selectedIcon.gameObject.SetActive(false);
        empMenu = menu;
        referenceEmp = employee;
        empName.text = employee.empName;
        image.sprite = employee.defaultSprite;
    }

    public void OnToggle()
    {
        if (toggled)
        {
            toggled = false;
            GameManager.Instance.acquisitionParty.Remove(referenceEmp);
            selectedIcon.gameObject.SetActive(false);
            
        }
        else if (GameManager.Instance.acquisitionParty.Count < 4)
        {
            toggled = true;
            GameManager.Instance.acquisitionParty.Add(referenceEmp);
            selectedIcon.gameObject.SetActive(true);
        }
        else
        {
            AudioManager.Instance.Play(AudioManager.Instance.invalid);
        }
    }
}
