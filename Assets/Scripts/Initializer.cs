using UnityEngine;

public class Initializer : MonoBehaviour
{
    private Employee employee;
    private MortemBase mortem;
    public GameObject employeePoint;
    public GameObject mortemPoint1;
    public GameObject mortemPoint2;
    void Start()
    {
        mortem = GameManager.Instance.currentMortem;
        mortem.UpdateSprite();
        switch (mortem.snapID)
        {
            case 1:
                mortem.gameObject.transform.position = mortemPoint1.transform.position;
                break;
            case 2:
                mortem.gameObject.transform.position = mortemPoint2.transform.position;
                break;
        }

        
        if (GameManager.Instance.currentEmployee != null)
        {
            employee = GameManager.Instance.currentEmployee;
            employee.gameObject.GetComponent<SpriteRenderer>().sprite = employee.unitSprite;
            employee.gameObject.transform.position = employeePoint.transform.position;
            mortem.PlayDialogue(true);         
        }
        else
        {
            mortem.PlayDialogue(false);
        }
    }

}
