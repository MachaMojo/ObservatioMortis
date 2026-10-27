using UnityEngine;


public class UnitBase : MonoBehaviour
{
    public virtual void SetupEmp(Employee newEmployee)
    {
        
    }
    public virtual void LoadUnit(GameObject employee)
    {
        Debug.Log("No Unit loaded!");
    }
    public virtual void PlayDialogue()
    {
        
    }
}
